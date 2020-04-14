import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

Vue.config.productionTip = false;

import '@/assets/css/global.css'

import axios from 'axios'
Vue.prototype.$axios = axios;

import cookies from 'vue-cookies'
Vue.prototype.$cookies = cookies;

import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
Vue.use(ElementUI);

// bootstrap+jq配置：cnpm install jquery、cnpm install bootstrap@3
import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.min.css'


import settings from '@/assets/js/settings'
Vue.prototype.$settings = settings;


// vue-video播放器
require('video.js/dist/video-js.css');
require('vue-video-player/src/custom-theme.css');
import VideoPlayer from 'vue-video-player'
Vue.use(VideoPlayer);

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app');
