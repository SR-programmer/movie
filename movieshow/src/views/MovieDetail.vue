<template>
    <div class="row">
        <Header></Header>
        <div class="col-md-10 col-md-offset-1">
            <div class="wrap-left">

                <videoPlayer class="video-player vjs-custom-skin"
                             ref="videoPlayer"
                             :playsinline="true"
                             :options="playerOptions"
                             @play="onPlayerPlay($event)"
                             @pause="onPlayerPause($event)">
                </videoPlayer>
            </div>
            <WatchForm :moviePk="pk"></WatchForm>
            <div class="row">
                <div class="col-md-9">
                    <h3>{{name}}</h3>
                    <p>上传时间:{{upTime.split('').splice(0,10).join('')}}</p>
                    <span v-html="brief"></span>
                    <!--                    <p>&nbsp; &nbsp;dfgdfg</p>-->
                    <br>
                    <br>
                    <h4>在线播放</h4>


                    <div class="tm-multilink">
                        <div class="multilink-table-wrap">
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <td>
                                        <a class="multilink-btn btn btn-sm btn-default bordercolor2hover bgcolor2hover" v-for="(link, pk , index) in movie_link"
                                           :key="index" @click="toNumber(link)">
                                            <i class="fa fa-play">
                                            </i>{{index+1}}
                                        </a>

                                    </td>
                                </tr>
                                </tbody>
                            </table>

                        </div>
                    </div>

                    <p><span>Category:</span>
                        <a @click="toCategory(category)">{{category}}</a>
                    </p>
                    <p>
                        <span>Tag:</span>
                        <span v-for="(name, pk) in tag_dic" :key="pk">
                            <a @click="toTag(pk,name)">{{name}}/</a>
                        </span>
                    </p>


<!--    <div v-if="!comments">-->
<!--        <br>-->
<!--        <br>-->
<!--        <h5 style="text-align: center">暂无评论</h5>-->
<!--        <br>-->
<!--        <br>-->
<!--    </div>-->
                    <ul class="list-group">

                            <li class="list-group-item" v-for="(comment, index) in comments" :key="comment.pk">


                                <span>#</span>
                                <span>{{index}}楼&nbsp;&nbsp;</span>
                                <span>{{comment.user}}发布于</span>
                                <span>{{comment.create_time.split('').splice(0,10).join('')}}</span>
<!--                                <span class="pull-right glyphicon glyphicon-fire fire" @click="addHot(comment.pk, index, comment.user)">{{comment.hot}}</span>-->



                                <hr>
                                <div>
                                        <p>{{comment.content}}</p>
                                </div>
                            </li>

                            <li v-if="temp" class="list-group-item">

                                <span>{{username}}发布</span>
                                <hr>
                                <p>{{content}}</p>
                            </li>

                    </ul>
                    <div id="commentform_title">发表评论</div>
                    <div v-if="token">
                        <p>
                            昵称：
                            <el-input
                              size="small"
                              :placeholder="username"
                              v-model="username"

                              :disabled="true">
                            </el-input>
                        </p>
                        <div>
                            <el-input
                              type="textarea"
                              :rows="2"
                              placeholder="请输入内容"
                              maxlength="100"
                              show-word-limit
                              v-model="textarea">
                            </el-input>
                        </div>
                        <button id="id_submit" class="btn btn-success" @click="commitComment">提交</button>
                        <span id="id_back" style="color: red"></span>
                    </div>






                </div>
                <div class="col-md-3">
                    <Tag></Tag>
                </div>

            </div>
        </div>
        <Footer></Footer>
    </div>
</template>

