const {DataTypes} = require('sequelize');

module.exports = function(sequelize) {
  const TripHistory = sequelize.define('tripHistory', {
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
    DateTime: {
      type: DataTypes.DATE,
      allowNull: true
    },
  }, {
    tableName: 'triphistory',
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
        name: "TripID",
        using: "BTREE",
        fields: [
          { name: "TripID" },
        ]
      },
    ]
  });

  return TripHistory
};
