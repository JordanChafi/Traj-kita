const express = require('express');
const router = express.Router();
const tripController = require('../controllers/tripController');

// Créer un nouveau trajet
router.post('/create', tripController.createTrip);

// Récupérer un trajet par ID
router.get('/:tripId', tripController.getTripById);

// Récupérer tous les trajets d'un conducteur
router.get('/driver/:driverId', tripController.getTripsByDriverId);

// Mettre à jour les informations d'un trajet
router.put('/:tripId', tripController.updateTrip);

// Supprimer un trajet par ID
router.delete('/:tripId', tripController.deleteTripById);

module.exports = router;


