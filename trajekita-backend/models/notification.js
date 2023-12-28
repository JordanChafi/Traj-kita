const { DataTypes } = require('sequelize');

module.exports = (sequelize) => {
  const Notification = sequelize.define('notification', {
    ID: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    UserID: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    NotificationContent: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    NotificationStatus: {
      type: DataTypes.ENUM('Unread', 'Read'),
      allowNull: true
    }
  }, {
    tableName: 'notification',
    timestamps: false,
    indexes: [
      {
        name: 'PRIMARY',
        unique: true,
        using: 'BTREE',
        fields: [
          { name: 'ID' },
        ]
      },
      {
        name: 'UserID',
        using: 'BTREE',
        fields: [
          { name: 'UserID' },
        ]
      },
    ]
  });

  return Notification;
};
