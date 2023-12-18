// const { DataTypes , Sequelize} = require('sequelize');
// const sequelize = require('../config/connexion_db'); 

module.exports = function (sequelize, DataTypes) {
  const User =  sequelize.define('User', {
    ID: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    FirstName: {
      type: DataTypes.STRING(25),
      allowNull: true
    },
    LastName: {
      type: DataTypes.STRING(25),
      allowNull: true
    },
    Email: {
      type: DataTypes.STRING(100),
      allowNull: true,
      unique: "Email"
    },
    PhoneNumber: {
      type: DataTypes.STRING(20),
      allowNull: true,
      unique: "PhoneNumber"
    },
    Password: {
      type: DataTypes.STRING(200),
      allowNull: true
    },
    ResetCode: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    ResetCodeExpiry: {
      type: DataTypes.DATE,
      allowNull: true
    },
    ProfilePhoto: {
      type: DataTypes.STRING(255),
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'User',
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
        name: "Email",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "Email" },
        ]
      },
      {
        name: "PhoneNumber",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "PhoneNumber" },
        ]
      },
    ]
  });

  return User
};
