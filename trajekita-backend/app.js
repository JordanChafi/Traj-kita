require('dotenv').config();
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const db = require('./utils/db');
const { sequelize } = require('./models');

const app = express();

// Middleware CORS
app.use(cors({ origin : '*' }));

app.use(express.urlencoded({extended: true}))

// Middleware pour parser le corps des requêtes en JSON
app.use(bodyParser.json());

// Configurer les routes
const userRoutes = require('./routes/userRoutes');
// const tripRoutes = require('./routes/tripRoutes');
// const paymentRoutes = require('./routes/paymentRoutes');
const vehiculeRoutes = require('./routes/vehiculeRoutes');
// const trip_historyRoutes = require('./routes/Trip_historyRoutes');
// const rating_reviewRoutes = require('./routes/rating_reviewRoutes');
// const addressRoutes = require('./routes/addressRoutes');
// const bookingRoutes = require('./routes/bookingRoutes');
// const notificationRoutes = require('./routes/notificationRoutes');

// Utiliser les routes
app.use('/api/users', userRoutes);
// app.use('/trips', tripRoutes);
// app.use('/payments', paymentRoutes);
// app.use('/address', addressRoutes);
// app.use('/booking', bookingRoutes);
// app.use('/tripsHistory', trip_historyRoutes);
app.use('/api/vehicule', vehiculeRoutes);
// app.use('/rating_review', rating_reviewRoutes);
// app.use('/notification', notificationRoutes);

// Lancer le serveur
const port = process.env.PORT || 4000;
const host ='192.168.1.6';
// const host = "localhost";

sequelize.sync().then(() => {
  console.log('Base de données synchronisée avec succès');
  app.listen(port,host, () => {
    console.log(`Serveur en cours d'exécution sur ${host}:${port}`);
  });
})


// Gestionnaire d'erreurs global
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send('Erreur interne du serveur');
});

// Middleware de journalisation
app.use((req, res, next) => {
  console.log(`${req.method} ${req.url}`);
  next();
});


// Fermez la connexion à la base de données lors de l'arrêt de l'application
process.on('SIGINT', () => {
  db.end();
  process.exit();
});