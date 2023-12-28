const { DataTypes } = require('sequelize');

module.exports = (sequelize) => {
  const Booking = sequelize.define('booking', {
    ID: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    TripID: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    BookingStatus: {
      type: DataTypes.ENUM('Pending', 'Accepted', 'Rejected'),
      allowNull: true
    },
    Amount: {
      type: DataTypes.DECIMAL(10, 2),
      allowNull: true
    }
  }, {
    tableName: 'booking',
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
        name: 'TripID',
        using: 'BTREE',
        fields: [
          { name: 'TripID' },
        ]
      },
    ]
  });

  return Booking;
};
