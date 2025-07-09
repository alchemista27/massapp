const db = require('../db');
const jwt = require('jsonwebtoken');
const crypto = require('crypto');

const JWT_SECRET = process.env.JWT_SECRET;

function hashPassword(password) {
  return crypto.createHash('sha256').update(password).digest('hex');
}

exports.login = async (req, res) => {
  const { email, password } = req.body;
  const hashedPassword = hashPassword(password);

  try {
    const result = await db.query('SELECT * FROM users WHERE email = $1 AND password = $2', [email, hashedPassword]);
    if (result.rows.length === 0) {
      return res.status(401).json({ message: 'Invalid credentials' });
    }
    const user = result.rows[0];
    const token = jwt.sign({ id: user.id, email: user.email, role: user.role }, JWT_SECRET, { expiresIn: '7d' });
    res.json({ token, user });
  } catch (err) {
    res.status(500).json({ message: 'Internal Server Error', error: err.message });
  }
};
