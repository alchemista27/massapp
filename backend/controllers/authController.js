exports.login = (req, res) => {
  const { email, password } = req.body;
  if (email === 'admin@massapp.com' && password === '181818') {
    res.json({ token: 'dummy-jwt-token' });
  } else {
    res.status(401).json({ error: 'Invalid credentials' });
  }
};
