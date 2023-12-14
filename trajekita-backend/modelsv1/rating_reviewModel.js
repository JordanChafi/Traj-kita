// ratingReviewModel.js
const db = require('../utils/db');

// Fonction pour créer un avis et commentaire dans la base de données
exports.createRatingReview = async (ratedDriverId, ratingPassengerId, rating, review) => {
  const insertRatingReviewQuery = 'INSERT INTO RatingReview (RatedDriverID, RatingPassengerID, Rating, Review) VALUES (?, ?, ?, ?)';
  await db.query(insertRatingReviewQuery, [ratedDriverId, ratingPassengerId, rating, review]);
};

// Fonction pour récupérer tous les avis et commentaires d'un conducteur
exports.getRatingsAndReviewsForDriver = async (ratedDriverId) => {
  const getRatingsAndReviewsQuery = 'SELECT * FROM RatingReview WHERE RatedDriverID = ?';
  const result = await db.query(getRatingsAndReviewsQuery, [ratedDriverId]);
  return result;
};

// Fonction pour récupérer tous les avis et commentaires d'un passager
exports.getRatingsAndReviewsByPassenger = async (ratingPassengerId) => {
  const getRatingsAndReviewsQuery = 'SELECT * FROM RatingReview WHERE RatingPassengerID = ?';
  const result = await db.query(getRatingsAndReviewsQuery, [ratingPassengerId]);
  return result;
};
