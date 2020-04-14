<template>
    <div class="video-toolbar-inner">
        <div class="video-toolbar-item">
            <div class="wrap-toolbar-item">
                <div class="maincolor2 toolbar-views-number">{{views}}</div>
                <div class="maincolor2hover toolbar-views-label">Views <i class="fa fa-eye"></i></div>
            </div>
            <span class="middlefix"></span></div>
        <div class="video-toolbar-item count-cm"><span class="maincolor2hover glyphicon glyphicon-comment"><a href="#comments"
                                                                                  class="maincolor2hover"><i
                class="fa fa-comment"></i>{{comments}}</a></span></div>
        <div class="video-toolbar-item like-dislike" style="width: 70px;text-align: center;padding-top: 10px">
            <div class="watch-action">
                <div class="watch-position align-left">
                    <div class="action-like change-color">
                        <a class="lbg-style1 like-123122 jlk"
                         data-task="like"
                         data-post_id="123122" data-nonce="4959385851"
                         rel="nofollow" @click="isLike(1)">
                        <span class="lc-123122 lc glyphicon glyphicon-thumbs-up">{{up_num}}</span>
                        </a>
                    </div>
                    <div class="action-unlike">
                        <a class="unlbg-style1 unlike-123122 jlk"
                           data-task="unlike"
                           data-post_id="123122" data-nonce="4959385851"
                           rel="nofollow" @click="isLike(0)">
                        <span class="unlc-123122 unlc glyphicon glyphicon-thumbs-down">{{down_num}}</span>
                        </a>
                    </div>
                </div>

            </div>
            <div class="wti-clear"></div>
        </div>
        <div class="video-toolbar-item count-cm online-count"><span class="maincolor2hover glyphicon glyphicon-user"> <a
                 class="maincolor2hover count-ol online" title="在线人数"><i
                class="fa fa-male"></i>{{online_views}}</a> </span></div>

        <div class="video-toolbar-item pull-right col-md-2 video-toolbar-item-like-bar">
            <div class="wrap-toolbar-item">
                <div class="like-bar"><span style="width:76.666666666667%"></span></div>
                <div class="like-dislike pull-right">
                    <span class="like"><i class="fa fa-thumbs-o-up"></i>{{up_num}}</span>
                    <span class="dislike"><i class="fa fa-thumbs-o-down"></i>{{down_num}}</span>
                </div>
            </div>
        </div>

    </div>
</template>

<script>
    export default {
        name: "WatchForm",
        data(){
            return {
                views:0,
                comments:0,
                up_num:0,
                down_num:0,
                online_views:0,
                timer:''
            }
        },
        props:['moviePk',],
        created() {
            // console.log(this.moviePk);
            this.$axios({
                url:this.$settings.base_url + 'all/movie_info/',
                method:'get',
                params:{pk:this.moviePk}
            }).then((response)=>{
                // window.console.log(response);
                this.views = response.data.results.views;
                this.comments = response.data.results.comments;
                this.down_num = response.data.results.down_num;
                this.up_num = response.data.results.up_num;
            });
            this.$axios({
                url:this.$settings.base_url + 'user/online/number/',
                method: 'post'
            }).then((response)=>{
                this.online_views = response.data.results.online_number
            })
            // this.$axios({
            //     url:this.$settings.base_url + 'all/add_view/',
            //     method:'get',
            //     params:{pk:this.moviePk}
            // })
        },
        methods:{
            isLike(isLike){
                let moviePk = parseInt(this.moviePk);
                this.$axios({
                    url:this.$settings.base_url + 'user/upordown/',
                    method: 'post',
                    data: {isLike:isLike,movie_pk:moviePk},
                    // Authorization
                    headers:{
                        'authorization': 'bearer ' + this.$cookies.get('token')
                    }
                }).then((response)=>{
                    // window.console.log(response);

                    if(response.data.status===0){
                        this.$message({
                      message: response.data.msg,
                      type: 'success',
                      duration:1000,
                        showClose:true
                        });
                        if(isLike==1){
                            this.up_num += 1;
                            console.log(this.up_num)
                        }else if(isLike==0){
                            this.down_num += 1;
                            console.log(this.up_num)
                        }
                    }else if(response.data.status===1){
                        this.$message({
                      message: response.data.msg,
                      type: 'error',
                      duration:1000,
                        showClose:true
                    });
                    }
                }).catch((error)=>{
                    window.console.log(error);
                    this.$message({
                      message: '请宁先去登录',
                      type: 'error',
                      duration:1000,
                        showClose:true
                    });
                })
            },
            statistics(){
                this.$axios({
                    url:this.$settings.base_url + 'user/online/number/',
                    method: 'post'
                }).then((response)=>{
                    this.online_views = response.data.results.online_number
                })
            }
        },
        mounted() {
          this.timer = setInterval(this.statistics, 60000);
        },
        beforeDestroy() {
          clearInterval(this.timer);
        }
    }
</script>

<style scoped>
.video-toolbar-inner {
    border: solid 1px #e7e7e7;
    border-top: 0;
    color: #c6c6c6;
    -webkit-border-bottom-right-radius: 3px;
    -webkit-border-bottom-left-radius: 3px;
    -moz-border-radius-bottomright: 3px;
    -moz-border-radius-bottomleft: 3px;
    border-bottom-right-radius: 3px;
    border-bottom-left-radius: 3px;
    font-size: 13px;
    overflow: hidden;
}
    .video-toolbar-item {
    float: left;
    height: 70px;
    line-height: 70px;
    padding: 0 20px;
    border: solid 1px #e7e7e7;
    margin: -1px 0 -1px -1px;
}
    .video-toolbar-item * {
    line-height: 1.4;
}
    .wrap-toolbar-item {
    display: inline-block;
    vertical-align: middle;
}
    .maincolor2.toolbar-views-number {
    text-align: center;
}
    .toolbar-views-number {
    font-size: 22px;
}
    .video-toolbar-item * {
    line-height: 1.4;
}
    .maincolor2, a.maincolor2, .maincolor2hover:hover, a, a:hover, .dark-div .maincolor2hover:hover {
    color: #4141a0;
}
    .toolbar-views-label {
    font-size: 11px;
}
    .video-toolbar-item * {
    line-height: 1.4;
}
    .fa {
    display: inline-block;
    font: normal normal normal 14px/1 FontAwesome;
    font-size: inherit;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}
    .fa-eye:before {
    content: "\f06e";
}
    span:hover {
        cursor: pointer;
        color: #4141a0;
    }
    /*.online:hover{}*/

</style>