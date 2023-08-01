const db = require('../../../config/database');

const conn =  db.init();

exports.list = (req, res) => {
    let where = ""
    body = req.query; // get
    // if (body.keyword) {
    //     where += ` AND subject like '%${body.keyword}%' `;
    // }
    sql = 'SELECT * FROM product WHERE 1=1 ${where}';
    conn.query(sql, (err, list) => {
        if (err) throw err;
        res.send({ success: true, list: list });
    });
};