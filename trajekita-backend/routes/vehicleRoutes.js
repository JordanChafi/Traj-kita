// vehicleRoutes.js
const express = require('express');
const router = express.Router();
const vehiculeController = require('../controllers/vehiculeController');

// Créer un nouveau véhicule
router.post('/create', vehiculeController.createVehicule);

// Récupérer un véhicule par ID
router.get('/:vehiculeId', vehiculeController.getVehiculeById);

// Récupérer tous les véhicules d'un conducteur
router.get('/driver/:driverId', vehiculeController.getVehiculesByUserId);

// Mettre à jour les informations d'un véhicule
router.put('/:vehiculeId', vehiculeController.updateVehicule);

// Supprimer un véhicule par ID
router.delete('/:vehiculeId', vehiculeController.deleteVehiculeById);

module.exports = router;