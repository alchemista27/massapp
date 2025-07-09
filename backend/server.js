// Import express
const express = require('express');
const app = express();

// Middleware (Opsional) - Untuk parsing JSON
app.use(express.json());

// Route Test (Root)
app.get('/', (req, res) => {
  res.send('Hello from MassApp Backend!');
});

// Contoh Route API Materi (Dummy Data)
app.get('/api/materi', (req, res) => {
  res.json([
    {
      id: 1,
      judul: 'Materi 1',
      deskripsi: 'Deskripsi Materi 1'
    },
    {
      id: 2,
      judul: 'Materi 2',
      deskripsi: 'Deskripsi Materi 2'
    }
  ]);
});

// Konfigurasi Port (Default: 5000)
const PORT = process.env.PORT || 5000;

// Start Server
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
