const express = require('express');
const router = express.Router();
const addressController = require('../controllers/addressController');

// Créer une nouvelle adresse
router.post('/create', addressController.createAddress);

// Récupérer une adresse par ID
router.get('/:addressId', addressController.getAddressById);

// Récupérer toutes les adresses d'un utilisateur
router.get('/user/:userId', addressController.getAddressesByUserId);

// Mettre à jour une adresse
router.put('/update/:addressId', addressController.updateAddress);

// Récupérer les détails d'une adresse par ID
router.get('/details/:addressId', addressController.getAddressDetailsById);

// Supprimer une adresse par ID
router.delete('/delete/:addressId', addressController.deleteAddressById);

module.exports = router;
