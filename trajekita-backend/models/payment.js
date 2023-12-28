const { DataTypes } = require('sequelize');

module.exports = (sequelize) => {
  const Payment = sequelize.define('payment', {
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
    TripID: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    Amount: {
      type: DataTypes.DECIMAL(10, 2),
      allowNull: true
    },
    PaymentStatus: {
      type: DataTypes.ENUM('Pending', 'Success', 'Failed'),
      allowNull: true
    }
  }, {
    tableName: 'payment',
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
      {
        name: 'TripID',
        using: 'BTREE',
        fields: [
          { name: 'TripID' },
        ]
      },
    ]
  });

  return Payment;
};
