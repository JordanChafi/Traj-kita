const {DataTypes} = require('sequelize');

module.exports = (sequelize) => {
  return sequelize.define('address', {
    ID: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    Location: {
      type: DataTypes.STRING(225),
      allowNull: true
    },
    Label: {
      type: DataTypes.STRING(225),
      allowNull: true
    },
    UserID: {
      type: DataTypes.INTEGER,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'address',
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
    ]
  });
};
