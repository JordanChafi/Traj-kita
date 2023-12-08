// ratingReviewRoutes.js
const express = require('express');
const router = express.Router();
const ratingReviewController = require('../controllers/ratingReviewController');

// Créer un avis et commentaire
router.post('/create', ratingReviewController.createRatingReview);

// Récupérer tous les avis et commentaires d'un conducteur
router.get('/driver/:ratedDriverId', ratingReviewController.getRatingsAndReviewsForDriver);

// Récupérer tous les avis et commentaires d'un passager
router.get('/passenger/:ratingPassengerId', ratingReviewController.getRatingsAndReviewsByPassenger);

module.exports = router;
