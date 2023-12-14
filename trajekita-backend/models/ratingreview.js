const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('ratingreview', {
    ID: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    RatedDriverID: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    RatingPassengerID: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    Rating: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    Review: {
      type: DataTypes.TEXT,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'ratingreview',
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
        name: "RatedDriverID",
        using: "BTREE",
        fields: [
          { name: "RatedDriverID" },
        ]
      },
      {
        name: "RatingPassengerID",
        using: "BTREE",
        fields: [
          { name: "RatingPassengerID" },
        ]
      },
    ]
  });
};
