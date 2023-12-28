// bookingController.js
const { Booking } = require('../models');

// Contrôleur pour créer une réservation
exports.createBooking = async (req, res) => {
  try {
    const { tripId, amount } = req.body;

    // Vous pouvez définir le statut de réservation comme "Pending" par défaut
    const bookingStatus = 'Pending';

    await Booking.create({
      TripId: tripId,
      Status: bookingStatus,
      Amount: amount,
    });

    res.status(201).json({ message: 'Réservation créée avec succès' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la création de la réservation' });
  }
};

// Contrôleur pour récupérer toutes les réservations d'un passager
exports.getBookingsByUserId = async (req, res) => {
  try {
    const userId = req.params.userId;
    const bookings = await Booking.findAll({
      where: { PassengerId: userId },
    });

    res.status(200).json({ bookings });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la récupération des réservations du passager' });
  }
};

// Contrôleur pour récupérer toutes les réservations d'un trajet
exports.getBookingsByTripId = async (req, res) => {
  try {
    const tripId = req.params.tripId;
    const bookings = await Booking.findAll({
      where: { TripId: tripId },
    });

    res.status(200).json({ bookings });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la récupération des réservations du trajet' });
  }
};

// Contrôleur pour mettre à jour le statut d'une réservation
exports.updateBookingStatus = async (req, res) => {
  try {
    const bookingId = req.params.bookingId;
    const { newStatus } = req.body;

    await Booking.update(
      { Status: newStatus },
      {
        where: { id: bookingId },
      }
    );

    res.status(200).json({ message: 'Statut de réservation mis à jour avec succès' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la mise à jour du statut de la réservation' });
  }
};
