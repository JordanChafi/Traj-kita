// const notificationModel = require('../models/notificationModel');
const {Notification} = require('../models');

// Contrôleur pour créer une notification
exports.createNotification = async (req, res) => {
  try {
    const { userId, notificationContent, notificationStatus } = req.body;

    // await Notification.createNotification(userId, notificationContent, notificationStatus);
    await Notification.create({
      UserId: userId,
      Content: notificationContent,
      Status: notificationStatus,
    });

    res.status(201).json({ message: 'Notification créée avec succès' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la création de la notification' });
  }
};

// Contrôleur pour récupérer toutes les notifications d'un utilisateur
exports.getNotificationsByUser = async (req, res) => {
  try {
    const userId = req.params.userId;
    // const notifications = await Notification.getNotificationsByUser(userId);
    const notifications = await Notification.findAll({
      where: { UserId: userId },
    });

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

    // await Notification.markAllNotificationsAsRead(userId);
    await Notification.update(
      { Status: 'read' },
      {
        where: { UserId: userId, Status: 'unread' },
      }
    );

    res.status(200).json({ message: 'Toutes les notifications ont été marquées comme lues' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors du marquage des notifications comme lues' });
  }
};