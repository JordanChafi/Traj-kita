const {DataTypes} = require('sequelize');

module.exports = function(sequelize) {
  const Trip = sequelize.define('Trip', {
    ID: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    DepartureLocationLong: {
      type: DataTypes.DOUBLE,
      allowNull: true
    },
    DepartureLocationLat: {
      type: DataTypes.DOUBLE,
      allowNull: true
    },
    DestinationLocationLong: {
      type: DataTypes.DOUBLE,
      allowNull: true
    },
    DestinationLocationLat: {
      type: DataTypes.DOUBLE,
      allowNull: true
    },
    DepartureDateTime: {
      type: DataTypes.DATE,
      allowNull: true
    },
    AvailableSeats: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    Fare: {
      type: DataTypes.DECIMAL(10,2),
      allowNull: true
    },
    UserID: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    VehicleID: {
      type: DataTypes.INTEGER,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'Trip',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "ID" },
        ]
      },
      {
        name: "UserID",
        using: "BTREE",
        fields: [
          { name: "UserID" },
        ]
      },
      {
        name: "VehicleID",
        using: "BTREE",
        fields: [
          { name: "VehicleID" },
        ]
      },
    ]
  });

  return Trip
};
