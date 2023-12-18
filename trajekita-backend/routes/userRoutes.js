const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');

// Routes pour les utilisateurs

// Inscription d'un utilisateur
router.post('/register', userController.registerUser);

// Connexion d'un utilisateur
router.post('/login', userController.loginUser);

// Demande de réinitialisation de mot de passe
router.post('/forgot-password', userController.forgotPassword);

// Réinitialisation du mot de passe avec le jeton
router.post('/reset-password/:token', userController.resetPassword);

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