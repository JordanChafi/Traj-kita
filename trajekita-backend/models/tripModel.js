const db = require('../utils/db');

// Fonction pour créer un trajet dans la base de données
exports.createTrip = async (departureLocation, destinationLocation, departureDateTime, availableSeats, fare, driverId) => {
  const insertTripQuery = 'INSERT INTO Trip (DepartureLocation, DestinationLocation, DepartureDateTime, AvailableSeats, Fare, DriverID) VALUES (?, ?, ?, ?, ?, ?)';
  await db.query(insertTripQuery, [departureLocation, destinationLocation, departureDateTime, availableSeats, fare, driverId]);
};

// Fonction pour récupérer un trajet par ID
exports.getTripById = async (tripId) => {
  const getTripQuery = 'SELECT * FROM Trip WHERE ID = ?';
  const result = await db.query(getTripQuery, [tripId]);
  return result.length > 0 ? result[0] : null;
};

// Fonction pour récupérer tous les trajets d'un conducteur
exports.getTripsByDriverId = async (driverId) => {
  const getTripsQuery = 'SELECT * FROM Trip WHERE DriverID = ?';
  const result = await db.query(getTripsQuery, [driverId]);
  return result;
};

// Fonction pour mettre à jour les informations d'un trajet
exports.updateTrip = async (tripId, departureLocation, destinationLocation, departureDateTime, availableSeats, fare) => {
  const updateQuery = 'UPDATE Trip SET DepartureLocation = ?, DestinationLocation = ?, DepartureDateTime = ?, AvailableSeats = ?, Fare = ? WHERE ID = ?';
  await db.query(updateQuery, [departureLocation, destinationLocation, departureDateTime, availableSeats, fare, tripId]);
};

// Fonction pour supprimer un trajet par ID
exports.deleteTripById = async (tripId) => {
  const deleteQuery = 'DELETE FROM Trip WHERE ID = ?';
  await db.query(deleteQuery, [tripId]);
};
