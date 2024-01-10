const {Trip} = require('../models');
const NodeGeocoder = require('node-geocoder');

// Configurer le géocodeur avec OpenStreetMap
const geocoder = NodeGeocoder({
  provider: 'openstreetmap',
  httpAdapter: 'https',
  formatter: null,
});

// Fonction pour créer un trajet
exports.createTrip = async (req, res) => {
  try {

    const { departureLocation, destinationLocation, departureDateTime, availableSeats, fare, userId, vehiculeId } = req.body;

    // Géocodage pour obtenir les coordonnées de départ
    const departureResult = await geocoder.geocode(departureLocation);
    const departureLocationLong = departureResult.length > 0 ? departureResult[0].longitude : null;
    const departureLocationLat = departureResult.length > 0 ? departureResult[0].latitude : null;

    // Géocodage pour obtenir les coordonnées de destination
    const destinationResult = await geocoder.geocode(destinationLocation);
    const destinationLocationLong = destinationResult.length > 0 ? destinationResult[0].longitude : null;
    const destinationLocationLat = destinationResult.length > 0 ? destinationResult[0].latitude : null;


    // setTimeout(async () => {
    //   await Trip.create({
    //     DepartureLocationLong: departureLocationLong,
    //     DepartureLocationLat: departureLocationLat,
    //     DestinationLocationLong: destinationLocationLong,
    //     DestinationLocationLat: destinationLocationLat,
    //     DepartureDateTime: departureDateTime, 
    //     AvailableSeats: availableSeats, 
    //     Fare: fare, 
    //     UserID: userId,
    //     VehiculeID: vehiculeId
    //   });
    const createTripPromise = () => new Promise(resolve => {
      setTimeout(async () => {
        await Trip.create({
          DepartureLocationLong: departureLocationLong,
          DepartureLocationLat: departureLocationLat,
          DestinationLocationLong: destinationLocationLong,
          DestinationLocationLat: destinationLocationLat,
          DepartureDateTime: departureDateTime, 
          AvailableSeats: availableSeats, 
          Fare: fare, 
          UserID: userId,
          VehiculeID: vehiculeId
        });
        resolve();
      }, 1000);
    });

    await createTripPromise();

    res.status(201).json({ message: 'Trajet créé avec succès' });

    //   res.status(201).json({ message: 'Trajet créé avec succès' });
    // },3000);

    // res.status(201).json({ message: 'Trajet créé avec succès' });
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

    // Fonction pour effectuer le reverse geocoding pour une paire de coordonnées
    const reverseGeocode = async (lat, long) => {

      try {
        const result = await geocoder.reverse({ lat: lat, lon: long });
        return result.length > 0 ? result[0].formattedAddress : null;
      } catch (error) {
        console.error("Erreur de connexion:", error);
        return error;
      }
      
    };


    const allTripsWithName = await Promise.all(trips.map(async (trip) => {
      const [departurePlaceName, destinationPlaceName] = await Promise.all([
        await reverseGeocode(trip.DepartureLocationLat, trip.DepartureLocationLong),
        await reverseGeocode(trip.DestinationLocationLat, trip.DestinationLocationLong)
      ]);
    
      return {
        ...trip,
        DeparturePlaceName: departurePlaceName,
        DestinationPlaceName: destinationPlaceName
      };
    }));

    // // Je recupere certaines données dans le resultat obtenu
    // const result = allTripsWithName.map(trips=>({
    //   trip: trips.dataValues,
    //   DeparturePlaceName: trips.DeparturePlaceName,
    //   DestinationPlaceName: trips.DestinationPlaceName
    // }))
    
    res.status(200).json(allTripsWithName);
   
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
