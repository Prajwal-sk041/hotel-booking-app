const express = require('express');
const cors = require('cors');
const helmet = require('helmet');
const morgan = require('morgan');

const app = express();
const PORT = process.env.PORT || 5000;

app.use(helmet());
app.use(cors());
app.use(morgan('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get('/health', (req, res) => {
  res.status(200).json({
    status: 'healthy',
    timestamp: new Date().toISOString(),
    uptime: process.uptime(),
    environment: process.env.NODE_ENV || 'development'
  });
});

app.get('/api/v1', (req, res) => {
  res.json({
    message: 'Hotel Booking API',
    version: '1.0.0',
    endpoints: {
      health: '/health',
      hotels: '/api/v1/hotels',
      bookings: '/api/v1/bookings',
      users: '/api/v1/users'
    }
  });
});

app.get('/api/v1/hotels', (req, res) => {
  res.json({
    success: true,
    data: [
      {
        id: 1,
        name: 'Grand Plaza Hotel',
        location: 'New York, USA',
        rating: 4.5,
        price: 250,
        available_rooms: 15,
        image: 'https://images.unsplash.com/photo-1566073771259-6a8506099945'
      },
      {
        id: 2,
        name: 'Ocean View Resort',
        location: 'Miami, USA',
        rating: 4.8,
        price: 350,
        available_rooms: 8,
        image: 'https://images.unsplash.com/photo-1582719508461-905c673771fd'
      },
      {
        id: 3,
        name: 'Mountain Lodge',
        location: 'Aspen, USA',
        rating: 4.6,
        price: 280,
        available_rooms: 12,
        image: 'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb'
      }
    ]
  });
});

app.use((req, res) => {
  res.status(404).json({
    success: false,
    message: 'Route not found'
  });
});

app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({
    success: false,
    message: 'Internal server error',
    error: process.env.NODE_ENV === 'development' ? err.message : undefined
  });
});

app.listen(PORT, '0.0.0.0', () => {
  console.log(`Ì∫Ä Server running on port ${PORT}`);
  console.log(`Ì≥ù Environment: ${process.env.NODE_ENV || 'development'}`);
  console.log(`Ì¥ó Health check: http://localhost:${PORT}/health`);
  console.log(`Ì¥ó API: http://localhost:${PORT}/api/v1`);
});

module.exports = app;
