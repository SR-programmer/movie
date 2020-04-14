<template>
    <div id="sidebar" class="">
        <div id="tag_cloud-12" class=" 1 widget widget-border widget_tag_cloud"><h2 class="widget-title maincolor2">
            热门标签</h2>
            <div class="tagcloud"><span title="560 topics" v-for="tag in tag_list" :key="tag.pk"
                                     :style="{'font-size':tag.weight + 'px'}" @click="toTag(tag.id, tag.name)">{{tag.name}}</span>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "Tag",
        data(){
            return {
                tag_list: ''
            }
        },
        methods:{
            toTag(pk, name){
                // console.log(name);
                this.$emit('give_pk', pk, name);
                this.$router.push({
                    name:'tag',
                    query:{id:pk, name:name}
                })
            }

        },
        created() {
            this.$axios({
                url: this.$settings.base_url + 'all/hot_tag/',
                method: 'get'
            }).then(response =>{
                // window.console.log(response);
                this.tag_list = response.data
            })
        }
    }





</script>

<style scoped>
 .widget-border {
    border: solid 1px #e7e7e7;
    border-radius: 4px;
    padding: 25px 30px 20px;
     display: block;
 }
    span {
        color: dodgerblue;
    }
    span:hover {
        color: #333333;
        cursor: pointer;
    }
</style>