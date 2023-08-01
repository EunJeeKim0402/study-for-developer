var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var db = require('./config/database');
var cors = require('cors');
var app = express();

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');

app.use(cors(corsOptions)); // cors 미들웨어를 사용하여 CORS 허용 도메인 설정

if(!db) {
  console.log("/config/database.js file not exists");
  process.exit(1);
}

const corsOptions = {
  origin: [/^http:\/\/localhost:\d+$/, /^http:\/\/127.0.0.1:\d+$/, 'http://localhost:8082'], // Vue.js 애플리케이션의 도메인
  credentials: true, // 인증 정보를 포함하기 위해 credentials 옵션을 추가
  methods: ['GET', 'POST', 'PUT', 'DELETE'], // 요청 허용할 메서드 목록
  allowedHeaders: ['Content-Type', 'Authorization'], // 요청 허용할 헤더 목록
};

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/users', usersRouter);

module.exports = app;
