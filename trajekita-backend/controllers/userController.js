const db = require('../utils/db');
const { Op } = require('sequelize');
const bcrypt = require('bcrypt');
const createTransporter = require('../config/nodemailer');
const jwt = require('jsonwebtoken');
const twilio = require('twilio');
const { User } = require('../models');

// const { TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN } = process.env;

// const clientTwilio = twilio(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN);

// Contrôleur pour l'inscription de l'utilisateur
exports.registerUser = async (req, res) => {
  try {
    const { lastName, firstName, email, phone, password } = req.body;


    // const userExistsQuery = 'SELECT * FROM Users WHERE Email = ? OR PhoneNumber = ?';
    // const existingUser = await db.query(userExistsQuery, [email, phone]);

    const user = await User.findOne({ where: {
        [Op.or]: [
          { Email: email }, 
          {PhoneNumber: phone}
        ]
      }}
    );


    if (user != null) {
      return res.status(400).json({ error: 'L\'adresse e-mail ou le numéro de téléphone est déjà utilisé.' });
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    // const insertUserQuery = 'INSERT INTO Users (LastName, FirstName, Email, PhoneNumber, Password) VALUES (?, ?, ?, ?, ?)';
    // await db.query(insertUserQuery, [lastName, firstName, email, phone, hashedPassword]);

    // Enregistrement de l'utilisateur dans la base de données
    await User.create({
      LastName: lastName,
      FirstName: firstName,
      PhoneNumber: phone,
      Email: email,
      Password: hashedPassword,
    });

    res.status(200).json({ message: 'Utilisateur enregistré avec succès' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de l\'inscription de l\'utilisateur' });
  }
};

// Contrôleur pour la connexion de l'utilisateur
exports.loginUser = async (req, res) => {
  try {
    const { identifier, password } = req.body;

    const isEmail = /\S+@\S+\.\S+/.test(identifier);
    
    // Utilisation de Sequelize pour trouver l'utilisateur
    const user = await User.findOne({ where: {
        [Op.or]: [
          { Email: identifier }, 
          {PhoneNumber: identifier}
        ]
      }}
    );

    if (user) {
      // Utilisation de bcrypt pour vérifier le mot de passe
      const isPasswordValid = await bcrypt.compare(password, user.Password);

      if (isPasswordValid) {
        // Utilisation de jwt pour créer un token
        const token = jwt.sign({ userId: user.Id }, 'votre_clé_secrète', { expiresIn: '1h' });

        // Configuration du cookie et envoi de la réponse
        res.cookie('access_token', token, { httpOnly: true, maxAge: 3600000 });
        res.status(200).json({ message: 'Connexion réussie', user });
      } else {
        res.status(401).json({ error: 'Mot de passe incorrect' });
      }
    } else {
      res.status(404).json({ error: 'Utilisateur non trouvé' });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la connexion de l\'utilisateur' });
  }
};


// Contrôleur pour récupérer un utilisateur par ID
exports.getUserById = async (req, res) => {
  const userId = req.params.userId;
  // const sql = 'SELECT * FROM Users WHERE id = ?';
  const user = await User.findOne({where:{ID: userId}})
  if (user!=null) {
    res.status(200).json({ user: user });
  } else {
    res.status(400).json({ error: 'Utilisateur n\'existe pas' });
  }
  // db.query(sql, [userId], (err, result) => {
  //   if (err) {
  //     console.error(err);
  //     res.status(500).json({ error: 'Erreur lors de la récupération de l\'utilisateur' });
  //   } else {
  //     if (result.length > 0) {
  //       res.status(200).json({ user: result[0] });
  //     } else {
  //       res.status(404).json({ error: 'Utilisateur non trouvé' });
  //     }
  //   }
  // });
};

// Contrôleur pour l'envoi du code de réinitialisation du mot de passe par e-mail ou numéro de téléphone
exports.forgotPassword = async (req, res) => {
  try {

    const { identifier } = req.body;

    // Vérifier si l'identificateur est un e-mail ou un numéro de téléphone
    const isEmail = /\S+@\S+\.\S+/.test(identifier);
    const isPhone = /^\d+$/.test(identifier);


    const user =  await User.findOne({
      where:{
        [Op.or]:[
          {
            Email: identifier
          },
          {
            PhoneNumber: identifier
          }
        ]
        
      }
    })

    if(!user){
      return res.json({message: "Utilisateur non trouvé"})
    }


    const reset_code = generateResetCode();
    const date_code = new Date(new Date().getTime() + 2 * 60*1000)
    
    const result = await User.update(
      {
        ResetCode: reset_code,
        ResetCodeExpiry: date_code,
      },
      {
        where: {
          id: user.ID,
        },
      }
    );

    if (result) {

      if (isEmail) {

        // Logique d'envoi par e-mail
        const sender = sendResetCodeByEmail(identifier, user.ResetCode);

        if (sender) {
          res.status(201).json({message: "Email envoyé avec succès"})
        } else {
          res.status(400).json({message: "Erreur lors de l'envoie du mail"})
        }
      }else {
        // Logique d'envoi par SMS
        sendResetCodeBySMS(user.PhoneNumber, reset_code);
      } 

    } else {
      res.status(403).json({error: "Erreur d'enregistrement des données"})
    }
  } catch (error) {
    console.error('Erreur dans le contrôleur forgotPassword:', error);

    // Affichez les détails spécifiques de l'erreur
    if (error.name === 'SequelizeDatabaseError') {
      console.error('Erreur de base de données Sequelize:', error.message);
    }
    res.status(500).json({ error: 'Erreur lors de la demande de réinitialisation du mot de passe' });
  }
};

