const db = require('../db');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');

exports.login = async (req, res) => {
  console.log('=== [DEBUG] Login API HIT ===');
  try {
    const { email, password } = req.body;
    console.log('Received:', email, password);

    const result = await db.query('SELECT * FROM users WHERE email = $1', [email]);
    console.log('Query Result:', result.rows);

    if (result.rows.length === 0) {
      return res.status(401).json({ error: 'Email not found' });
    }

    const user = result.rows[0];
    const passwordMatch = bcrypt.compareSync(password, user.password);
    if (!passwordMatch) {
      return res.status(401).json({ error: 'Incorrect password' });
    }

    const token = jwt.sign({ id: user.id, email: user.email, role: user.role }, process.env.JWT_SECRET, {
      expiresIn: '7d',
    });

    res.json({ token });
  } catch (error) {
    console.error('ERROR:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};
