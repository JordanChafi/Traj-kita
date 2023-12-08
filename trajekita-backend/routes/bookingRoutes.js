// bookingRoutes.js
const express = require('express');
const router = express.Router();
const bookingController = require('../controllers/bookingController');

// Créer une réservation
router.post('/create', bookingController.createBooking);

// Récupérer toutes les réservations d'un passager
router.get('/passenger/:passengerId', bookingController.getBookingsByPassengerId);

// Récupérer toutes les réservations d'un trajet
router.get('/trip/:tripId', bookingController.getBookingsByTripId);

// Mettre à jour le statut d'une réservation
router.patch('/:bookingId', bookingController.updateBookingStatus);

module.exports = router;
