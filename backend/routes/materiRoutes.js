const express = require('express');
const router = express.Router();
const db = require('../models/db');

// GET Semua Materi
router.get('/', async (req, res) => {
  try {
    const result = await db.query('SELECT id, judul, deskripsi, tingkat FROM materi');
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// GET Projects per Materi
router.get('/:id/projects', async (req, res) => {
  try {
    const materiId = req.params.id;
    const result = await db.query('SELECT * FROM projects WHERE materi_id = $1', [materiId]);
    res.json(result.rows); // Pasti JSON Array
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// GET Quizzes per Materi
router.get('/:id/quizzes', async (req, res) => {
  try {
    const materiId = req.params.id;
    const result = await db.query('SELECT * FROM quizzes WHERE materi_id = $1', [materiId]);
    res.json(result.rows); // Pasti JSON Array
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

module.exports = router;
