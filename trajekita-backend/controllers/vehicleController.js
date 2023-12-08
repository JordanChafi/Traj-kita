const vehicleModel = require('../models/vehicleModel');

// Contrôleur pour créer un nouveau véhicule
exports.createVehicle = async (req, res) => {
  try {
    const { driverId, make, model, color, immatNumber } = req.body;
    await vehicleModel.createVehicle(driverId, make, model, color, immatNumber);
    res.status(200).json({ message: 'Véhicule créé avec succès' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la création du véhicule' });
  }
};

// Contrôleur pour récupérer un véhicule par ID
exports.getVehicleById = async (req, res) => {
  try {
    const vehicleId = req.params.vehicleId;
    const vehicle = await vehicleModel.getVehicleById(vehicleId);

    if (vehicle) {
      res.status(200).json({ vehicle });
    } else {
      res.status(404).json({ error: 'Véhicule non trouvé' });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la récupération du véhicule' });
  }
};

// Contrôleur pour récupérer tous les véhicules d'un conducteur
exports.getVehiclesByDriverId = async (req, res) => {
  try {
    const driverId = req.params.driverId;
    const vehicles = await vehicleModel.getVehiclesByDriverId(driverId);
    res.status(200).json({ vehicles });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la récupération des véhicules du conducteur' });
  }
};

// Contrôleur pour mettre à jour les informations d'un véhicule
exports.updateVehicle = async (req, res) => {
  try {
    const vehicleId = req.params.vehicleId;
    const { make, model, color, immatNumber } = req.body;

    await vehicleModel.updateVehicle(vehicleId, make, model, color, immatNumber);
    res.status(200).json({ message: 'Informations du véhicule mises à jour avec succès' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la mise à jour du véhicule' });
  }
};

// Contrôleur pour supprimer un véhicule par ID
exports.deleteVehicleById = async (req, res) => {
  try {
    const vehicleId = req.params.vehicleId;
    await vehicleModel.deleteVehicleById(vehicleId);
    res.status(200).json({ message: 'Véhicule supprimé avec succès' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la suppression du véhicule' });
  }
};
