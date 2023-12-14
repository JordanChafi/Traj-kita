// notificationModel.js
const db = require('../utils/db');

// Fonction pour créer une notification dans la base de données
exports.createNotification = async (userId, notificationContent, notificationStatus) => {
  const insertNotificationQuery = 'INSERT INTO Notification (UserID, NotificationContent, NotificationStatus) VALUES (?, ?, ?)';
  await db.query(insertNotificationQuery, [userId, notificationContent, notificationStatus]);
};

// Fonction pour récupérer toutes les notifications d'un utilisateur
exports.getNotificationsByRecipient = async (userId) => {
  const getNotificationsQuery = 'SELECT * FROM Notification WHERE UserID = ?';
  const result = await db.query(getNotificationsQuery, [userId]);
  return result;
};

// Fonction pour marquer toutes les notifications comme lues pour un utilisateur
exports.markAllNotificationsAsRead = async (userId) => {
  const markAsReadQuery = 'UPDATE Notification SET NotificationStatus = "Read" WHERE UserID = ?';
  await db.query(markAsReadQuery, [userId]);
};
