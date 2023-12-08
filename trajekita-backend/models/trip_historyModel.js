// tripHistoryModel.js
const db = require('../utils/db');

// Fonction pour enregistrer un trajet dans l'historique
exports.recordTripHistory = async (passengerId, tripId, dateTime, cost) => {
  const insertHistoryQuery = 'INSERT INTO TripHistory (PassengerID, TripID, DateTime, Cost) VALUES (?, ?, ?, ?)';
  await db.query(insertHistoryQuery, [passengerId, tripId, dateTime, cost]);
};

// Fonction pour récupérer l'historique des trajets d'un passager
exports.getTripHistoryByPassengerId = async (passengerId) => {
  const getHistoryQuery = 'SELECT * FROM TripHistory WHERE PassengerID = ?';
  const result = await db.query(getHistoryQuery, [passengerId]);
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