<script>
    import Header from '@/components/Header'
    import Tag from '@/components/Tag'
    import Footer from '@/components/Footer'
    import WatchForm from '@/components/WatchForm'
    // 加载组件
    import {videoPlayer} from 'vue-video-player';

    export default {
        name: "MovieDetail",
        components: {
            Header,
            Tag,
            Footer,
            videoPlayer,
            WatchForm
        },
        data() {
            return {
                playerOptions: {
                    aspectRatio: '16:9', // 将播放器置于流畅模式，并在计算播放器的动态大小时使用该值。值应该代表一个比例 - 用冒号分隔的两个数字（例如"16:9"或"4:3"）
                    sources: [{ // 播放资源和资源格式
                        type: "video/mp4",
                        src: this.link //你的视频地址（必填）
                    }],
                },
                name: '',
                upTime: '',
                brief: '',
                category: '',
                tag_dic: '',
                movie_link: '',
                link:'',
                pk:'',
                comments:'',
                token:'',
                username:'',
                textarea:'',
                temp:'',
                content:''
                // category_dic:{'电影':'movie'}
            }
        },
        methods: {
            onPlayerPlay() {

            },
            onPlayerPause() {

            },
            toTag(pk, name) {
                this.$router.push({
                    name: 'tag',
                    query: {id: pk, name: name}
                })
            },
            toNumber(link) {
                this.playerOptions.sources[0].src = link
                // console.log(link);
                // this.link = link
            },
            toCategory(category){
                this.$router.push({
                    name:category
                })

            },
            addHot(commentPk, index, username){
                this.$axios({
                    url:this.$settings.base_url + 'user/add/hot',
                    method:'post',
                    data:{
                        username:username,
                        comment_pk:commentPk
                    }
                });
                this.comments[index].hot += 1;
            },
            commitComment(){
                this.$axios({
                    url:this.$settings.base_url + 'user/commit/comment/',
                    method:'post',
                    headers:{
                        'authorization': 'bearer ' + this.$cookies.get('token')
                    },
                    data:{content:this.textarea,movie_pk:this.pk}
                }).then((response)=>{
                    window.console.log(response.data.msg);
                    this.$message({
                      message: response.data.msg,
                      type: 'success',
                      duration:1000,
                        showClose:true
                    });
                    this.temp='123';
                        this.content = this.textarea;
                        this.textarea = '';

                }).catch(()=>{
                    this.$message({
                      message: '评论失败',
                      type: 'error',
                      duration:1000,
                        showClose:true
                    });
                    this.textarea = ''
                })
            }
        },
        created() {
            let movie = this.$route.query.pk;
            this.pk = movie;
            this.$axios({
                url: this.$settings.base_url + 'all/movie/show/',
                method: 'get',
                params: {
                    movie: movie
                }
            }).then((response) => {
                // window.console.log(response);
                this.name = response.data.results.name;
                this.upTime = response.data.results.upload_time;
                this.brief = response.data.results.brief;
                this.category = response.data.results.category;
                this.tag_dic = response.data.results.tag_dic;
                // this.movie_link = response.data.results.movie_link;


                // this.playerOptions.sources[0].src = response.data.results.movie_link['1']
            });
            this.$axios({
                url:this.$settings.base_url + 'all/movie/link/',
                method:'get',
                params: {
                    movie: movie
                },
                headers:{'authorization': 'bearer ' + this.$cookies.get('token')}
            }).then((response)=>{
                window.console.log(response);
                if(response.data.status===0){
                    this.movie_link = response.data.results.movie_link;
                    this.playerOptions.sources[0].src = response.data.results.movie_link['1']
                }else{
                    this.$message({
                      message: response.data.msg,
                      type: 'error',
                      duration:1000,
                        showClose:true
                    });
                }
            }).catch((error)=>{
                window.console.log(error)
            });
            this.$axios({
                url:this.$settings.base_url + 'user/all/comments/',
                method: 'get',
                params:{movie_pk:movie}
            }).then((response)=>{
                window.console.log(response);
                this.comments = response.data.results
            });
            this.token = this.$cookies.get('token');
            this.username = this.$cookies.get('username');
            this.$axios({
                url: this.$settings.base_url + 'user/watch/record/',
                method:'post',
                data:{'movie_pk':movie},
                headers: {'authorization': 'bearer ' + this.$cookies.get('token')}
            })

        }
    }
</script>

<style scoped>
    span {
        color: #8e8e8e
    }

    a {
        cursor: pointer;
    }

    .online {
        border: 1px solid #e7e7e7;
        border-radius: 5%;
    }

    .number {
        margin: 10px 0;
    }
    .tm-multilink {
    border: solid 1px #e7e7e7;
    border-radius: 3px;
    overflow: hidden;
    margin: 5px;
    margin-bottom: 10px;
}
    .tm-multilink .multilink-table-wrap {
    margin: -1px -2px -1px -1px;
}
    .tm-multilink .table {
    margin-bottom: 0;
}
    .table-bordered {
    border: 1px solid #ddd;
}
    .table {
    width: 100%;
    margin-bottom: 20px;
}
    table {
    max-width: 100%;
    background-color: transparent;
}
    table {
    border-collapse: collapse;
    border-spacing: 0;
}
    tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}
    article.single-video-view .item-content, .content-single {
    line-height: 1.8;
}
    table {
    border-collapse: separate;
    border-spacing: 2px;
}
    .tm-multilink .table-bordered>tbody>tr>td {
    border-color: #e7e7e7;
}
    .table-bordered>thead>tr>th, .table-bordered>tbody>tr>th, .table-bordered>tfoot>tr>th, .table-bordered>thead>tr>td, .table-bordered>tbody>tr>td, .table-bordered>tfoot>tr>td {
    border: 1px solid #ddd;
}
    .table thead>tr>th, .table tbody>tr>th, .table tfoot>tr>th, .table thead>tr>td, .table tbody>tr>td, .table tfoot>tr>td {
    padding: 8px;
    line-height: 1.428571429;
    vertical-align: top;
    border-top: 1px solid #ddd;
}
    .tm-multilink .table-bordered>tbody>tr>td a {
    min-width: 77px;
}
    .multilink-btn {
    margin: 2px 2px 2px 0;
    color: #999;
    background-color: #fbfbfb;
}
    .btn-sm, .btn-xs {
    padding: 5px 9px;
    /* padding: 5px 10px; */
    font-size: 12px;
    line-height: 1.5;
    border-radius: 3px;
}
    .btn-default {
    color: #333;
    background-color: #fff;
    border-color: #ccc;
}
/*    .btn {*/
/*    display: inline-block;*/
/*    padding: 6px 12px;*/
/*    margin-bottom: 0;*/
/*    font-size: 14px;*/
/*    font-weight: normal;*/
/*    line-height: 1.428571429;*/
/*    text-align: center;*/
/*    white-space: nowrap;*/
/*    vertical-align: middle;*/
/*    cursor: pointer;*/
/*    border: 1px solid transparent;*/
/*    border-radius: 4px;*/
/*    -webkit-user-select: none;*/
/*    -moz-user-select: none;*/
/*    -ms-user-select: none;*/
/*    -o-user-select: none;*/
/*    user-select: none;*/
/*}*/
    .fire:hover {
        color: red;
        cursor: pointer;
    }
    #commentform_title {
            color: #6a6352;
        }
    #id_submit {
        margin-top: 5px;
    }


</style>