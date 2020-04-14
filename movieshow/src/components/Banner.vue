<template>
        <el-carousel height="300px" :interval="3000" arrow="always" type="card">


            <el-carousel-item v-for="banner in banner_list" :key="banner.name" >
                <a :href="banner.link">
                    <img :src="banner.image" alt="" :title="banner.note">
                </a>
            </el-carousel-item>

        </el-carousel>
</template>
<script>
    export default {
        name: "Banner",
        data() {
            return {
                banner_list: []
            }
        },
        created() {
            this.$axios({
                url: this.$settings.base_url + 'home/banners/',
                method: 'get',

            }).then((response) => {
                window.console.log(response);
                window.console.log(response.data);
                this.banner_list = response.data
            }).catch(function (errors) {
                window.console.log(errors)
            })
        }
    }
</script>

<style scoped>


    .el-carousel__item img {
        text-align: center;
        height: 300px;
        margin: 0 auto;
        display: block;
    }
</style>