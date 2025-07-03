const express = require('express');
const cors = require('cors');
const { Pool } = require('pg');
require('dotenv').config();

const app = express();
const port = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: { rejectUnauthorized: false }, // Wajib untuk Railway DB
});

// ✅ API GET Materi
app.get('/materi', async (req, res) => {
  const result = await pool.query('SELECT * FROM materi ORDER BY id DESC');
  res.json(result.rows);
});

// ✅ API POST Submit Materi
app.post('/materi/submit', async (req, res) => {
  const { title, description, video_url, pdf_url } = req.body;
  await pool.query(
    'INSERT INTO materi (title, description, video_url, pdf_url) VALUES ($1, $2, $3, $4)',
    [title, description, video_url, pdf_url]
  );
  res.sendStatus(200);
});

// ✅ API POST Submit Project
app.post('/projects/submit', async (req, res) => {
  const { user_id, materi_id, file_url } = req.body;
  await pool.query(
    'INSERT INTO project_submissions (user_id, materi_id, file_url) VALUES ($1, $2, $3)',
    [user_id, materi_id, file_url]
  );
  res.sendStatus(200);
});

app.listen(port, () => console.log(`Server running on port ${port}`));
