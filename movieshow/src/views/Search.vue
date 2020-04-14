<template>
    <div class="movie row">
        <Header @searchMovie="searchMovie"></Header>
        <div class="col-md-10 col-md-offset-1">
            <div class="col-md-9">
                <h1 class="light-title">Search</h1>



                <div class="row">

                    <div class="col-md-3" v-for="movie in movieList1" :key="movie.pk">
                        <div class="video-item  img-desc">
                            <div class="item-thumbnail flowImg "><a @click="goDetail(movie.pk)"
                                                                    :title="movie.title">
                                <img

                                        :src="movie.movie_img"
                                        :data-original="movie.movie_img"
                                        width="100%" height="100%" :alt="movie.title"
                                        :title="movie.title" style="display: block;"
                                >
                                <div class="link-overlay fa fa-play "></div>
                            </a></div>
                            <div class="item-head"><h5><a @click="goDetail(movie.pk)">{{movie.name.split('').splice(0,12).join('')}}...</a>
                            </h5></div>
                        </div>
                    </div>

                </div>
                <div class="row">

                    <div class="col-md-3" v-for="movie in movieList2" :key="movie.pk">
                        <div class="video-item  img-desc">
                            <div class="item-thumbnail flowImg "><a @click="goDetail(movie.pk)"
                                                                    :title="movie.title">
                                <img

                                        :src="movie.movie_img"
                                        :data-original="movie.movie_img"
                                        width="100%" height="100%" :alt="movie.title"
                                        :title="movie.title" style="display: block;"
                                >
                                <div class="link-overlay fa fa-play "></div>
                            </a></div>
                            <div class="item-head"><h5 style="padding-bottom: 10px"><a @click="goDetail(movie.pk)">{{movie.name.split('').splice(0,10).join('')}}...</a>
                            </h5></div>
                        </div>
                    </div>

                </div>
                <div class="row">

                    <div class="col-md-3" v-for="movie in movieList3" :key="movie.pk">
                        <div class="video-item  img-desc">
                            <div class="item-thumbnail flowImg "><a @click="goDetail(movie.pk)"
                                                                    :title="movie.title">
                                <img

                                        :src="movie.movie_img"
                                        :data-original="movie.movie_img"
                                        width="100%" height="100%" :alt="movie.title"
                                        :title="movie.title" style="display: block;"
                                >
                                <div class="link-overlay fa fa-play "></div>
                            </a></div>
                            <div class="item-head"><h5 style="padding-bottom: 10px"><a @click="goDetail(movie.pk)">{{movie.name.split('').splice(0,10).join('')}}...</a>
                            </h5></div>
                        </div>
                    </div>

                </div>
                <div class="row">

                    <div class="col-md-3" v-for="movie in movieList4" :key="movie.pk">
                        <div class="video-item  img-desc">
                            <div class="item-thumbnail flowImg "><a @click="goDetail(movie.pk)"
                                                                    :title="movie.title">
                                <img

                                        :src="movie.movie_img"
                                        :data-original="movie.movie_img"
                                        width="100%" height="100%" :alt="movie.title"
                                        :title="movie.title" style="display: block;"
                                >
                                <div class="link-overlay fa fa-play "></div>
                            </a></div>
                            <div class="item-head"><h5 style="padding-bottom: 10px"><a @click="goDetail(movie.pk)">{{movie.name.split('').splice(0,12).join('')}}...</a>
                            </h5></div>
                        </div>
                    </div>

                </div>
                <div class="block">
<!--                <span class="demonstration">显示总数</span>-->
                <div style="text-align: center">
                    <el-pagination
                        @size-change="handleSizeChange"
                        @current-change="handleCurrentChange"
                        :current-page.sync="currentPage1"
                        :page-size="page_size"
                        layout="total, prev, pager, next"
                        :total="total">
                </el-pagination>
                </div>
            </div>


            </div>
            <div class="col-md-3">
                <Tag></Tag>
            </div>

        </div>
<Footer></Footer>

    </div>
</template>

