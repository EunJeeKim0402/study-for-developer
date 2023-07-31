app.use(cors()); //교차통신 적용

var express = require('express');
var app = express();
var cors = require('cors'); //교차통신 모듈 호출
const mysqlConnection = require('./mysqlConnection');
app.use('/api/board', mysqlConnection); // '/api/board' 경로에 mysqlConnection.js에서 정의한 라우터 모듈 사용

var createError = require('http-errors');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var db = require('./config/database');

//var indexRouter = require('./router/index.js');
//var usersRouter = require('./router/users.js');
//var boardRouter = require('./router/board.js'); 

//app.use('/board', boardRouter);

if(!db) {
  console.log("/config/db.js file not exists");
  process.exit(1);
}

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

