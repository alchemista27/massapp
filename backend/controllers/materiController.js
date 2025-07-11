const db = require('../models/db');

exports.getAllMateri = async (req, res) => {
  try {
    const result = await db.query('SELECT * FROM materi');
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};

exports.getMateriById = async (req, res) => {
  const { id } = req.params;
  try {
    const materiRes = await db.query('SELECT * FROM materi WHERE id = $1', [id]);
    if (materiRes.rows.length === 0) {
      return res.status(404).json({ error: 'Materi not found' });
    }
    const projectRes = await db.query('SELECT * FROM projects WHERE materi_id = $1', [id]);
    const quizRes = await db.query('SELECT * FROM quizzes WHERE materi_id = $1', [id]);

    const result = {
      ...materiRes.rows[0],
      projects: projectRes.rows,
      quizzes: quizRes.rows
    };
    res.json(result);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};
