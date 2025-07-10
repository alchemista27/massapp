const express = require('express');
const cors = require('cors');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const pool = require('./db');
require('dotenv').config();

const app = express();
app.use(cors());
app.use(express.json());

app.post('/api/register', async (req, res) => {
  const { email, password } = req.body;
  try {
    const hashedPassword = await bcrypt.hash(password, 10);
    await pool.query('INSERT INTO users (email, password) VALUES (, )', [email, hashedPassword]);
    res.json({ message: 'User registered' });
  } catch (err) {
    res.status(400).json({ error: 'Email already exists' });
  }
});

app.post('/api/login', async (req, res) => {
  const { email, password } = req.body;
  const result = await pool.query('SELECT * FROM users WHERE email = ', [email]);
  const user = result.rows[0];
  if (user && await bcrypt.compare(password, user.password)) {
    const token = jwt.sign({ id: user.id, email: user.email }, process.env.JWT_SECRET, { expiresIn: '1h' });
    res.json({ token });
  } else {
    res.status(401).json({ error: 'Invalid credentials' });
  }
});

app.get('/api/materi', verifyToken, (req, res) => {
  res.json({ materi: 'Materi rahasia hanya untuk user login' });
});

function verifyToken(req, res, next) {
  const bearerHeader = req.headers['authorization'];
  if (bearerHeader) {
    const token = bearerHeader.split(' ')[1];
    jwt.verify(token, process.env.JWT_SECRET, (err, decoded) => {
      if (err) return res.sendStatus(403);
      req.user = decoded;
      next();
    });
  } else {
    res.sendStatus(403);
  }
}

app.listen(process.env.PORT, () => {
  console.log(`Backend running on port ${process.env.PORT}`);
});
