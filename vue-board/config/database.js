// database.js
const mysql = require('mysql2');

function init() {
  // 데이터베이스 연결 설정
  const connection = mysql.createConnection({
    host: 'localhost',
    user: 'eunjee', // 데이터베이스 사용자 이름
    password: 'dhdlakt22', // 데이터베이스 사용자 비밀번호
    database: 'vue_board', // 데이터베이스 이름
  });

  return connection;
}

module.exports = {
  init,
};

// module.exports = {
//     host     : 'localhost',
//     user     : 'eunjee',
//     password : 'dhdlakt22',
//     database : 'vue_board'
// }