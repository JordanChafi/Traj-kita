const express = require('express');
const { body } = require('express-validator');
const router = express.Router();
const userController = require('../controllers/userController');

// Routes pour les utilisateurs

// Inscription d'un utilisateur
router.post('/register',[body('email').isEmail().withMessage('Adresse email invalide'),body('phone').isMobilePhone().withMessage('Numero de telephone invalide').custom((value, { req }) => {
   // Vérifiez si le numéro de téléphone a au moins 10 chiffres
   const phoneNumber = value.replace(/\D/g, '');
   if (phoneNumber.length < 10) {
     throw new Error('Le numero de téléphone doit etre de 10 chiffres');
   }
   return true;
 })], userController.registerUser);

// Connexion d'un utilisateur
router.post('/login', userController.loginUser);

// Demande de réinitialisation de mot de passe
router.post('/forgot-password', userController.forgotPassword);

// Réinitialisation du mot de passe avec le jeton
router.post('/reset-password', userController.resetPassword);

// Changement de mot de passe

// Récupération d'un utilisateur par ID
router.get('/:userId', userController.getUserById);

// Mise à jour des informations utilisateur
router.put('/:userId', userController.updateUser);

// Suppression d'un utilisateur
router.delete('/:userId', userController.deleteUser);

// Déconnexion d'un utilisateur 
router.post('/logout', userController.logoutUser);

module.exports = router;