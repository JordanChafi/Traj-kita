// tripHistoryRoutes.js
const express = require('express');
const router = express.Router();
const tripHistoryController = require('../controllers/trip_historyController');

// Enregistrement d'un trajet dans l'historique
router.post('/', tripHistoryController.recordTripHistory);

// Récupération de l'historique des trajets d'un passager
router.get('/passenger/:passengerId', tripHistoryController.getTripHistoryByUserId);

// Récupération de l'historique des trajets par ID de trajet
router.get('/trip/:tripId', tripHistoryController.getTripHistoryByTripId);

// Suppression d'un enregistrement d'historique de trajet par ID
router.delete('/:historyId', tripHistoryController.deleteTripHistoryById);

module.exports = router;
