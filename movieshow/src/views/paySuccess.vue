<template>
    <div>
        <Header></Header>
        <div class="row">
            <div class="col-md-3">
                <SiteInfo></SiteInfo>
            </div>
            <div class="col-md-9">
                <div class="order-info">
                    <p class="info"><b>订单号：</b><span>{{ result.out_trade_no }}</span></p>
                    <p class="info"><b>交易号：</b><span>{{ result.trade_no }}</span></p>
                    <p class="info"><b>付款时间：</b><span><span>{{ result.timestamp }}</span></span></p>
                </div>

            </div>
        </div>
    </div>
</template>

<script>
    import Header from '@/components/Header'
    import SiteInfo from '@/components/site-info'
    export default {
        name: "paySuccess",
        components:{
            Header,
            SiteInfo
        },
        created() {
            let token = this.$cookies.get('token');
            if (!token){
             this.$message({
              message: '你还未登录',
              type: 'error',
              duration:1000,
                showClose:true
                });
            }
            localStorage.this_nav = '/';
            if (!location.search.length) return;
            let params = location.search.substring(1);
            let items = params.length ? params.split('&') : [];
            //逐个将每一项添加到args对象中
            for (let i = 0; i < items.length; i++) {
                let k_v = items[i].split('=');
                //解码操作，因为查询字符串经过编码的
                let k = decodeURIComponent(k_v[0]);
                let v = decodeURIComponent(k_v[1]);
                this.result[k] = v;
                // this.result[k_v[0]] = k_v[1];
            }
            this.$axios({
                url: this.$settings.base_url + 'user/pay/success/' + location.search,
                method: 'patch',
                headers: {
                    Authorization: token
                }
            }).then(response => {
                window.console.log(response.data);
            }).catch(() => {
                window.console.log('支付结果同步失败');
            })

        },
        data(){
            return {
                result: {}
            }
        }
    }
</script>

<style scoped>
    .order-info {
        padding: 25px 48px;
        padding-bottom: 15px;
        border-bottom: 1px solid #f2f2f2;
    }

    .order-info p {
        display: -ms-flexbox;
        display: flex;
        margin-bottom: 10px;
        font-size: 16px;
    }

    .order-info p b {
        font-weight: 400;
        color: #9d9d9d;
        white-space: nowrap;
    }
.info {
        color: #ec6730;
    }

</style>