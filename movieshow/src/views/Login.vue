<template>
    <div class="login box">
        <img src="@/assets/img/login_back.jpg" alt="">
        <div class="login">
            <div class="login-title">
                <img src="@/assets/img/logo.png" alt="">
                <p>游戏开始就把你们全杀光!</p>
            </div>
            <div class="login_box">
                <div class="title">
                    <span :class="{active: a0}" @click="changeLogin(0)">密码登录</span>
                    <span :class="{active: a1}" @click="changeLogin(1)">短信登录</span>
                </div>
                <div class="inp" v-if="login_type==0">
                    <input v-model="username" type="text" placeholder="用户名 / 手机号码" class="user">
                    <input v-model="password" type="password" name="" class="pwd" placeholder="密码">
                    <div id="geetest1"></div>
                    <div class="rember">
                        <p>
                            <input id="checkbox" type="checkbox" class="no" v-model="remember"/>
                            <span>记住密码</span>
                        </p>
                        <p>忘记密码</p>
                    </div>
                    <button class="login_btn" @click="loginAction">登录</button>
                    <p class="go_login">没有账号
                        <router-link to="/register">立即注册</router-link>
                    </p>
                </div>
                <div class="inp" v-show="login_type==1">
                    <input v-model="mobile" type="text" placeholder="手机号码" class="user">
                    <div class="sms">
                        <input v-model="sms" type="text" placeholder="输入验证码" class="user">
                        <span class="sms_btn" @click="send_sms">{{sms_interval_tips}}</span>
                    </div>
                    <button class="login_btn" @click="loginMobile">登录</button>
                    <p class="go_login">没有账号
                        <router-link to="/register">立即注册</router-link>
                    </p>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: 'Login',
        data() {
            return {
                a0: 1,
                a1: 0,
                login_type: 0,
                username: "",
                password: "",
                remember: false,
                mobile: "",
                sms: "",
                is_send: false,  // 是否在60s内发送了短信
                sms_interval_tips: "获取验证码",
            }
        },
        created() {
            // 拦截已登录情况
            let token = this.$cookies.get('token');
            if (token) {
                this.$message({
                    message: '无需重复登录',
                    duration: 1000,
                    onClose: () => {
                        this.$router.go(-1)
                    }
                })
            }
        },
        methods: {
            changeLogin(i) {
                this.login_type = i;
                if (i) {
                    this.a0 = 0;
                    this.a1 = 1;
                } else {
                    this.a0 = 1;
                    this.a1 = 0;
                }
            },

            loginAction() {
                if (!this.username || !this.password) {
                    return
                }
                this.$axios({
                    url: this.$settings.base_url + 'user/login/',
                    method: 'post',
                    data: {
                        'username': this.username,
                        'password': this.password
                    }
                }).then((response) => {
                    // 判断用户是否要记住密码
                    if (this.remember) {  // 记住密码
                        sessionStorage.clear();
                        localStorage.token = response.data.results.token;
                        localStorage.username = response.data.results.username;
                        localStorage.mobile = response.data.results.mobile;
                    } else { /// 没记住密码
                        localStorage.clear();
                        sessionStorage.token = response.data.results.token;
                        sessionStorage.username = response.data.results.username;
                        sessionStorage.mobile = response.data.results.mobile;
                    }

                    if (response.data.status == 0) {
                        let token = response.data.results.token;
                        this.$cookies.set('token', token, 24 * 60 * 60);
                        let username = response.data.username;
                        this.$cookies.set('username', username, 24 * 60 * 60);
                        let pk = response.data.pk;
                        this.$cookies.set('pk', pk, 24 * 60 * 60);
                        this.$alert("欢迎回来！", "登录成功！", {
                            confirmButtonText: '确定',
                            callback: () => {
                                // 登录成功去主页
                                this.$router.push("/");
                            }
                        })
                    } else {
                        this.username = '';
                        this.password = '';
                    }
                }).catch(() => {
                    this.$alert("检查账号密码！", "登录失败！", {
                        confirmButtonText: '确定',
                        callback: () => {
                            this.username = '';
                            this.password = '';
                        }
                    });

                })
            },

            send_sms() {
                // 发送短信
                if (!/^1[3-9]\d{9}$/.test(this.mobile)) {
                    this.$message({
                        message: "对不起！手机号码格式有误！"
                    });
                    return false;
                }

                // 判断是否在60s内发送过短信
                if (this.is_send) {
                    this.$message({
                        message: "对不起,不能频繁发送短信验证！"
                    });
                    return false;
                }

                // 请求发送短信
                this.$axios({
                    url: this.$settings.base_url + 'user/sms/',
                    method: 'post',
                    data: {
                        mobile: this.mobile
                    }
                }).then(response => {
                    let msg = response.data.result;
                    this.$message({
                        message: msg,
                    });
                    if (msg === '短信发送失败') return;

                    // 修改短信的发送状态
                    this.is_send = true;

                    // 设置间隔时间60s
                    let sms_interval_time = 60;
                    // 设置短信发送间隔倒计时,.60s后把is_send改成false
                    let timer = setInterval(() => {
                        if (sms_interval_time <= 1) {
                            clearInterval(timer);
                            this.sms_interval_tips = "获取验证码";
                            this.is_send = false; // 重新回复点击发送功能的条件
                        } else {
                            sms_interval_time -= 1;
                            this.sms_interval_tips = `${sms_interval_time}秒后再次获取`;
                        }
                    }, 1000);

                }).catch(error => {
                    this.$message({
                        message: error.response.data.msg,
                    })
                });

            },

            loginMobile() {
                // 注册信息提交
                if (!/^1[3-9]\d{9}$/.test(this.mobile)) {
                    this.$message({
                        message: "对不起！手机号码格式有误！"
                    });
                    return false;
                }

                if (this.sms.length < 1) {
                    this.$message({
                        message: "短信验证码不能为空！"
                    });
                    return false;
                }

                this.$axios({
                    url: this.$settings.base_url + 'user/login/mobile/',
                    method: 'post',
                    data: {
                        mobile: this.mobile,
                        code: this.sms
                    }
                }).then(response => {
                    let _this = this;
                    let status = response.data.status;
                    let msg = response.data.msg;
                    if (status === 0) {
                        // cookie存储token，保存登录状态
                        let token = response.data.token;
                        _this.$cookies.set('token', token, 24 * 60 * 60);
                        let username = response.data.username;
                        window.console.log(response.data);

                        _this.$cookies.set('username', username, 24 * 60 * 60);

                        _this.$message({
                            message: '登录成功',
                            duration: 1000,
                            onClose() {
                                // 保存登录状态
                                sessionStorage.token = token;
                                sessionStorage.username = response.data.results.username;
                                sessionStorage.mobile = response.data.results.mobile;
                                sessionStorage.pk = response.data.results.pk;
                                // 跳转到主页
                                _this.$router.push('/');
                            }
                        });
                    }
                    else {
                        _this.mobile = '';
                        _this.sms = '';
                        _this.$message({
                            message: msg,
                        });
                    }

                }).catch(error => {
                    this.mobile = '';
                    this.sms = '';
                    this.$message({
                        message: error.response.data.result
                    });
                })

            },
        },

    };
