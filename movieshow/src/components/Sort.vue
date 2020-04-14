<template>
    <div class="video-listing-filter">
        <div class="btn-group btn-group-sm hidden-xs">
            <span href="" class="btn btn-default maincolor2hover " @click="changeSort('upload_time', lookInfo)" :class="{active: showName == 'upload_time'}">Date</span>

            <span href="" class="btn btn-default maincolor2hover " @click="changeSort('views', lookInfo)" :class="{active: showName == 'views'}">Views</span>
            <span href="" class="btn btn-default maincolor2hover " @click="changeSort('up_num', lookInfo)" :class="{active: showName == 'up_num'}">Up</span>
            <span href="" class="btn btn-default maincolor2hover com-ment " @click="changeSort('comments', lookInfo)" :class="{active: showName == 'comments'}">Comments</span>
        </div>
    </div>
</template>

<script>
    export default {
        name: "Sort",
        data(){
            return {
                showName: '',

            }
        },
        props: ['lookInfo'],
        methods:{
            changeSort(name, lookInfo){
                this.showName = name;
                // console.log(this.info);
                this.$axios({

                    url: this.$settings.base_url + lookInfo,
                    method: 'get',
                    params:{
                        name:name
                    }
                }).then((response)=>{
                    window.console.log(response)
                })
            }
        },
    }
</script>

<style scoped>
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
    display: block!important;
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

</style>