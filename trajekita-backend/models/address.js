const { DataTypes } = require('sequelize');

module.exports = (sequelize) => {
  const Address = sequelize.define('address', {
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
    tableName: 'address',
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
    ]
  });

  return Address;
};
