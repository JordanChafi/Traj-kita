const express = require('express');
const router = express.Router();
const paymentController = require('../controllers/paymentController');

// Créer un nouveau paiement
router.post('/create', paymentController.createPayment);

// Récupérer un paiement par ID
router.get('/:paymentId', paymentController.getPaymentById);

// Récupérer tous les paiements d'un passager
router.get('/passenger/:passengerId', paymentController.getPaymentsByPassengerId);

// Mettre à jour le statut d'un paiement
router.put('/update-status/:paymentId', paymentController.updatePaymentStatus);

module.exports = router;
