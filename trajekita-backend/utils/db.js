// utils/db.js
const mysql = require('mysql');

// Créer une connexion à la base de données
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '', 
  database: 'db_trajekita',
});

// Connecter à la base de données
db.connect((err) => {
  if (err) {8
    console.error('Erreur de connexion à la base de données :', err);
  } else {
    console.log('Connecté à la base de données MySQL');
  }
});

module.exports = db;
