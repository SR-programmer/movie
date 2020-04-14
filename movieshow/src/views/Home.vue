<template>
    <div class="home">
        <Header></Header>
        <Banner></Banner>
        <M_1></M_1>
        <M_2></M_2>
        <M_3></M_3>
        <M_4></M_4>
        <M_5></M_5>
        <Footer></Footer>
    </div>
</template>

<script>
    // @ is an alias to /src
    import Header from '@/components/Header'
    import Banner from '@/components/Banner'
    import M_1 from '@/components/M-1'
    import M_2 from '@/components/M-2'
    import M_3 from '@/components/M-3'
    import M_4 from '@/components/M-4'
    import M_5 from '@/components/M-5'
    import Footer from '@/components/Footer'

    export default {
        name: 'home',
        components: {
            Header,
            Banner,
            M_1,
            M_2,
            M_3,
            M_4,
            M_5,
            Footer,
        }
    }
</script>


<style scoped>
[v-cloak] {
        display: none;
    }
</style>
