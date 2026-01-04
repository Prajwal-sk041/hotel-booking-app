import React, { useState, useEffect } from 'react';
import './App.css';

function App() {
  const [hotels, setHotels] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetch('http://localhost:5000/api/v1/hotels')
      .then(response => response.json())
      .then(data => {
        setHotels(data.data || []);
        setLoading(false);
      })
      .catch(err => {
        setError(err.message);
        setLoading(false);
      });
  }, []);

  if (loading) return <div className="App">Loading...</div>;
  if (error) return <div className="App">Error: {error}</div>;

  return (
    <div className="App">
      <header className="App-header">
        <h1>Ìø® Hotel Booking App</h1>
        <p>Find and book your perfect stay</p>
      </header>
      
      <main className="hotel-list">
        {hotels.map(hotel => (
          <div key={hotel.id} className="hotel-card">
            <img src={hotel.image} alt={hotel.name} />
            <div className="hotel-info">
              <h2>{hotel.name}</h2>
              <p className="location">Ì≥ç {hotel.location}</p>
              <p className="rating">‚≠ê {hotel.rating}</p>
              <p className="price">${hotel.price} / night</p>
              <p className="rooms">ÔøΩÔøΩÔ∏è {hotel.available_rooms} rooms available</p>
              <button className="book-btn">Book Now</button>
            </div>
          </div>
        ))}
      </main>
    </div>
  );
}

export default App;
