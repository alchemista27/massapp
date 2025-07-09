const express = require('express');
const authRoutes = require('./routes/authRoutes');
const cors = require('cors');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const { Pool } = require('pg');
require('dotenv').config();

const app = express();
app.use(cors());
app.use(express.json());
app.use('/api', authRoutes);

const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASS,
  port: 5432,
});

const JWT_SECRET = process.env.JWT_SECRET;

// User Registration
app.post('/api/register', async (req, res) => {
  const { fullName, id, email, password, role } = req.body;
  const hashedPassword = await bcrypt.hash(password, 10);
  await pool.query(
    'INSERT INTO users (full_name, id_number, email, password, role) VALUES ($1, $2, $3, $4, $5)',
    [fullName, id, email, hashedPassword, role]
  );
  res.json({ message: 'User registered' });
});

// User Login
app.post('/api/login', async (req, res) => {
  const { email, password } = req.body;
  const userResult = await pool.query('SELECT * FROM users WHERE email = $1', [email]);
  const user = userResult.rows[0];
  if (!user || !(await bcrypt.compare(password, user.password))) {
    return res.status(401).json({ error: 'Invalid credentials' });
  }
  const token = jwt.sign({ id: user.id, role: user.role }, JWT_SECRET, { expiresIn: '1d' });
  res.json({ token, user: { id: user.id, fullName: user.full_name, role: user.role } });
});

app.listen(5000, '0.0.0.0', () => {
  console.log('Backend running on port 5000');
});
