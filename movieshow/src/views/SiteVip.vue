<template>
    <div>
        <Header></Header>
        <div class="row">
            <div class="col-md-3">
                <SiteInfo></SiteInfo>
            </div>


        </div>
    </div>
</template>

<script>
    import Header from '@/components/Header'
    import SiteInfo from '@/components/site-info'
    export default {
        name: "SiteVip",
        components:{
            Header,
            SiteInfo
        }
    }
</script>

<style scoped>

</style>