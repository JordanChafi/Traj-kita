const db = require('../utils/db');

// Fonction pour créer une adresse dans la base de données
exports.createAddress = async (userId, label, location) => {
  const insertAddressQuery = 'INSERT INTO Address (UserID, Label, Location) VALUES (?, ?, ?)';
  await db.query(insertAddressQuery, [userId, label, location]);
};

// Fonction pour récupérer une adresse par ID
exports.getAddressById = async (addressId) => {
  const getAddressQuery = 'SELECT * FROM Address WHERE ID = ?';
  const result = await db.query(getAddressQuery, [addressId]);
  return result.length > 0 ? result[0] : null;
};

// Fonction pour récupérer toutes les adresses d'un utilisateur
exports.getAddressesByUserId = async (userId) => {
  const getAddressesQuery = 'SELECT * FROM Address WHERE UserID = ?';
  const result = await db.query(getAddressesQuery, [userId]);
  return result;
};

// Fonction pour mettre à jour une adresse
exports.updateAddress = async (addressId, label, location) => {
  const updateQuery = 'UPDATE Address SET Label = ?, Location = ? WHERE ID = ?';
  await db.query(updateQuery, [label, location, addressId]);
};

// Fonction pour supprimer une adresse par ID
exports.deleteAddressById = async (addressId) => {
  const deleteQuery = 'DELETE FROM Address WHERE ID = ?';
  await db.query(deleteQuery, [addressId]);
};
