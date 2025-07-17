exports.login = (req, res) => {
    const { email, password } = req.body || {};
    if (email === 'admin@massapp.com' && password === '181818') {
        return res.json({ token: 'FAKE_JWT_TOKEN', user: { email } });
    }
    return res.status(401).json({ error: 'Invalid credentials' });
};
