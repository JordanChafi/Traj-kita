const db = require('../utils/db');
const bcrypt = require('bcrypt');
const nodemailer = require('nodemailer');
const jwt = require('jsonwebtoken');
const twilio = require('twilio');
// const { TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN } = process.env;

// const clientTwilio = twilio(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN);

// Contrôleur pour l'inscription de l'utilisateur
exports.registerUser = async (req, res) => {
  try {
    const { lastName, firstName, email, phone, password } = req.body;

    const userExistsQuery = 'SELECT * FROM Users WHERE Email = ? OR Phone = ?';
    const existingUser = await db.query(userExistsQuery, [email, phone]);

    if (existingUser.length > 0) {
      return res.status(400).json({ error: 'L\'adresse e-mail ou le numéro de téléphone est déjà utilisé.' });
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    const insertUserQuery = 'INSERT INTO Users (LastName, FirstName, Email, Phone, Password) VALUES (?, ?, ?, ?, ?)';
    await db.query(insertUserQuery, [lastName, firstName, email, phone, hashedPassword]);

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
    const loginQuery = isEmail ? 'SELECT * FROM Users WHERE Email = ?' : 'SELECT * FROM Users WHERE Phone = ?';

    const result = await db.query(loginQuery, [identifier]);

    if (result.length > 0) {
      const isPasswordValid = await bcrypt.compare(password, result[0].Password);

      if (isPasswordValid) {
        const token = jwt.sign({ userId: result[0].Id }, 'votre_clé_secrète', { expiresIn: '1h' });
        res.cookie('access_token', token, { httpOnly: true, maxAge: 3600000 });
        res.status(200).json({ message: 'Connexion réussie', user: result[0] });
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
exports.getUserById = (req, res) => {
  const userId = req.params.userId;
  const sql = 'SELECT * FROM Users WHERE id = ?';
  db.query(sql, [userId], (err, result) => {
    if (err) {
      console.error(err);
      res.status(500).json({ error: 'Erreur lors de la récupération de l\'utilisateur' });
    } else {
      if (result.length > 0) {
        res.status(200).json({ user: result[0] });
      } else {
        res.status(404).json({ error: 'Utilisateur non trouvé' });
      }
    }
  });
};

// Contrôleur pour l'envoi du code de réinitialisation du mot de passe par e-mail ou numéro de téléphone
exports.forgotPassword = async (req, res) => {
  try {
    const { identifier } = req.body;

    // Vérifier si l'identificateur est un e-mail ou un numéro de téléphone
    const isEmail = /\S+@\S+\.\S+/.test(identifier);
    const isPhone = /^\d+$/.test(identifier);

    // Utiliser l'identificateur dans la requête SQL en conséquence
    const userQuery = isEmail
      ? 'SELECT * FROM Users WHERE Email = ?'
      : 'SELECT * FROM Users WHERE Phone = ?';

    const result = await db.query(userQuery, [identifier]);

    if (result.length > 0) {
      // Générer un code de réinitialisation à 5 chiffres
      const resetCode = generateResetCode();

      // Enregistrer le code de réinitialisation dans la base de données avec une expiration d'1 minute

      const updateCodeQuery = 'UPDATE Users SET ResetCode = ?, ResetCodeExpiry = DATE_ADD(NOW(), INTERVAL 10 MINUTE) WHERE Id = ?';
      // const updateCodeQuery = 'UPDATE Users SET ResetCode = ?, ResetCodeExpiry = DATE_ADD(NOW(), INTERVAL 1 HOUR) WHERE Id = ?';
      await db.query(updateCodeQuery, [resetCode, result[0].Id]);

      // Envoyer le code de réinitialisation par e-mail ou SMS en fonction de l'identificateur
      if (isEmail) {
        // Logique d'envoi par e-mail
        sendResetCodeByEmail(result[0].Email, resetCode);
      } else if (isPhone) {
        // Logique d'envoi par SMS
        sendResetCodeBySMS(result[0].Phone, resetCode);
      }

      res.status(200).json({ message: 'Code de réinitialisation du mot de passe envoyé avec succès' });
    } else {
      res.status(404).json({ error: 'Utilisateur non trouvé' });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la demande de réinitialisation du mot de passe' });
  }
};

// Fonction pour générer un code de réinitialisation à 5 chiffres
function generateResetCode() {
  return Math.floor(10000 + Math.random() * 90000).toString(); // Génère un code à 5 chiffres
}

// Fonction pour envoyer le code de réinitialisation par e-mail
function sendResetCodeByEmail(email, resetCode) {
  const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
      user: process.env.GMAIL_USER,
      pass: process.env.GMAIL_PASS,
    },
  });

  const mailOptions = {
    from: process.env.GMAIL_USER,
    to: email,
    subject: 'Code de réinitialisation de votre mot de passe',
    text: `Votre code de réinitialisation de votre mot de passe est : ${resetCode}`,
  };

  transporter.sendMail(mailOptions, (error, info) => {
    if (error) {
      console.error(error);
      reject(error); // Rejeter la promesse en cas d'erreur
    } else {
      console.log('E-mail envoyé : ' + info.response);
      resolve(); // Résoudre la promesse en cas de succès
      try {
        await sendResetCodeByEmail('destinataire@example.com', '12345');
        res.status(200).json({ message: 'Code de réinitialisation du mot de passe envoyé avec succès' });
      } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Erreur lors de l\'envoi du code de réinitialisation par e-mail' });
      }

    }
  });
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
    const otpCheckQuery = 'SELECT * FROM Users WHERE Id = ? AND ResetCode = ? AND ResetCodeExpiry > NOW()';
    const user = await db.query(otpCheckQuery, [userId, otpCode]);

    if (user.length === 1) {
      // Le code OTP est valide, mettez à jour le mot de passe
      const hashedPassword = await bcrypt.hash(newPassword, 10); // Hasher le nouveau mot de passe
      // Mettre à jour le mot de passe dans la base de données
      const updatePasswordQuery = 'UPDATE Users SET Password = ?, ResetCode = NULL, ResetCodeExpiry = NULL WHERE Id = ?';
      await db.query(updatePasswordQuery, [hashedPassword, userId]);

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
exports.updateUser = async (req, res) => {
  try {
    const userId = req.params.userId;
    const { name, email, phoneNumber, profilePhoto } = req.body;

    // Valider et nettoyer les données d'entrée si nécessaire

    const sql = 'UPDATE Users SET name = ?, email = ?, phoneNumber = ? WHERE id = ?';

    db.query(sql, [name, email, phoneNumber, userId], (err, result) => {
      if (err) {
        console.error(err);
        res.status(500).json({ error: 'Erreur lors de la mise à jour des informations utilisateur' });
      } else {
        res.status(200).json({ success: true, message: 'Informations utilisateur mises à jour avec succès' });
      }
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur inattendue lors de la mise à jour des informations utilisateur' });
  }
};

// Contrôleur pour la déconnexion
exports.logoutUser = async (req, res) => {
  try {
    // Destruction du jeton côté client (si vous utilisez des cookies)
    res.clearCookie('access_token');  // Assurez-vous que le nom du cookie correspond à celui que vous utilisez

    // Répondre avec succès
    res.status(200).json({ message: 'Déconnexion réussie' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erreur lors de la déconnexion' });
  }
};

// Contrôleur pour la suppression d'un utilisateur
exports.deleteUser = async (req, res) => {
  const userId = req.params.userId;
  const sql = 'DELETE FROM Users WHERE id = ?';  
  
  db.query(sql, [userId], (err, result) => {
    if (err) {
      console.error(err);
      res.status(500).json({ error: 'Erreur lors de la suppression de l\'utilisateur' });
    } else {
      res.status(200).json({ message: 'Utilisateur supprimé avec succès' });
    }
  });
};

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

    // Récupérer le mot de passe actuel de la base de données
    const getCurrentPasswordQuery = 'SELECT Password FROM Users WHERE Id = ?';
    const result = await db.query(getCurrentPasswordQuery, [userId]);

    if (result.length > 0) {
      // Vérifier si l'ancien mot de passe est correct
      const isOldPasswordValid = await bcrypt.compare(oldPassword, result[0].Password);

      if (isOldPasswordValid) {
        // Hasher le nouveau mot de passe
        const hashedNewPassword = await bcrypt.hash(newPassword, 10);

        // Mettre à jour le mot de passe dans la base de données
        const updatePasswordQuery = 'UPDATE Users SET Password = ? WHERE Id = ?';
        await db.query(updatePasswordQuery, [hashedNewPassword, userId]);

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