</script>

<style scoped>
    .box {
        width: 100%;
        height: 100%;
        position: relative;
        overflow: hidden;
    }

    .box img {
        width: 100%;
        min-height: 100%;
    }

    .box .login {
        position: absolute;
        width: 500px;
        height: 400px;
        left: 0;
        margin: auto;
        right: 0;
        bottom: 0;
        top: -338px;
    }

    .login .login-title {
        width: 100%;
        text-align: center;
        padding-top: 20px;
    }

    .login-title img {
        width: 190px;
        height: auto;
    }

    .login-title p {
        font-family: PingFangSC-Regular;
        font-size: 18px;
        color: #fff;
        letter-spacing: .29px;
        padding-top: 10px;
        padding-bottom: 50px;
    }

    .login_box {
        width: 400px;
        height: auto;
        background: #fff;
        box-shadow: 0 2px 4px 0 rgba(0, 0, 0, .5);
        border-radius: 4px;
        margin: 0 auto;
        padding-bottom: 40px;
    }

    .login_box .title {
        font-size: 20px;
        color: #9b9b9b;
        letter-spacing: .32px;
        border-bottom: 1px solid #e6e6e6;
        display: flex;
        justify-content: space-around;
        padding: 50px 60px 0 60px;
        margin-bottom: 20px;
        cursor: pointer;
    }

    .login_box .title span.active {
        color: #4a4a4a;
        border-bottom: 2px solid #84cc39;
    }

    .inp {
        width: 350px;
        margin: 0 auto;
    }

    .inp input {
        outline: 0;
        width: 100%;
        height: 45px;
        border-radius: 4px;
        border: 1px solid #d9d9d9;
        text-indent: 20px;
        font-size: 14px;
        background: #fff !important;
    }

    .inp input.user {
        margin-bottom: 16px;
    }

    .inp .rember {
        display: flex;
        justify-content: space-between;
        align-items: center;
        position: relative;
        margin-top: 10px;
    }

    .inp .rember p:first-of-type {
        font-size: 12px;
        color: #4a4a4a;
        letter-spacing: .19px;
        margin-left: 22px;
        display: -ms-flexbox;
        display: flex;
        -ms-flex-align: center;
        align-items: center;
        /*position: relative;*/
    }

    .inp .rember p:nth-of-type(2) {
        font-size: 14px;
        color: #9b9b9b;
        letter-spacing: .19px;
        cursor: pointer;
    }

    .inp .rember input {
        outline: 0;
        width: 30px;
        height: 45px;
        border-radius: 4px;
        border: 1px solid #d9d9d9;
        text-indent: 20px;
        font-size: 14px;
        background: #fff !important;
    }

    .inp .rember p span {
        display: inline-block;
        font-size: 12px;
        width: 100px;
        /*position: absolute;*/
        /*left: 20px;*/

    }

    #geetest {
        margin-top: 20px;
    }

    .login_btn {
        width: 100%;
        height: 45px;
        background: #84cc39;
        border-radius: 5px;
        font-size: 16px;
        color: #fff;
        letter-spacing: .26px;
        margin-top: 30px;
    }

    .inp .go_login {
        text-align: center;
        font-size: 14px;
        color: #9b9b9b;
        letter-spacing: .26px;
        padding-top: 20px;
    }

    .inp .go_login a {
        color: #84cc39;
        cursor: pointer;
    }

    #get_code {
        border: 0;
        width: 120px;
        height: 30px;
        background-color: antiquewhite;
        outline: none;
    }

    #get_code:active {
        color: white;
    }

    #checkbox {
        width: 20px;
        height: 20px;
    }

    .sms {
        position: relative;
    }

    .sms .sms_btn {
        position: absolute;
        top: -12px;
        right: 0;
        bottom: 0;
        margin: auto;
        width: 130px;
        text-align: center;
        height: 24px;
        color: #ff7000;
        cursor: pointer;
        border-left: 1px solid #999;
    }
</style>