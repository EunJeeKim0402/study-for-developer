var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var db = require('./config/db');
var cors = require('cors'); //교차통신 모듈 호출


var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');

if(!db) {
  console.log("/config/db.js file not exists");
  process.exit(1);
}

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use(cors())//교차통신 적용
