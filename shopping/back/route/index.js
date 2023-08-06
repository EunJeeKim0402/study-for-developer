import Vue from 'vue'
import Router from 'vue-router'
import Write from '../board/Write';

Vue.use(Router);

export default new Router({
  routes: [
    {
        path: '/',
        name: 'App',
        component: App
    },{
        path:'/write',
        name: Write,
        component: Write
	}
  ]
})
