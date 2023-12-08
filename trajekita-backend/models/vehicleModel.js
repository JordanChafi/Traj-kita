// vehicleModel.js
const db = require('../utils/db');

// Fonction pour créer un véhicule dans la base de données
exports.createVehicle = async (driverId, make, model, color, immatNumber) => {
  const insertVehicleQuery = 'INSERT INTO Vehicle (DriverID, Make, Model, Color, ImmatNumber) VALUES (?, ?, ?, ?, ?, ?)';
  await db.query(insertVehicleQuery, [driverId, make, model, color, immatNumber]);
};

// Fonction pour récupérer un véhicule par ID
exports.getVehicleById = async (vehicleId) => {
  const getVehicleQuery = 'SELECT * FROM Vehicle WHERE ID = ?';
  const result = await db.query(getVehicleQuery, [vehicleId]);
  return result.length > 0 ? result[0] : null;
};

// Fonction pour récupérer tous les véhicules d'un conducteur
exports.getVehiclesByDriverId = async (driverId) => {
  const getVehiclesQuery = 'SELECT * FROM Vehicle WHERE DriverID = ?';
  const result = await db.query(getVehiclesQuery, [driverId]);
  return result;
};

// Fonction pour mettre à jour les informations d'un véhicule
exports.updateVehicle = async (vehicleId, make, model, color, immatNumber) => {
  const updateQuery = 'UPDATE Vehicle SET Make = ?, Model = ?, Color = ?, ImmatNumber = ? WHERE ID = ?';
  await db.query(updateQuery, [make, model, color, immatNumber, vehicleId]);
};

// Fonction pour supprimer un véhicule par ID
exports.deleteVehicleById = async (vehicleId) => {
  const deleteQuery = 'DELETE FROM Vehicle WHERE ID = ?';
  await db.query(deleteQuery, [vehicleId]);
};
