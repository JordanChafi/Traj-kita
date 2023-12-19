const {DataTypes} = require('sequelize');

module.exports = (sequelize) => {
  const Vehicule =  sequelize.define('Vehicule', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    userId: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
         model: 'User',
         key: 'ID',
       },
    },
    brand: {
      type: DataTypes.STRING(225),
      allowNull: true
    },
    model: {
      type: DataTypes.STRING(225),
      allowNull: true
    },
    color: {
      type: DataTypes.STRING(225),
      allowNull: true
    },
    immatNumber: {
      type: DataTypes.STRING(225),
      allowNull: true
    },
  }
//   ,{
//     sequelize,
//     tableName: 'address',
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
//         name: "UserID",
//         using: "BTREE",
//         fields: [
//           { name: "UserID" },
//         ]
//       },
//     ]
//   }
  );

  Vehicule.associate = (models) => {
   Vehicule.belongsTo(models.User, {
     foreignKey: 'userId',
     as: 'user',
   });
 };

 return Vehicule;
};