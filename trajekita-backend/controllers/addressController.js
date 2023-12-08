const addressModel = require('../models/addressModel');

// Contrôleur pour créer une adresse
exports.createAddress = async (req, res) => {
  try {
    const { userId, label, location } = req.body;
    await addressModel.createAddress(userId, label, location);
    res.status(200).json({ message: 'Adresse créée avec succès' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la création de l\'adresse' });
  }
};

// Contrôleur pour récupérer une adresse par ID
exports.getAddressById = async (req, res) => {
  try {
    const addressId = req.params.addressId;
    const address = await addressModel.getAddressById(addressId);
    if (address) {
      res.status(200).json({ address });
    } else {
      res.status(404).json({ error: 'Adresse non trouvée' });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la récupération de l\'adresse' });
  }
};

// Contrôleur pour récupérer toutes les adresses d'un utilisateur
exports.getAddressesByUserId = async (req, res) => {
  try {
    const userId = req.params.userId;
    const addresses = await addressModel.getAddressesByUserId(userId);
    res.status(200).json({ addresses });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la récupération des adresses de l\'utilisateur' });
  }
};

// Contrôleur pour mettre à jour une adresse
exports.updateAddress = async (req, res) => {
  try {
    const addressId = req.params.addressId;
    const { label, location } = req.body;
    await addressModel.updateAddress(addressId, label, location);
    res.status(200).json({ message: 'Adresse mise à jour avec succès' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la mise à jour de l\'adresse' });
  }
};

// Contrôleur pour récupérer les détails d'une adresse par ID
exports.getAddressDetailsById = async (req, res) => {
  try {
    const addressId = req.params.addressId;
    const address = await addressModel.getAddressById(addressId);
    if (address) {
      res.status(200).json({ address });
    } else {
      res.status(404).json({ error: 'Adresse non trouvée' });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la récupération des détails de l\'adresse' });
  }
};

// Contrôleur pour supprimer une adresse par ID
exports.deleteAddressById = async (req, res) => {
  try {
    const addressId = req.params.addressId;
    await addressModel.deleteAddressById(addressId);
    res.status(200).json({ message: 'Adresse supprimée avec succès' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la suppression de l\'adresse' });
  }
};
