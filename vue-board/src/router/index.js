import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import List from '@/components/board/List';
import Write from '@/components/board/Write';

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: '/',
      name: 'HelloWorld',
      component: HelloWorld
    },{
			path:'/board/list'
			,name:List
			,component:List
		},{
      path:'/board/write'
			,name:Write
			,component:Write
    }
  ]
})

// =======================================================
/*
var Net  = require('net');
const mysql      = require('mysql');
const connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'eunjee',
  password : 'dhdlakt22',
  database : 'tb_board'
});

connection.connect();
*/
/*
const express    = require('express');
const mysql      = require('mysql');
const dbconfig   = require('../../config/database.js');
const connection = mysql.createConnection(dbconfig);

const app = express();

app.set('port', process.env.PORT || 3000);

app.get('/', (req, res) => {
  res.send('Root');
});

app.get('/users', (req, res) => {
  connection.query('SELECT * from Users', (error, rows) => {
    if (error) throw error;
    console.log('User info is: ', rows);
    res.send(rows);
  });
});

app.listen(app.get('port'), () => {
  console.log('Express server listening on port ' + app.get('port'));
});
*/