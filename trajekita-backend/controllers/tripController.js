const {Trip} = require('../models');

// Fonction pour créer un trajet
exports.createTrip = async (req, res) => {
  try {
    const { departureLocationLong,departureLocationLat, destinationLocationLong,destinationLocationLat, departureDateTime, availableSeats, fare, userId } = req.body;
    await Trip.create({
      DepartureLocationLong: departureLocationLong,
      DepartureLocationLat: departureLocationLat,
      DestinationLocationLong: destinationLocationLong,
      DestinationLocationLat: destinationLocationLat,
      DepartureDateTime: departureDateTime, 
      AvailableSeats: availableSeats, 
      Fare: fare, 
      UserID: userId
    });

    res.status(201).json({ message: 'Trajet créé avec succès' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la création du trajet' });
  }
};


// Récupérer un trajet par ID
exports.getTripById = async (req, res) => {
  try {
    const tripId = req.params.tripId;
    const trip = await Trip.findOne({ where: {ID:tripId} });

    if (!trip) {
      return res.status(404).json({ message: 'Trajet non trouvé' });
    }

    res.status(200).json(trip);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la récupération du trajet par ID' });
  }
};

// Fonction pour récupérer tous les trajets d'un conducteur
exports.getTripsByUserId = async (req, res) => {
  try {
    const userId = req.params.driverId;
    const trips = await Trip.findAll({where:{UserID:userId}});
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

    const trip = await Trip.findOne({where:{ID:tripId}})

    if (!trip) {
      return res.status(404).json({ error: 'Trajet non trouvé' });
    }

    const { departureLocationLong,departureLocationLat, destinationLocationLong,destinationLocationLat, departureDateTime, availableSeats, fare } = req.body;

    await trip.update(
      {
        DepartureLocationLong: departureLocationLong,
        DepartureLocationLat: departureLocationLat,
        DestinationLocationLong: destinationLocationLong,
        DestinationLocationLat: destinationLocationLat,
        DepartureDateTime: departureDateTime, 
        AvailableSeats: availableSeats, 
        Fare: fare
      }
    );
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

    const trip = await Trip.findOne({where:{ID:tripId}})

    if (!trip) {
      return res.status(404).json({ error: 'Trajet non trouvé' });
    }

    await trip.destroy();

    res.status(200).json({ message: 'Trajet supprimé avec succès' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la suppression du trajet' });
  }
};
