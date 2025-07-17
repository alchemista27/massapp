const db = require('../models/db');

exports.getProgress = async (req, res) => {
  try {
    const userId = req.user.user_id;
    const result = await db.query(
      'SELECT progress FROM user_progress WHERE user_id = $1',
      [userId]
    );
    if (result.rows.length === 0) {
      return res.json({ progress: 0.0 });
    }
    res.json({ progress: result.rows[0].progress });
  } catch (error) {
    res.status(500).json({ error: 'Internal Server Error' });
  }
};
