const db = require('../utils/db');

// Fonction pour créer un paiement dans la base de données
exports.createPayment = async (passengerId, tripId, amount, paymentStatus) => {
  const insertPaymentQuery = 'INSERT INTO Payment (PassengerID, TripID, Amount, PaymentStatus) VALUES (?, ?, ?, ?)';
  await db.query(insertPaymentQuery, [passengerId, tripId, amount, paymentStatus]);
};

// Fonction pour récupérer un paiement par ID
exports.getPaymentById = async (paymentId) => {
  const getPaymentQuery = 'SELECT * FROM Payment WHERE ID = ?';
  const result = await db.query(getPaymentQuery, [paymentId]);
  return result.length > 0 ? result[0] : null;
};

// Fonction pour récupérer tous les paiements d'un passager
exports.getPaymentsByPassengerId = async (passengerId) => {
  const getPaymentsQuery = 'SELECT * FROM Payment WHERE PassengerID = ?';
  const result = await db.query(getPaymentsQuery, [passengerId]);
  return result;
};

// Fonction pour mettre à jour le statut d'un paiement
exports.updatePaymentStatus = async (paymentId, paymentStatus) => {
  const updateQuery = 'UPDATE Payment SET PaymentStatus = ? WHERE ID = ?';
  await db.query(updateQuery, [paymentStatus, paymentId]);
};
