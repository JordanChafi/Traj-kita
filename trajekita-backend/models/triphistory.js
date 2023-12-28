// const Sequelize = require('sequelize');
// module.exports = function(sequelize, DataTypes) {
//   return sequelize.define('triphistory', {
//     ID: {
//       autoIncrement: true,
//       type: DataTypes.INTEGER,
//       allowNull: false,
//       primaryKey: true
//     },
//     TripID: {
//       type: DataTypes.INTEGER,
//       allowNull: true
//     },
//     DateTime: {
//       type: DataTypes.DATE,
//       allowNull: true
//     }
//   }, {
//     sequelize,
//     tableName: 'triphistory',
//     timestamps: false,
//     indexes: [
//       {
//         name: "PRIMARY",
//         unique: true,
//         using: "BTREE",
//         fields: [
//           { name: "ID" },
//         ]
//       },
//       {
//         name: "TripID",
//         using: "BTREE",
//         fields: [
//           { name: "TripID" },
//         ]
//       },
//     ]
//   });
// };


const {DataTypes} = require('sequelize');

module.exports = function(sequelize) {
  const tripHistory = sequelize.define('tripHistory', {
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
    sequelize,
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

  return tripHistory
};
