// tripHistoryController.js
const {tripHistory} = require('../models');

// Contrôleur pour enregistrer un trajet dans l'historique
exports.recordTripHistory = async (req, res) => {
  try {
    const { userId, tripId, dateTime, cost } = req.body;
    await TripHistory.create({
      userId,
      tripId,
      dateTime,
      cost,
    });
    res.status(200).json({ message: 'Trajet enregistré dans l\'historique avec succès' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de l\'enregistrement du trajet dans l\'historique' });
  }
};

// Contrôleur pour récupérer l'historique des trajets d'un passager
exports.getTripHistoryByUserId = async (req, res) => {
  try {
    const userId = req.params.userId;
    const history = await TripHistory.findAll({
      where: {
        userId: userId,
      },
    });
    res.status(200).json({ history });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la récupération de l\'historique des trajets du passager' });
  }
};

// Contrôleur pour récupérer l'historique des trajets par ID de trajet
exports.getTripHistoryByTripId = async (req, res) => {
  try {
    const tripId = req.params.tripId;
    const history = await TripHistory.findAll({
      where: {
        tripId: tripId,
      },
    });
    res.status(200).json({ history });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la récupération de l\'historique des trajets par ID de trajet' });
  }
};

// Contrôleur pour supprimer un enregistrement d'historique de trajet par ID
exports.deleteTripHistoryById = async (req, res) => {
  try {
    const historyId = req.params.historyId;
    await TripHistory.destroy({
      where: {
        id: historyId,
      },
    });
    res.status(200).json({ message: 'Enregistrement d\'historique de trajet supprimé avec succès' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la suppression de l\'enregistrement d\'historique de trajet' });
  }
};
