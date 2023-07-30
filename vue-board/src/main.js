// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import axios from 'axios'; //자스 http통신 라이브러리

Vue.config.productionTip = true;
Vue.prototype.$axios = axios; //  전역변로 설정 컴포넌트에서 this.$axios호출 가능

/* eslint-disable no-new */
new Vue({
  render: h => h(App)
  ,router               //뷰에 설정
}).$mount('#app')