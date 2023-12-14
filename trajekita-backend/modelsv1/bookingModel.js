// bookingModel.js
const db = require('../utils/db');

// Fonction pour créer une réservation dans la base de données
exports.createBooking = async (tripId, bookingStatus, amount) => {
  const insertBookingQuery = 'INSERT INTO Booking (TripID, BookingStatus, Amount) VALUES (?, ?, ?)';
  await db.query(insertBookingQuery, [tripId, bookingStatus, amount]);
};

// Fonction pour récupérer toutes les réservations d'un passager
exports.getBookingsByUserId = async (userId) => {
  const getBookingsQuery = 'SELECT * FROM Booking WHERE UserID = ?';
  const result = await db.query(getBookingsQuery, [userId]);
  return result;
};

// Fonction pour récupérer toutes les réservations d'un trajet
exports.getBookingsByTripId = async (tripId) => {
  const getBookingsQuery = 'SELECT * FROM Booking WHERE TripID = ?';
  const result = await db.query(getBookingsQuery, [tripId]);
  return result;
};

// Fonction pour mettre à jour le statut d'une réservation
exports.updateBookingStatus = async (bookingId, newStatus) => {
  const updateQuery = 'UPDATE Booking SET BookingStatus = ? WHERE ID = ?';
  await db.query(updateQuery, [newStatus, bookingId]);
};
