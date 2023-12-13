const notificationModel = require('../models/notificationModel');

// Contrôleur pour créer une notification
exports.createNotification = async (req, res) => {
  try {
    const { userId, notificationContent, notificationStatus } = req.body;

    await notificationModel.createNotification(userId, notificationContent, notificationStatus);

    res.status(201).json({ message: 'Notification créée avec succès' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la création de la notification' });
  }
};

// Contrôleur pour récupérer toutes les notifications d'un utilisateur
exports.getNotificationsByRecipient = async (req, res) => {
  try {
    const userId = req.params.userId;
    const notifications = await notificationModel.getNotificationsByUser(userId);

    res.status(200).json({ notifications });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la récupération des notifications de l\'utilisateur' });
  }
};

// Contrôleur pour marquer toutes les notifications comme lues pour un utilisateur
exports.markAllNotificationsAsRead = async (req, res) => {
  try {
    const userId = req.params.userId;

    await notificationModel.markAllNotificationsAsRead(userId);

    res.status(200).json({ message: 'Toutes les notifications ont été marquées comme lues' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors du marquage des notifications comme lues' });
  }
};