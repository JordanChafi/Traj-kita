const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('trip', {
    ID: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    DepartureLocation: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    DestinationLocation: {
      type: DataTypes.STRING(255),
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
    tableName: 'trip',
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
};
