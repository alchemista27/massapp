const db = require('../db');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

exports.login = async (req, res) => {
  console.log('=== [DEBUG] Login API HIT ===');
  try {
    const { email, password } = req.body;
    console.log('Received:', email, password);

    const result = await db.query('SELECT * FROM users WHERE email = $1', [email]);
    console.log('Query Result:', result.rows);

    if (result.rows.length === 0) {
      return res.status(401).json({ error: 'Invalid email or password' });
    }

    const user = result.rows[0];
    const validPassword = await bcrypt.compare(password, user.password);
    console.log('Password valid?', validPassword);

    if (!validPassword) {
      return res.status(401).json({ error: 'Invalid email or password' });
    }

    const token = jwt.sign(
      { id: user.id, email: user.email },
      process.env.JWT_SECRET,
      { expiresIn: '1h' }
    );

    res.json({ token });
  } catch (error) {
    console.error('ERROR:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};