// Fonction pour générer un code de réinitialisation à 5 chiffres
function generateResetCode() {
  return Math.floor(10000 + Math.random() * 90000).toString(); // Génère un code à 5 chiffres
}


// Fonction pour envoyer le code de réinitialisation par e-mail
async function sendResetCodeByEmail(email, resetCode) {

  const optionsEmail = {
    from: 'parfaitkouamemks@gmail.com',
    to: email,
    subject: "Reinitialisation Mot de passe",
    text: "Veuillez reinitialiser votre compte avec ce code : "+resetCode,
  };


  try {
    const transporter = await createTransporter();
    await transporter.sendMail(optionsEmail);
    return true
  } catch (erreur) {
    console.error('Erreur lors de l\'envoi de l\'e-mail :', erreur);
    return false
  }
}


// Fonction pour envoyer le code de réinitialisation par SMS
async function sendResetCodeBySMS(phoneNumber, resetCode) {
  const accountSid = 'votre-account-sid';
  const authToken = 'votre-auth-token';

  try {
    await client.messages.create({
      body: `Votre code de réinitialisation du mot de passe est : ${resetCode}`,
      from: 'votre-numero-twilio',
      to: phoneNumber,
    });
  } catch (error) {
    console.error(error);
    throw error; // Lancer l'erreur pour que le contrôleur puisse la gérer 
  }
}

