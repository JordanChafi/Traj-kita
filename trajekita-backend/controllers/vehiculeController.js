const {Vehicule, Address} = require('../models');

// Contrôleur pour créer un nouveau véhicule
exports.createVehicule = async (req, res) => {
  try {
    const { driverId, brand, model, color, immatNumber } = req.body;
    await Vehicule.create({
      userId:driverId,
      brand: brand, 
      model: model, 
      color: color, 
      immatNumber: immatNumber});
    res.status(200).json({ message: 'Véhicule créé avec succès' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la création du véhicule' });
  }
};

// Contrôleur pour récupérer un véhicule par ID
exports.getVehiculeById = async (req, res) => {
  try {
    const vehiculeId = req.params.vehiculeId;

    const vehicule = await Vehicule.findOne({
      where:{id:vehiculeId}
    });

    if (vehicule) {
      res.status(200).json({ vehicule });
    } else {
      res.status(404).json({ error: 'Véhicule non trouvé' });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la récupération du véhicule' });
  }
};

// Contrôleur pour récupérer tous les véhicules d'un conducteur
exports.getVehiculesByUserId = async (req, res) => {

  try {
    const userId = req.params.driverId;
    const vehicules = await Vehicule.findAll({
      where:{userId:userId}
    });
    res.status(200).json({ vehicules });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la récupération des véhicules du conducteur' });
  }
};

// Contrôleur pour mettre à jour les informations d'un véhicule
exports.updateVehicule = async (req, res) => {
  try {
    const vehiculeId = req.params.vehiculeId;
    const { brand, model, color, immatNumber } = req.body;

    await Vehicule.update(
      {
        brand: brand, 
        model: model, 
        color: color, 
        immatNumber: immatNumber
      },
      {
        where:{id: vehiculeId}
      }
    );

    res.status(200).json({ message: 'Informations du véhicule mises à jour avec succès' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la mise à jour du véhicule' });
  }
};

// Contrôleur pour supprimer un véhicule par ID
exports.deleteVehiculeById = async (req, res) => {
  try {
    const vehiculeId = req.params.vehiculeId;

    await Vehicule.destroy({
      where:{id:vehiculeId}
    });

    res.status(200).json({ message: 'Véhicule supprimé avec succès' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erreur lors de la suppression du véhicule' });
  }
};
