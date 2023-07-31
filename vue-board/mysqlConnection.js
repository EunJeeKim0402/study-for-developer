const express    = require('express');
const mysql      = require('mysql2');
const dbconfig   = require('./config/database.js');
const connection = mysql.createConnection(dbconfig);
var http = require('http');

const PORT = process.env.PORT || 3000;
const app = express();

app.set('port', process.env.PORT || 3000);

app.get('/', (req, res) => {
  res.send('Root');
});

//////
const router = require('express').Router();
const dao = require('./components/router/api/board/dao'); //데이터 모듈 호출

router.get("/",dao.list); // GET방식으로 접근 시 dao.list 모듈 실행
router.post("/",dao.add); // /board POST방식으로 접근 시 모듈 실행

module.exports = router;
//////

app.get('/board', (req, res) => {
  connection.query('SELECT * from tb_board', (error, rows) => {
    if (error) throw error;
    //console.log('tb_board info is: ', rows);
    res.send(rows);
  });
});
//app.use('/board', boardRouter); 

app.listen(app.get('port'), () => {
  console.log('Express server listening on port ' + app.get('port'));
});

var httpServer = http.createServer(function (request, response) {
  // Setting up Headers
  response.setHeader('Access-Control-Allow-origin', '*'); // 모든 출처(orogin)을 허용
  response.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE'); // 모든 HTTP 메서드 허용
  response.setHeader('Access-Control-Allow-Credentials', 'true'); // 클라이언트와 서버 간에 쿠키 주고받기 허용

  // ...

  response.writeHead(200, { 'Content-Type': 'text/plain' });
  response.end('ok');
});

httpServer.listen(PORT, () => {
  console.log('Server is running at port 3000...');
});

/*


*/
