import Vue from 'vue';
import Vuex from 'vuex';
import todo from './modeulds/todo';
import user from './modeulds/user';

Vue.use(Vuex);
// Vuex는 Vue.js 애플리케이션 상태관리를 위한 공식 상태관리 패턴 라이브러리

export default new Vuex.Store({    
    modules: {
        todo, //todo: todo, 생략가능
        user
    },
});