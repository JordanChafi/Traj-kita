const paymentModel = require('../models/paymentModel');

// Contrôleur pour créer un paiement
exports.createPayment = async (req, res) => {
  try {
    const { userId, tripId, amount, paymentStatus } = req.body;
    await paymentModel.createPayment(userId, tripId, amount, paymentStatus);
    res.status(200).json({ message: 'Paiement créé avec succès' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la création du paiement' });
  }
};

// Contrôleur pour récupérer un paiement par ID
exports.getPaymentById = async (req, res) => {
  try {
    const paymentId = req.params.paymentId;
    const payment = await paymentModel.getPaymentById(paymentId);
    if (payment) {
      res.status(200).json({ payment });
    } else {
      res.status(404).json({ error: 'Paiement non trouvé' });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la récupération du paiement' });
  }
};

// Contrôleur pour récupérer tous les paiements d'un passager
exports.getPaymentsByPassengerId = async (req, res) => {
  try {
    const userId = req.params.userId;
    const payments = await paymentModel.getPaymentsByPassengerId(passengerId);
    res.status(200).json({ payments });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la récupération des paiements du passager' });
  }
};

// Contrôleur pour mettre à jour le statut d'un paiement
exports.updatePaymentStatus = async (req, res) => {
  try {
    const paymentId = req.params.paymentId;
    const { paymentStatus } = req.body;
    await paymentModel.updatePaymentStatus(paymentId, paymentStatus);
    res.status(200).json({ message: 'Statut du paiement mis à jour avec succès' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la mise à jour du statut du paiement' });
  }
};