<script>
    import Header from '@/components/Header'
    import Tag from '@/components/Tag'
    import Footer from '@/components/Footer'


    export default {
        name: "movie",
        data() {
            return {
                info: '',
                showName: 'upload_time',
                movieList1: '',
                movieList2: '',
                movieList3: '',
                movieList4: '',
                currentPage1: 1,
                page_size:16,
                total:1
            }
        },
        components: {
            Header,
            Tag,
            Footer

        },

        created() {
            console.log(this.$route);
            this.info = this.$route.query.info;
            this.$axios({
                url: this.$settings.base_url + 'all/movie/search/',
                method: 'get',
                params: {
                    'search': this.info
                }
            }).then((response)=>{
                console.log(response);
                this.movieList1 = response.data.results.splice(0, 4);
                this.movieList2 = response.data.results.splice(0, 4);
                this.movieList3 = response.data.results.splice(0, 4);
                this.movieList4 = response.data.results.splice(0, 4);
                this.total = response.data.count
            })
        },
        methods: {

            handleSizeChange(){
                // window.console.log(val)
            },
            searchMovie(info){
                this.$store.state.info = info;
                this.info = this.$route.query.info;
                // console.log(info);

                this.$axios({
                    url:this.$settings.base_url + 'all/movie/search/',
                    method:'get',
                    params:{
                        search:info,
                        page:1
                    }
                }).then((response)=>{
                    this.movieList1 = response.data.results.splice(0, 4);
                    this.movieList2 = response.data.results.splice(0, 4);
                    this.movieList3 = response.data.results.splice(0, 4);
                    this.movieList4 = response.data.results.splice(0, 4);
                    this.total = response.data.count
                })
            },
            handleCurrentChange(val){
                this.$store.state.pageSize = val;
                this.$axios({
                    url:this.$settings.base_url + 'all/movie/search/',
                    method:'get',
                    params:{
                        search:this.info,
                        page:val
                    }
                }).then((response)=>{
                    this.movieList1 = response.data.results.splice(0, 4);
                    this.movieList2 = response.data.results.splice(0, 4);
                    this.movieList3 = response.data.results.splice(0, 4);
                    this.movieList4 = response.data.results.splice(0, 4);
                    this.total = response.data.count
                })
            },
            goDetail(pk){
                this.$router.push({
                    name:'MovieDetail',
                    query:{'pk':pk}
                })
            }

        },
    }
</script>

<style scoped>
    .light-title {
        font-size: 24px;
        margin: 0 0 10px 0;
        display: inline-block;
        vertical-align: middle;
    }

    .video-listing-filter {
        margin: 0 0 20px;
    }

    .video-listing-filter .btn-group {
        overflow: hidden;
    }

    .video-listing-filter .btn-group {
        width: 100%;
        border: solid 1px #e7e7e7;
        border-radius: 3px;
    }

    .hidden-xs {
        display: block !important;
    }

    .btn-group, .btn-group-vertical {
        position: relative;
        display: inline-block;
        vertical-align: middle;
    }

    .video-listing-filter .btn-default {
        color: #c6c6c6;
        padding: 5px 15px;
        /*background-color: #fff;*/
        border: 0;
        border-left: solid 1px #e7e7e7;
        border-right: solid 1px #e7e7e7;
        border-radius: 0;
    }

    .active {
        background-color: #333333;
    }

    /*@import '../assets/css/movie_page.css';*/
    a {
        text-decoration: none;
        color: #333333;
    }

    .img-desc a img:hover {
        /*鼠标悬停图片放大*/
        transform: scale(1.2, 1.2);
        -ms-transform: scale(1.2, 1.2);
        /* IE 9 */
        -moz-transform: scale(1.2, 1.2);
        /* Firefox */
        -webkit-transform: scale(1.2, 1.2);
        /* Safari 和 Chrome */
        -o-transform: scale(1.2, 1.2);
        /* Opera */
    }

    div {
        padding: -5px 10px;
    }

    .item-head {
        margin-left: 5px;
    }

    img {
        border-radius: 5%;
    }

    .flowImg {
        /*图片超出部分隐藏*/
        width: 100%;
        height: 100%;
        overflow-x: hidden;
        overflow-y: hidden;
        position: relative;
        border-radius: 5%;
    }

    a:hover {
        text-decoration: none;
        color: #d3dce6;
    }

    a {
        margin-bottom: 5px;
    }

</style>

