// notificationModel.js
const db = require('../utils/db');

// Fonction pour créer une notification dans la base de données
exports.createNotification = async (recipientId, notificationContent, notificationStatus) => {
  const insertNotificationQuery = 'INSERT INTO Notification (RecipientID, NotificationContent, NotificationStatus) VALUES (?, ?, ?)';
  await db.query(insertNotificationQuery, [recipientId, notificationContent, notificationStatus]);
};

// Fonction pour récupérer toutes les notifications d'un utilisateur
exports.getNotificationsByRecipient = async (recipientId) => {
  const getNotificationsQuery = 'SELECT * FROM Notification WHERE RecipientID = ?';
  const result = await db.query(getNotificationsQuery, [recipientId]);
  return result;
};

// Fonction pour marquer toutes les notifications comme lues pour un utilisateur
exports.markAllNotificationsAsRead = async (recipientId) => {
  const markAsReadQuery = 'UPDATE Notification SET NotificationStatus = "Read" WHERE RecipientID = ?';
  await db.query(markAsReadQuery, [recipientId]);
};
