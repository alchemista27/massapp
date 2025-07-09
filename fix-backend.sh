#!/bin/bash

echo "=== AUTO FIX BACKEND (DATABASE + LOGIN + JWT) ==="

cd backend || { echo "Folder backend tidak ditemukan!"; exit 1; }

echo "✅ Menulis ulang file .env"
cat <<EOF > .env
DATABASE_URL=postgresql://massapp:Curup1991@localhost:5432/massappdb
JWT_SECRET=ab7f9656ec1c837fb4ff772ea52c4c879d358cf6ee8c2f06c0941f6d68abbab77bc3ab7b3a2d2c874ea78ad5d8a9cb1b89df51370fac0faa58b7a6b97122c956
EOF

echo "✅ Memastikan package 'crypto' sudah ada di package.json"
if ! grep -q '"crypto"' package.json; then
  npm install crypto --save
fi

echo "✅ Membuat atau memperbarui authController.js"
mkdir -p controllers
cat <<'EOF' > controllers/authController.js
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
EOF

echo "✅ Memastikan route /api/login sudah ada"
mkdir -p routes
cat <<'EOF' > routes/authRoutes.js
const express = require('express');
const router = express.Router();
const authController = require('../controllers/authController');

router.post('/login', authController.login);

module.exports = router;
EOF

echo "✅ Memastikan backend server pakai route ini"
sed -i "/const express = require('express');/a const authRoutes = require('./routes/authRoutes');" server.js
sed -i "/app.use(express.json());/a app.use('/api', authRoutes);" server.js

echo "✅ Restart PM2 backend"
pm2 restart massapp-backend --update-env

echo "=== ✅ SEMUA SELESAI! ==="
