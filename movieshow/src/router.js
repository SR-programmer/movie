import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'
import Login from '@/views/Login'
import Movie from '@/views/Movie'
import Cartoon from '@/views/cartoon'
import Variety from '@/views/Variety'
import Music from '@/views/Music'
import Life from '@/views/Life'
import TagView from '@/views/TagView'
import Search from '@/views/Search'
import MovieDetail from '@/views/MovieDetail'
import Site from '@/views/Site'
import paySuccess from '@/views/paySuccess/'
import hanguo from '@/views/hanguo/'
import hongKong from '@/views/hongKong/'
import japan from '@/views/japan/'
import Usa from '@/views/Usa/'
import wanwan from '@/views/wanwan/'
import vipMovie from '@/views/vipMovie/'
import Register from '@/views/Register/'
import ChangeInfo from '@/views/ChangeInfo/'


Vue.use(Router);

export default new Router({
    mode: 'history',
    base: process.env.BASE_URL,
    routes: [
        {
            path: '/',
            name: 'home',
            component: Home
        },
        {
            path: '/login',
            name: 'login',
            component: Login
        },
        {
            path: '/register',
            name: 'register',
            component: Register
        },
        {
            path: '/movie',
            name: '电影',
            component: Movie
        },
        {
            path: '/cartoon',
            name: '动画',
            component: Cartoon
        },
        {
            path: '/variety',
            name: '综艺',
            component: Variety
        },
        {
            path: '/music',
            name: '音乐',
            component: Music
        },
        {
            path: '/life',
            name: '生活',
            component: Life
        },
        {
            path: '/tag/',
            name: 'tag',
            component: TagView
        },
        {
            path: '/search',
            name: 'search',
            component: Search
        },
        {
            path: '/movie/detail/',
            name: 'MovieDetail',
            component: MovieDetail
        },
        {
            path: '/site/',
            name: 'Site',
            component: Site
        },

        {
            path: '/pay/success',
            name: 'paySuccess',
            component: paySuccess
        },
        {
            path: '/hanju',
            name: 'hanguo',
            component: hanguo
        },
        {
            path: '/hongKong',
            name: 'hongKong',
            component: hongKong
        },{
            path: '/japan',
            name: 'japan',
            component: japan
        },
{
            path: '/usa',
            name: 'Usa',
            component: Usa
        },{
            path: '/wanwan',
            name: 'wanwan',
            component: wanwan
        },{
            path: '/vip/movie/',
            name: 'vipMovie',
            component: vipMovie
        },
        {
            path: '/change/info/',
            name: 'ChangeInfo',
            component: ChangeInfo
        },
    ]
})