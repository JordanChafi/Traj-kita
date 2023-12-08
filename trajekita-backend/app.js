require('dotenv').config();
const express = require('express');
const bodyParser = require('body-parser');
const db = require('./utils/db');

const userRoutes = require('./routes/userRoutes');
const tripRoutes = require('./routes/tripRoutes');
const paymentRoutes = require('./routes/paymentRoutes');
const vehicleRoutes = require('./routes/vehicleRoutes');
const trip_historyRoutes = require('./routes/trip_historyRoutes');
const rating_reviewRoutes = require('./routes/rating_reviewRoutes');
const addressRoutes = require('./routes/addressRoutes');
const bookingRoutes = require('./routes/bookingRoutes');

const app = express();
const port = 3000;

app.use(bodyParser.json());

// Routes
app.use('/api/users', userRoutes);
app.use('/api/trips', tripRoutes);
app.use('/api/payments', paymentRoutes);
app.use('/api/address', addressRoutes);
app.use('/api/booking', bookingRoutes);
app.use('/api/tripsHistory', trip_historyRoutes);
app.use('/api/vehicle', vehicleRoutes);
app.use('/api/rating_review', rating_reviewRoutes);

app.listen(port, () => {
  console.log(`Serveur en écoute sur le port ${port}`);
});

// Fermez la connexion à la base de données lors de l'arrêt de l'application
process.on('SIGINT', () => {
  db.end();
  process.exit();
});
