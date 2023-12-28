// notificationRoutes.js
const express = require('express');
const router = express.Router();
const notificationController = require('../controllers/notificationController');

// Créer une notification 
router.post('/create', notificationController.createNotification);

// Récupérer toutes les notifications d'un utilisateur
router.get('/user/:userId', notificationController.getNotificationsByUser);

// Marquer toutes les notifications comme lues pour un utilisateur
router.put('/read-all/:userId', notificationController.markAllNotificationsAsRead);

module.exports = router;
