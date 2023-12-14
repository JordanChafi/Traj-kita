// userModel.js
const db = require('../utils/db');
const bcrypt = require('bcrypt');

// Fonction pour créer un utilisateur dans la base de données
exports.createUser = async (lastName, firstName, email, phone, password) => {
  const insertUserQuery = 'INSERT INTO Users (LastName, FirstName, Email, Phone, Password) VALUES (?, ?, ?, ?, ?)';
  await db.query(insertUserQuery, [lastName, firstName, email, phone, password]);
};

// Fonction pour récupérer un utilisateur par e-mail
exports.getUserByEmail = async (email) => {
  const getUserQuery = 'SELECT * FROM Users WHERE Email = ?';
  const result = await db.query(getUserQuery, [email]);
  return result.length > 0 ? result[0] : null;
};

// Fonction pour récupérer un utilisateur par numéro de téléphone
exports.getUserByPhone = async (phone) => {
  const getUserQuery = 'SELECT * FROM Users WHERE Phone = ?';
  const result = await db.query(getUserQuery, [phone]);
  return result.length > 0 ? result[0] : null;
};

// Fonction pour récupérer un utilisateur par e-mail ou numéro de téléphone 
exports.getUserByEmailOrPhone = async (email, phone) => {
  const getUserQuery = 'SELECT * FROM Users WHERE Email = ? OR Phone = ?';
  const result = await db.query(getUserQuery, [email, phone]);
  return result.length > 0 ? result[0] : null;
};

// Fonction pour récupérer un utilisateur par ID
exports.getUserById = async (userId) => {
  const getUserQuery = 'SELECT * FROM Users WHERE id = ?';
  const result = await db.query(getUserQuery, [userId]);
  return result.length > 0 ? result[0] : null;
};

// Fonction pour mettre à jour les informations de l'utilisateur
exports.updateUser = async (userId, fullname, lastname, email, phoneNumber) => {
  const updateQuery = 'UPDATE Users SET fullname = ?, lastname = ?, email = ?, phoneNumber = ?, ProfilePhoto = ? WHERE id = ?';
  await db.query(updateQuery, [fullname, lastname, email, phoneNumber, profilePhoto, userId]);
};

// Fonction pour supprimer un utilisateur
exports.deleteUser = async (userId) => {
  const deleteQuery = 'DELETE FROM Users WHERE id = ?';
  await db.query(deleteQuery, [userId]);
};

// Fonction pour mettre à jour le mot de passe de l'utilisateur
exports.updatePassword = async (userId, newPassword) => {
  const updatePasswordQuery = 'UPDATE Users SET Password = ? WHERE Id = ?';
  await db.query(updatePasswordQuery, [newPassword, userId]);
};

// Fonction pour rechercher un utilisateur par adresse e-mail
exports.findUserByEmail = async (email) => {
  const query = 'SELECT * FROM Users WHERE Email = ?';
  const result = await db.query(query, [email]);
  return result.length > 0 ? result[0] : null;
};

// Fonction pour vérifier la correspondance du mot de passe
exports.comparePassword = async (hashedPassword, password) => {
  return await bcrypt.compare(password, hashedPassword);
};

// Fonction pour rechercher un utilisateur par adresse e-mail ou numéro de téléphone
exports.findUserByEmailOrPhone = async (email, phone) => {
  const query = 'SELECT * FROM Users WHERE Email = ? OR Phone = ?';
  const result = await db.query(query, [email, phone]);
  return result;
};

// Fonction pour insérer un nouvel utilisateur
exports.insertUser = async (lastName, firstName, email, phone, hashedPassword) => {
  const query = 'INSERT INTO Users (LastName, FirstName, Email, Phone, Password) VALUES (?, ?, ?, ?, ?)';
  await db.query(query, [lastName, firstName, email, phone, hashedPassword]);
};
