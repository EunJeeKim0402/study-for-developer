const express = require('express');
const mysql = require('mysql');
const cors = require('cors'); // cors 라이브러리
const app = express();

app.get('/path', (req, res) => {
    res.send("라우터 설정")
});

const mysqlDB = mysql.createConnection({
  host: 'localhost',
  user: 'eunjee',
  password: 'dhdlakt22',
  port: 3306,
  database: 'tb_board'
});

mysqlDB.connect((err) => {
  if (err) {
    console.error('MySQL 연결 오류:', err);
    return;
  }
  console.log('MySQL 연결 성공!');
});

// 라우팅과 미들웨어 설정

app.use(cors());
const port = 3000;
app.listen(port, () => {
  console.log(`서버가 http://localhost:${port} 에서 실행 중입니다.`);
});