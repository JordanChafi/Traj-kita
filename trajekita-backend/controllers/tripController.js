const tripModel = require('../models/tripModel');

// Fonction pour créer un trajet
exports.createTrip = async (req, res) => {
  try {
    const { departureLocation, destinationLocation, departureDateTime, availableSeats, fare, driverId } = req.body;
    await tripModel.createTrip(departureLocation, destinationLocation, departureDateTime, availableSeats, fare, driverId);
    res.status(201).json({ message: 'Trajet créé avec succès' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la création du trajet' });
  }
};

// Fonction pour récupérer un trajet par ID
exports.getTripById = async (req, res) => {
  try {
    const tripId = req.params.tripId;
    const trip = await tripModel.getTripById(tripId);
    if (trip) {
      res.status(200).json({ trip });
    } else {
      res.status(404).json({ error: 'Trajet non trouvé' });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la récupération du trajet' });
  }
};

// Fonction pour récupérer tous les trajets d'un conducteur
exports.getTripsByDriverId = async (req, res) => {
  try {
    const driverId = req.params.driverId;
    const trips = await tripModel.getTripsByDriverId(driverId);
    res.status(200).json({ trips });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la récupération des trajets du conducteur' });
  }
};

// Fonction pour mettre à jour les informations d'un trajet
exports.updateTrip = async (req, res) => {
  try {
    const tripId = req.params.tripId;
    const { departureLocation, destinationLocation, departureDateTime, availableSeats, fare } = req.body;
    await tripModel.updateTrip(tripId, departureLocation, destinationLocation, departureDateTime, availableSeats, fare);
    res.status(200).json({ message: 'Informations du trajet mises à jour avec succès' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la mise à jour du trajet' });
  }
};

// Fonction pour supprimer un trajet par ID
exports.deleteTripById = async (req, res) => {
  try {
    const tripId = req.params.tripId;
    await tripModel.deleteTripById(tripId);
    res.status(200).json({ message: 'Trajet supprimé avec succès' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la suppression du trajet' });
  }
};
