<template>

    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="smart-box  smart-box-style-2 is-carousel" id="1151236922">
        <div class="smart-box-head">
            <h2 class="light-title title" style="margin-bottom: 0"><img :src="this.gif"
                                                                       :data-original="this.gif"
                                                                       width="40" height="40"
                                                                       style="display: inline;"><span
                style="vertical-align: sub;"> 电影</span></h2>
            <div class="smart-control pull-right">
                <a class="prev maincolor2 bordercolor2 bgcolor2hover hidden" href="#"
                                                     style="display: none;"><i class="fa fa-angle-left"></i></a> <a
                    class="next maincolor2 bordercolor2 bgcolor2hover hidden" href="#" style="display: none;"><i
                    class="fa fa-angle-right"></i></a> <router-link to="/movie/" class="bordercolor2 bgcolor2hover">View all</router-link>
            </div>
        </div>
        <div class="caroufredsel_wrapper"
             style="display: block; text-align: start; float: none; position: relative; top: auto; right: auto; bottom: auto; left: auto; z-index: auto; width: 1140px; height: 284px; margin: 0px; overflow: hidden;">
            <div class="smart-box-content"
                 style="text-align: left; float: none; position: absolute; top: 0px; right: auto; bottom: auto; left: 0px; margin: 0px; width: 3420px; height: 284px;">
                <div class="smart-item it-row" style="width: 1140px;">
                    <div class="row">

                        <div class="col-md-2" v-for="movie in recommend1" :key="movie.pk">
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
                                <div class="item-head"><h5><a @click="goDetail(movie.pk)">{{ movie.name.split('').splice(0,12).join('')}}...</a></h5></div>
                            </div>
                        </div>

                    </div>
<!--                    <div class="row">sdfsdf</div>-->
                    <div class="row">

                        <div class="col-md-2 movie" v-for="movie in recommend2" :key="movie.pk">
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
                                <div class="item-head"><h5><a @click="goDetail(movie.pk)">{{ movie.name.split('').splice(0,12).join('') }}...</a></h5></div>
                            </div>
                        </div>

                    </div>


                </div>

            </div>
        </div>


    </div>
        </div>

    </div>

</template>

<script>
    export default {
        name: "M-1",
        data () {
            return {
                recommend1: '',
                recommend2: '',
                gif: ''
            }
        },
        created() {
            let rowShow = this.$settings.rowShow;
            this.$axios({
                url: this.$settings.base_url + 'home/show/电影/',
                method: 'get',
            }).then(response => {
                // window.console.log(response);
                this.recommend1 = response.data.results.splice(0, rowShow);
                this.recommend2 = response.data.results.splice(0, rowShow);
                // window.console.log(this.recommend1, this.recommend2, rowShow, rowShow*2)
            });
            this.$axios({
                url: this.$settings.base_url + 'home/gif/movie/',
                method: 'get'
            }).then(response => {
                // window.console.log(response);
                this.gif = response.data.data.gif
            })
        },
        methods:{
            goDetail(pk){
                this.$router.push({
                    name:'MovieDetail',
                    query:{'pk':pk}
                })
            }
        }


    }
</script>

<style scoped>
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
        padding:-5px 10px;
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