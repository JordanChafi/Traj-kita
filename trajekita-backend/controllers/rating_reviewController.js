// ratingReviewController.js
const ratingReviewModel = require('../models/rating_reviewModel');

// Contrôleur pour créer un avis et commentaire
exports.createRatingReview = async (req, res) => {
  try {
    const { ratedDriverId, ratingPassengerId, rating, review } = req.body;

    await ratingReviewModel.createRatingReview(ratedDriverId, ratingPassengerId, rating, review);

    res.status(201).json({ message: 'Avis et commentaire créés avec succès' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la création de l\'avis et du commentaire' });
  }
};

// Contrôleur pour récupérer tous les avis et commentaires d'un conducteur
exports.getRatingsAndReviewsForDriver = async (req, res) => {
  try {
    const ratedDriverId = req.params.ratedDriverId;
    const ratingsAndReviews = await ratingReviewModel.getRatingsAndReviewsForDriver(ratedDriverId);

    res.status(200).json({ ratingsAndReviews });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la récupération des avis et commentaires du conducteur' });
  }
};

// Contrôleur pour récupérer tous les avis et commentaires d'un passager
exports.getRatingsAndReviewsByPassenger = async (req, res) => {
  try {
    const ratingPassengerId = req.params.ratingPassengerId;
    const ratingsAndReviews = await ratingReviewModel.getRatingsAndReviewsByPassenger(ratingPassengerId);

    res.status(200).json({ ratingsAndReviews });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la récupération des avis et commentaires du passager' });
  }
};
