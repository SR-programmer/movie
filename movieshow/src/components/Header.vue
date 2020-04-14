<template>
    <div>
        <div id="top-nav" class="topnav-dark ">
            <nav class="navbar navbar-inverse navbar-static-top" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse"
                                data-target=".navbar-collapse">
                            <span class="sr-only"></span>
                            <i class="fa fa-reorder fa-bars fa-lg"></i>
                        </button>
                        <div class="logo1">
                            <router-link class="logo" to="/" title="NO视频 – 不负追剧好时光 (￣▽￣)&quot;">
                                <img src="https://www.novipnoad.com/logo.png" alt="NO视频 – 不负追剧好时光 (￣▽￣)&quot;"></router-link>
                        </div>
                    </div>
                    <div class="main-menu collapse navbar-collapse">
                        <ul class="nav navbar-nav nav-ul-menu navbar-left hidden-xs">
                            <li class="main-menu-item current-menu-item"><router-link to="/">首页 </router-link></li>
                            <li class="main-menu-item dropdown">
                                <el-dropdown>
                                  <span class="el-dropdown-link font_move">
                                    剧集<i class="el-icon-arrow-down el-icon--right"></i>
                                  </span>
                                    <el-dropdown-menu hover="dropdown">
                                        <el-dropdown-item><router-link to="/hongKong">港剧</router-link></el-dropdown-item>
                                        <el-dropdown-item><router-link to="/usa">美剧</router-link></el-dropdown-item>
                                        <el-dropdown-item><router-link to="/japan">日剧</router-link></el-dropdown-item>
                                        <el-dropdown-item><router-link to="/hanju">韩剧</router-link></el-dropdown-item>
                                        <el-dropdown-item><router-link to="/wanwan">台剧</router-link></el-dropdown-item>
                                    </el-dropdown-menu>
                                </el-dropdown>

                            <li class="main-menu-item"><router-link to="/movie/">电影 </router-link></li>
                            <li class="main-menu-item"><router-link to="/cartoon/">动画 </router-link></li>
                            <li class="main-menu-item"><router-link to="/variety/">综艺 </router-link></li>
                            <li class="main-menu-item"><router-link to="/music/">音乐 </router-link></li>
                            <li class="main-menu-item"><router-link to="/life/">生活 </router-link></li>

                        </ul>

                        <div class="col-lg-3 search">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="搜索影片" v-model="info">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button" @click="search">搜索</button>
                                </span>
                            </div><!-- /input-group -->
                        </div><!-- /.col-lg-6 -->

                        <ul class="nav navbar-nav nav-ul-menu navbar-right hidden-xs" v-if="username">
                            <li class=main-menu-item>
                                <router-link to="/site/">{{username}}</router-link>

                            </li>
                            <li class=main-menu-item>
                                <a @click="logOut" class="logout">注销</a>
                            </li>
                        </ul>
                        <ul class="nav navbar-nav nav-ul-menu navbar-right hidden-xs" v-else>
                            <li class=main-menu-item>
                                <router-link to='/login'>登录</router-link>
                                <!--                                <el-button type="text" @click="open" class="button" style="color: #9b9b9b">登录</el-button>-->
                                <!--                            <button type="button" class="btn btn-primary btn1">登录</button>-->
                                <!--                                <button type="button" class="btn btn-primary btn-lg" data-toggle="modal"-->
                                <!--                                        >-->
                                <!--                                    登录-->
                                <!--                                </button>-->
                            </li>
                            <li class=main-menu-item>
                                <router-link to="/register">注册</router-link>
                            </li>
                        </ul>

                    </div>
                </div>
            </nav>
        </div>

    </div>


</template>

<script>
    export default {
        name: "Header",
        data() {
            return {
                username: '',
                info:''
            }
        },
        created() {
            this.username = this.$cookies.get('username') || ''
        },
        methods: {
            logOut() {
                this.username = '';
                this.$cookies.remove('token', '');
                this.$cookies.remove('username', '');
                this.$cookies.remove('pk', '');
                this.$router.push('/')
            },
            search(){
                let info = this.info;

                this.$emit('searchMovie', info);
                this.$router.push({
                    name:'search',
                    query:{'info': info}

                })

            },
            toTv(category){
                this.$router.push({
                    name:'tvShow',
                    query:{'category': category}
                })
            }


        }
    }
</script>

<style scoped>
    .logo1 {
        margin-top: 10px;
    }

    .search {
        margin-top: 5px;
    }

    .logout {
        color: #9b9b9b;
        cursor: pointer;
        line-height: 15px;

    }

    .logout:hover {
        color: white;
    }

    span {
        font-size: 15px;
        color: #9b9b9b;
    }
    span:hover {
        color: #d9d9d9;
    }
    .dropdown {
        padding-top: 13px;

    }


</style>