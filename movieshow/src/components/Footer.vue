<template>
    <div>
        <footer class="dark-div123">
            <div class="bottom-nav1">
                <div class="container">
                    <div class="row">
                        <div class="copyright col-md-6">Copyright © 2016-2019 Novipnoad. All Rights Reserved.</div>
                        <nav class="col-md-6">
                            <ul class="bottom-menu list-inline pull-right">
                                <li class="menu-item menu-item-type-custom menu-item-object-custom"><a
                                        href="">联系我们</a></li>
                                <li class="menu-item menu-item-type-custom menu-item-object-custom"><a
                                        href="">免责声明</a></li>
                                <li class="menu-item menu-item-type-custom menu-item-object-custom"><a
                                        href="">下线公告</a></li>
                                <li class="menu-item menu-item-type-custom menu-item-object-custom"><a
                                        href="">网站状态</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </footer>
    </div>

</template>

<script>
    export default {
        name: "Footer"
    }
</script>

<style scoped>
.dark-div123 {
    /*background: #000;*/
    color: #8e8e8e;
}
    .bottom-nav1 {
    /*background: #000;*/
    padding: 30px 0;
    /*border-top: solid 1px #2b2b2b;*/
}

    .container:before, .container:after {
    display: table;
    content: " ";
}
/*    .row {*/
/*    margin-right: -15px;*/
/*    margin-left: -15px;*/
/*}*/
/*    .col-md-6 {*/
/*    width: 50%;*/
/*}*/
    a {
        text-decoration: none;
        color: #8e8e8e;
    }
    a:hover {
        color: #f9c73d;
    }
</style>