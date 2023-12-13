const db = require('../utils/db');

// Fonction pour enregistrer un trajet dans l'historique
exports.recordTripHistory = async (userId, tripId, dateTime, cost) => {
  const insertHistoryQuery = 'INSERT INTO TripHistory (PassengerID, TripID, DateTime, Cost) VALUES (?, ?, ?, ?)';
  await db.query(insertHistoryQuery, [userId, tripId, dateTime, cost]);
};

// Fonction pour récupérer l'historique des trajets d'un passager
exports.getTripHistoryByUserId = async (userId) => {
  const getHistoryQuery = 'SELECT * FROM TripHistory WHERE UserID = ?';
  const result = await db.query(getHistoryQuery, [userId]);
  return result;
};

// Fonction pour récupérer l'historique des trajets par ID de trajet
exports.getTripHistoryByTripId = async (tripId) => {
  const getHistoryQuery = 'SELECT * FROM TripHistory WHERE TripID = ?';
  const result = await db.query(getHistoryQuery, [tripId]);
  return result;
};

// Fonction pour supprimer un enregistrement d'historique de trajet par ID
exports.deleteTripHistoryById = async (historyId) => {
  const deleteHistoryQuery = 'DELETE FROM TripHistory WHERE ID = ?';
  await db.query(deleteHistoryQuery, [historyId]);
};