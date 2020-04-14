<template>
    <div>
        <Header></Header>
        <div class="row">
            <div class="col-md-3">
                <SiteInfo></SiteInfo>

            </div>

            <div style="margin-left: 50px">
                <div class="col-md-9">
                    <el-form ref="form" :model="form" label-width="80px">
                        <el-form-item label="用户名">
                            <el-input v-model="form.name" suffix="必填" type="text" style="width:46%"></el-input><span>(必填)</span>
                        </el-form-item>

                        <el-form-item label="生日">
                            <el-col :span="11">
                                <el-date-picker type="date" placeholder="选择日期" v-model="form.birthday"
                                                style="width: 100%;">
                                </el-date-picker><span>(选填)</span>
                            </el-col>
                        </el-form-item>

                        <el-form-item label="性别">
                            <el-radio-group v-model="form.gender">
                                <el-radio label="男"></el-radio>
                                <el-radio label="女"></el-radio>
                                <el-radio label="未知"></el-radio>
                            </el-radio-group>
                        </el-form-item>


                        <el-form-item label="个人简介">
                            <el-input type="textarea" v-model="form.desc"></el-input>
                        </el-form-item>
                        <el-form-item>
                            <el-button type="primary" @click="onSubmit">立即修改</el-button>
                            <el-button>取消</el-button>
                        </el-form-item>
                    </el-form>
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
                form: {
                  name: '',
                  birthday: '',
                  gender: '男',
                  desc: '',
                    imageUrl:''
                },

            }
        },
        created() {
            this.$axios({
                url:this.$settings.base_url + 'user/user_info/',
                method:'get',
                headers: {
                    'authorization': 'bearer ' + this.$cookies.get('token')
                }
            }).then((response)=>{
                window.console.log(response);
                this.form.name = response.data.results.username;
                this.form.birthday = response.data.results.birthday;
                this.form.gender = response.data.results.get_gender;
                this.form.desc = response.data.results.introduction;
                this.form.imageUrl = response.data.results.avatar;
            }).catch((error)=>{
                window.console.log(error)
            })

        },
        methods: {
            onSubmit(){

                if(this.form.gender==='男'){
                    this.form.gender = 1
                }else if(this.form.gender==='女'){
                    this.form.gender = 2
                }else if(this.form.gender==='未知'){
                    this.form.gender = 3
                }
                this.$axios({
                    url:this.$settings.base_url + 'user/change/info/',
                    method:'post',
                    headers: {
                    'authorization': 'bearer ' + this.$cookies.get('token')
                    },
                    data:{
                        username:this.form.name,
                        birthday:this.form.birthday,
                        gender:this.form.gender,
                        introduction:this.form.desc,
                    }
                }).then((response)=>{
                    window.console.log(response);
                    this.$message({
                      message: response.data.msg,
                      type: 'success',
                      duration:1000,
                        showClose:true
                        });
                    this.$router.push({
                        name:'Site'
                    })
                }).catch((error)=>{
                    window.console.log(error);
                    this.$message({
                      message: '修改失败',
                      type: 'error',
                      duration:1000,
                        showClose:true
                        });

                })
            },


        }
    }
</script>


<style scoped>

.avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }
  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 178px;
    height: 178px;
    line-height: 178px;
    text-align: center;
  }
  .avatar {
    width: 178px;
    height: 178px;
    display: block;
  }
          .avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }
  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 178px;
    height: 178px;
    line-height: 178px;
    text-align: center;
  }
  .avatar {
    width: 178px;
    height: 178px;
    display: block;
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