// Contrôleur pour la réinitialisation du mot de passe
exports.resetPassword = async (req, res) => {
  try {
    const { userId, newPassword, otpCode } = req.body;

    // Vérifier si le code OTP est valide pour l'utilisateur
    const user = await User.findOne({
      where: {
        id: userId,
        resetCode: otpCode,
        resetCodeExpiry: { [Op.gt]: new Date() },
      },
    });

    if (user) {
      // Le code OTP est valide, mettez à jour le mot de passe
      const hashedPassword = await bcrypt.hash(newPassword, 10); // Hasher le nouveau mot de passe

      // Mettre à jour le mot de passe dans la base de données
      await User.update(
        {
          password: hashedPassword,
          resetCode: null,
          resetCodeExpiry: null,
        },
        {
          where: {
            id: userId,
          },
        }
      );

      res.status(200).json({ message: 'Réinitialisation du mot de passe réussie' });
    } else {
      res.status(401).json({ error: 'Code OTP invalide ou expiré' });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la réinitialisation du mot de passe' });
  }
};

// Contrôleur pour la mise à jour des informations utilisateur
// exports.updateUser = async (req, res) => {
//   try {
//     const userId = req.params.userId;
//     const { fullname, lastname, email, phoneNumber, profilePhoto } = req.body;

//     // Valider et nettoyer les données d'entrée si nécessaire

//     const sql = 'UPDATE Users SET fullname = ?, lastname = ?, email = ?, phoneNumber = ?, profilePhoto = ?, WHERE id = ?';

//     db.query(sql, [fullname, lastname, email, phoneNumber, profilePhoto, userId], (err, result) => {
//       if (err) {
//         console.error(err);
//         res.status(500).json({ error: 'Erreur lors de la mise à jour des informations utilisateur' });
//       } else {
//         res.status(200).json({ success: true, message: 'Informations utilisateur mises à jour avec succès' });
//       }
//     });
//   } catch (error) {
//     console.error(error);
//     res.status(500).json({ error: 'Erreur inattendue lors de la mise à jour des informations utilisateur' });
//   }
// };

// Contrôleur pour la mise à jour des informations utilisateur
exports.updateUser = async (req, res) => {
  try {
    const userId = req.params.userId;
    const { fullname, lastname, email, phoneNumber, profilePhoto } = req.body;

    // Valider et nettoyer les données d'entrée si nécessaire

    const user = await User.findByPk(userId);

    if (user) {
      // Mettre à jour les informations utilisateur dans la base de données
      await user.update({
        fullname: fullname,
        lastname: lastname,
        email: email,
        phoneNumber: phoneNumber,
        profilePhoto: profilePhoto,
      });

      res.status(200).json({ success: true, message: 'Informations utilisateur mises à jour avec succès' });
    } else {
      res.status(404).json({ error: 'Utilisateur non trouvé' });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur inattendue lors de la mise à jour des informations utilisateur' });
  }
};

// Contrôleur pour la déconnexion
// exports.logoutUser = async (req, res) => {
//   try {
//     // Destruction du jeton côté client
//     res.clearCookie('access_token');  // Assurez-vous que le nom du cookie correspond à celui que vous utilisez

//     // Répondre avec succès
//     res.status(200).json({ message: 'Déconnexion réussie' });
//   } catch (error) {
//     console.error(error);
//     res.status(500).json({ message: 'Erreur lors de la déconnexion' });
//   }
// };

// Contrôleur pour la déconnexion
exports.logoutUser = async (req, res) => {
  try {
    // Destruction du jeton côté client 
    res.clearCookie('access_token');  // Assurez-vous que le nom du cookie correspond à celui que vous utilisez

    // Répondre avec succès
    res.status(200).json({ message: 'Déconnexion réussie' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erreur lors de la déconnexion' });
  }
};

// Contrôleur pour la suppression d'un utilisateur
// exports.deleteUser = async (req, res) => {
//   const userId = req.params.userId;
//   const sql = 'DELETE FROM Users WHERE id = ?';  
  
//   db.query(sql, [userId], (err, result) => {
//     if (err) {
//       console.error(err);
//       res.status(500).json({ error: 'Erreur lors de la suppression de l\'utilisateur' });
//     } else {
//       res.status(200).json({ message: 'Utilisateur supprimé avec succès' });
//     }
//   });
// };

// Contrôleur pour la suppression d'un utilisateur
exports.deleteUser = async (req, res) => {
  try {
    const userId = req.params.userId;

    // Recherche de l'utilisateur à supprimer
    const user = await User.findByPk(userId);

    if (user) {
      // Supprimer l'utilisateur de la base de données
      await user.destroy();

      res.status(200).json({ message: 'Utilisateur supprimé avec succès' });
    } else {
      res.status(404).json({ error: 'Utilisateur non trouvé' });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la suppression de l\'utilisateur' });
  }
};

// Contrôleur pour la modification du mot de passe
// exports.changePassword = async (req, res) => {
//   try {
//     const userId = req.user.userId; // Assurez-vous que vous avez le userId à partir de l'authentification

//     // Récupérer les données du formulaire
//     const { oldPassword, newPassword, confirmPassword } = req.body;

//     // Vérifier si le nouveau mot de passe et la confirmation correspondent
//     if (newPassword !== confirmPassword) {
//       return res.status(400).json({ error: 'Le nouveau mot de passe et la confirmation ne correspondent pas.' });
//     }

//     // Récupérer le mot de passe actuel de la base de données
//     const getCurrentPasswordQuery = 'SELECT Password FROM Users WHERE Id = ?';
//     const result = await db.query(getCurrentPasswordQuery, [userId]);

//     if (result.length > 0) {
//       // Vérifier si l'ancien mot de passe est correct
//       const isOldPasswordValid = await bcrypt.compare(oldPassword, result[0].Password);

//       if (isOldPasswordValid) {
//         // Hasher le nouveau mot de passe
//         const hashedNewPassword = await bcrypt.hash(newPassword, 10);

//         // Mettre à jour le mot de passe dans la base de données
//         const updatePasswordQuery = 'UPDATE Users SET Password = ? WHERE Id = ?';
//         await db.query(updatePasswordQuery, [hashedNewPassword, userId]);

//         res.status(200).json({ message: 'Mot de passe modifié avec succès' });
//       } else {
//         res.status(401).json({ error: 'Ancien mot de passe incorrect' });
//       }
//     } else {
//       res.status(404).json({ error: 'Utilisateur non trouvé' });
//     }
//   } catch (error) {
//     console.error(error);
//     res.status(500).json({ error: 'Erreur lors de la modification du mot de passe' });
//   }
// };

// Contrôleur pour la modification du mot de passe
exports.changePassword = async (req, res) => {
  try {
    const userId = req.user.userId; // Assurez-vous que vous avez le userId à partir de l'authentification

    // Récupérer les données du formulaire
    const { oldPassword, newPassword, confirmPassword } = req.body;

    // Vérifier si le nouveau mot de passe et la confirmation correspondent
    if (newPassword !== confirmPassword) {
      return res.status(400).json({ error: 'Le nouveau mot de passe et la confirmation ne correspondent pas.' });
    }

    // Récupérer l'utilisateur de la base de données
    const user = await User.findByPk(userId);

    if (user) {
      // Vérifier si l'ancien mot de passe est correct
      const isOldPasswordValid = await bcrypt.compare(oldPassword, user.password);

      if (isOldPasswordValid) {
        // Hasher le nouveau mot de passe
        const hashedNewPassword = await bcrypt.hash(newPassword, 10);

        // Mettre à jour le mot de passe dans la base de données
        await user.update({ password: hashedNewPassword });

        res.status(200).json({ message: 'Mot de passe modifié avec succès' });
      } else {
        res.status(401).json({ error: 'Ancien mot de passe incorrect' });
      }
    } else {
      res.status(404).json({ error: 'Utilisateur non trouvé' });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la modification du mot de passe' });
  }
};

