<template>
    <div>
        <Header></Header>
        <div class="row">
            <div class="col-md-3">
                <SiteInfo></SiteInfo>

            </div>

            <div style="margin-left: 50px">
                <div class="col-md-9">
                    <div class="row" v-show="recent_list.length">

                        <h4 style="padding-left: 30px">最近</h4>
                        <div class="col-md-2" v-for="record in recent_list" :key="record.movie">
                            <div class="video-item  img-desc">
                                <div class="item-thumbnail flowImg "><a @click="goDetail(record.movie)"
                                                                        :title="record.title">
                                    <img

                                            :src="record.movie_img"
                                            :data-original="record.movie_img"
                                            width="100%" height="100%" :alt="record.movie_title"
                                            :title="record.movie_title" style="display: block;"
                                    >
                                    <div class="link-overlay fa fa-play "></div>
                                </a></div>
                                <div class="item-head"><h5 style="padding-bottom: 10px"><a
                                        @click="goDetail(record.movie)">{{record.movie_title.split('').splice(0,12).join('')}}...</a>
                                </h5></div>
                            </div>
                        </div>


                    </div>

                    <div class="row" v-show="before_day3_list.length">
                        <h4 style="padding-left: 30px">前三天</h4>
                        <div class="col-md-2" v-for="record in before_day3_list" :key="record.movie">
                            <div class="video-item  img-desc">
                                <div class="item-thumbnail flowImg "><a @click="goDetail(record.movie)"
                                                                        :title="record.title">
                                    <img

                                            :src="record.movie_img"
                                            :data-original="record.movie_img"
                                            width="100%" height="100%" :alt="record.movie_title"
                                            :title="record.movie_title" style="display: block;"
                                    >
                                    <div class="link-overlay fa fa-play "></div>
                                </a></div>
                                <div class="item-head"><h5 style="padding-bottom: 10px">
                                    <a
                                        @click="goDetail(record.movie)">{{record.movie_title.split('').splice(0,8).join('')}}...</a>
                                </h5></div>
                            </div>
                        </div>

                    </div>
                    <div class="row" v-show="before_day7_list.length">
                        <h4 style="padding-left: 30px">七天前</h4>
                        <div class="col-md-2" v-for="record in before_day7_list" :key="record.movie">
                            <div class="video-item  img-desc">
                                <div class="item-thumbnail flowImg "><a @click="goDetail(record.movie)"
                                                                        :title="record.title">
                                    <img

                                            :src="record.movie_img"
                                            :data-original="record.movie_img"
                                            width="100%" height="100%" :alt="record.movie_title"
                                            :title="record.movie_title" style="display: block;"
                                    >
                                    <div class="link-overlay fa fa-play "></div>
                                </a></div>
                                <div class="item-head"><h5 style="padding-bottom: 10px"><a
                                        @click="goDetail(record.movie)">{{record.movie_title.split('').splice(0,8).join('')}}...</a>
                                </h5></div>
                            </div>
                        </div>

                    </div>


                </div>
            </div>
        </div>





    </div>
</template>

<script>
    import Header from '@/components/Header'
    import SiteInfo from '@/components/site-info'

    export default {
        name: "Site",
        components: {
            Header,
            SiteInfo
        },
        data() {
            return {
                recent_list: '',
                before_day3_list: '',
                before_day7_list: '',
                isShow: false


            }
        },
        created() {
            this.$axios({
                url: this.$settings.base_url + 'user/history/',
                method: 'get',
                headers: {
                    'authorization': 'bearer ' + this.$cookies.get('token')
                }
            }).then((response) => {
                // window.console.log(response);
                this.recent_list = response.data.recent_list;
                this.before_day3_list = response.data.before_day3_list;
                this.before_day7_list = response.data.before_day7_list;
            });

        },
        methods: {
            goDetail(pk) {
                this.$router.push({
                    name: 'MovieDetail',
                    query: {'pk': pk}
                })
            },

        }
    }
</script>


<style scoped>
    [v-cloak] {
        display: none;
    }
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

    #checkout_counter_mask {
        position: fixed;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background: black;
        opacity: .5;
        filter: alpha(opacity=50);
        z-index: 9998;
    }



</style>