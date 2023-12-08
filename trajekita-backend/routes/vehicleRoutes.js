// vehicleRoutes.js
const express = require('express');
const router = express.Router();
const vehicleController = require('../controllers/vehicleController');

// Créer un nouveau véhicule
router.post('/create', vehicleController.createVehicle);

// Récupérer un véhicule par ID
router.get('/:vehicleId', vehicleController.getVehicleById);

// Récupérer tous les véhicules d'un conducteur
router.get('/driver/:driverId', vehicleController.getVehiclesByDriverId);

// Mettre à jour les informations d'un véhicule
router.put('/:vehicleId', vehicleController.updateVehicle);

// Supprimer un véhicule par ID
router.delete('/:vehicleId', vehicleController.deleteVehicleById);

module.exports = router;
