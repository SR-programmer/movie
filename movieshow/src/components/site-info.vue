<template>
    <div>
        <div style="min-width:965px !important" class="common_container">
            <div class="main">
                <dl data-spm="table" class="silder" data-spm-max-idx="8">
                    <dt>
                        <div style="position:absolute;width:100%;height:261px;background-color:#fff;opacity:0.7;z-index:11"></div>
                        <img class="avator-bg" src="https://static.youku.com/user/img/avatar/310/52.jpg">
                        <div style="position:relative;z-index:12" class="info"><img style="border-radius:100%"
                                                                                    class="avator"
                                                                                    :src="avatar">
                            <div class="name"><span style="color:#333;font-weight:800">{{username}}</span></div>
                            <div>
                                <div class="vip-des" v-if="isVip">
                                    会员等级:{{vipLevel}}
                                    <p>会员过期时间:{{vipExp.split('').splice(0, 10).join('')}}</p>
                                </div>
                                <div class="vip-des" v-else>开通会员尊享超值特权</div>
                                <a data-type="default" data-products="" data-tag="index_youku_btn"
                                   class="vip-link youku_vip_pay_btn" href="javascript:void(0);"
                                   data-aplus-clk="x57_1c1a368f" data-spm-anchor-id="user.playlsit.table.1"
                                   @click="joinVip" style="margin-top: 0">开通会员</a>
                            </div>
                        </div>
                    </dt>
                    <dd class="active"><a
                                          data-spm-anchor-id="user.playlsit.table.2"
                                          data-aplus-clk="x58_19c07da9" @click="toSite">历史播放</a></dd>
                    <dd class=""><a data-spm-anchor-id="user.playlsit.table.5" data-aplus-clk="x61_7b61b2e7" @click="toVipMovie">VIP会员</a>
                    </dd>
                    <dd class=""><a data-spm-anchor-id="user.playlsit.table.6"
                                    data-aplus-clk="x62_7e9881b">创作中心</a></dd>
                    <dd class=""><a data-spm-anchor-id="user.playlsit.table.7" data-aplus-clk="x63_64439f1e" @click="toChangeInfo">修改信息</a>
                    </dd>
                </dl>
            </div>
        </div>

        <div class="bili-pay-plugin" :style="{display: isShow}">
            <div class="bili-pay-plugin-box">
            <div data-v-a35c7fec="" class="bili-pay-box-wrapper pay-box-type-1">
                <div data-v-586cd7a1="" data-v-a35c7fec="" class="bili-pay-header-wrapper"><!----> <img
                        data-v-586cd7a1="" width="36" height="36" class="bili-pay-avatar"
                        src="https://static.hdslb.com/images/member/noface.gif"> <span data-v-586cd7a1=""
                                                                                       class="text-nowrap bili-pay-uname">{{username}}</span>
                    <!----> <span data-v-586cd7a1="" class="bili-pay-close glyphicon glyphicon-remove" @click="leveVip"></span></div>
                <div data-v-a35c7fec="">
                    <div data-v-a35c7fec="" class="bili-pay-message-wrapper text-nowrap hide"><i
                            class="bili-pay-msg-icon"></i>

                    </div>
                    <div data-v-a35c7fec="" class="bili-pay-box-default">
                        <div data-v-a35c7fec="" class="bili-pay-tabs-wrapper">
                            <div class="bili-pay-tabs-item"><span
                                    class="bili-pay-tabs-item-span bili-pay-tabs-item-span-active">大会员套餐</span></div>

                        </div>
                        <div data-v-a35c7fec="" class="bili-pay-for-qr">
                            <div data-v-a35c7fec="" class="pay-for-money-wrapper">
                                <div class="bili-pay-txt-default">适用于PC/手机/ipad</div>
                                <div class="pay-for-money-list">

                                    <div :class="{'pay-for-money-item':a, 'pay_active':months===product.month}" @click="selectVip(product.month, product.real_price, product.price, product.id)" v-for="product in vip_product_list" :key="product.id">
                                        <span
                                            class="pay-for-money-dis">
                                            6.3折
                                        </span>
                                        <p class="pay-for-money-price">
                                            {{product.real_price}}
                                            <i class="pay-for-money-org-price">{{product.price}}</i></p>
                                        <p class="pay-for-money-text">{{product.name}}</p>
                                    </div>

                                </div>

                                <div class="pay-for-money-check"><label role="checkbox" aria-checked="true"
                                                                        class="el-checkbox is-checked"><span
                                        aria-checked="mixed" class="el-checkbox__input is-checked"><span
                                        class="el-checkbox__inner"></span><input type="checkbox"
                                                                                 class="el-checkbox__original" value=""></span><span
                                        class="el-checkbox__label">到期自动续费，可随时取消<!----></span></label></div>
                                <div class="pay-for-money-voucher-wrpapper">
                                    <div class="pay-for-money-vouche-name pay-for-money-vouche-name-disable">
                                        选择代金券：
                                        <div class="el-select el-select--mini"><!---->
                                            <div class="el-input el-input--mini is-disabled el-input--suffix">
                                                <!----><input autocomplete="off" placeholder="无可用优惠券" size="mini"
                                                              readonly="readonly" type="text" rows="2"
                                                              class="el-input__inner" disabled="disabled"
                                                              style="height: 28px;"><!----><span
                                                    class="el-input__suffix"><span class="el-input__suffix-inner"><i
                                                    class="el-select__caret el-input__icon el-icon-arrow-up"></i><!----></span>
                                                <!----></span><!----></div>
                                            <div class="el-select-dropdown el-popper" style="display: none;">
                                                <div class="el-scrollbar" style="display: none;">
                                                    <div class="el-select-dropdown__wrap el-scrollbar__wrap"
                                                         style="margin-bottom: -17px; margin-right: -17px;">
                                                        <ul class="el-scrollbar__view el-select-dropdown__list"
                                                            style="position: relative;">
                                                            <div class="resize-triggers">
                                                                <div class="expand-trigger">
                                                                    <div style="width: 1px; height: 1px;"></div>
                                                                </div>
                                                                <div class="contract-trigger"></div>
                                                            </div>
                                                        </ul>
                                                    </div>
                                                    <div class="el-scrollbar__bar is-horizontal">
                                                        <div class="el-scrollbar__thumb"
                                                             style="transform: translateX(0%);"></div>
                                                    </div>
                                                    <div class="el-scrollbar__bar is-vertical">
                                                        <div class="el-scrollbar__thumb"
                                                             style="transform: translateY(0%);"></div>
                                                    </div>
                                                </div>
                                                <p class="el-select-dropdown__empty">无数据</p></div>
                                            <div class="resize-triggers">
                                                <div class="expand-trigger">
                                                    <div style="width: 433px; height: 25px;"></div>
                                                </div>
                                                <div class="contract-trigger"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="pay-for-money-payment-wrapper">
                                    <div class="pay-for-money-payment-left">
                                        <div class="pay-for-money-payment-left-item pay-for-money-payment-left-item-active">
                                            扫码支付
                                        </div>
                                    </div>
                                    <div class="pay-for-money-payment-right">
                                        <div class="pay-for-qr-wrapper">
                                            <div class="pay-for-qr-code">
                                                <div class="pay-for-qr-style">
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 61 61">
                                                        <path fill="#ffffff" d="M0 0h61v61H0z"></path>
                                                        <path stroke="#000000"
                                                              d="M4 4.5h7m5 0h2m3 0h5m1 0h1m1 0h4m1 0h2m4 0h1m2 0h1m2 0h1m3 0h7M4 5.5h1m5 0h1m3 0h2m1 0h2m2 0h1m1 0h2m5 0h2m1 0h1m1 0h5m1 0h1m1 0h5m2 0h1m5 0h1M4 6.5h1m1 0h3m1 0h1m1 0h2m1 0h1m1 0h1m2 0h1m4 0h3m1 0h2m2 0h2m1 0h1m3 0h1m1 0h3m2 0h1m2 0h1m1 0h3m1 0h1M4 7.5h1m1 0h3m1 0h1m1 0h1m1 0h1m5 0h3m4 0h2m2 0h1m1 0h1m5 0h1m1 0h1m4 0h1m1 0h1m1 0h1m1 0h3m1 0h1M4 8.5h1m1 0h3m1 0h1m1 0h4m1 0h2m2 0h1m1 0h13m5 0h1m3 0h2m3 0h1m1 0h3m1 0h1M4 9.5h1m5 0h1m1 0h2m3 0h1m3 0h2m3 0h1m1 0h1m3 0h5m2 0h1m2 0h2m1 0h2m3 0h1m5 0h1M4 10.5h7m1 0h1m1 0h1m1 0h1m1 0h1m1 0h1m1 0h1m1 0h1m1 0h1m1 0h1m1 0h1m1 0h1m1 0h1m1 0h1m1 0h1m1 0h1m1 0h1m1 0h1m1 0h1m1 0h1m1 0h7M12 11.5h1m1 0h1m2 0h1m1 0h1m1 0h1m6 0h1m3 0h1m2 0h1m2 0h2m1 0h4m1 0h1m1 0h1M4 12.5h1m1 0h5m2 0h2m5 0h2m2 0h1m3 0h5m5 0h3m2 0h1m2 0h1m1 0h1m1 0h5M4 13.5h1m2 0h1m4 0h2m2 0h2m1 0h2m1 0h1m1 0h1m1 0h3m4 0h3m3 0h1m5 0h3m1 0h1m1 0h1m1 0h2m1 0h1M6 14.5h2m2 0h1m8 0h1m1 0h1m2 0h1m2 0h2m4 0h2m2 0h2m2 0h2m1 0h1m2 0h2m1 0h1m1 0h2M4 15.5h1m1 0h2m1 0h1m1 0h3m2 0h1m1 0h1m1 0h1m2 0h3m1 0h3m1 0h1m1 0h1m1 0h1m1 0h1m3 0h1m1 0h2m4 0h1m1 0h1m1 0h1m1 0h1M4 16.5h2m1 0h11m1 0h3m1 0h2m2 0h2m1 0h1m1 0h1m2 0h1m1 0h1m1 0h2m1 0h1m2 0h2m1 0h1m2 0h2m1 0h3M4 17.5h1m6 0h1m2 0h2m2 0h5m1 0h3m2 0h5m2 0h2m2 0h2m4 0h2m5 0h2M6 18.5h1m1 0h3m2 0h1m2 0h1m1 0h2m2 0h1m1 0h2m1 0h1m1 0h1m4 0h1m1 0h1m1 0h5m1 0h1m5 0h3m1 0h1M6 19.5h1m1 0h2m1 0h1m1 0h2m2 0h2m1 0h3m1 0h3m1 0h2m2 0h2m3 0h1m3 0h1m1 0h2m2 0h4m1 0h2M7 20.5h1m2 0h2m10 0h3m5 0h1m1 0h2m1 0h1m3 0h2m1 0h1m2 0h4m2 0h2m1 0h3M4 21.5h1m2 0h1m4 0h1m1 0h4m1 0h3m1 0h1m1 0h1m1 0h1m2 0h1m1 0h4m1 0h1m2 0h2m1 0h2m1 0h2m5 0h1m2 0h1M5 22.5h1m1 0h2m1 0h2m1 0h4m2 0h1m2 0h1m2 0h1m7 0h1m1 0h2m2 0h2m1 0h2m3 0h1m1 0h7M7 23.5h3m2 0h1m1 0h1m1 0h1m4 0h1m5 0h3m4 0h5m4 0h2m5 0h1m4 0h1M4 24.5h2m1 0h4m1 0h1m4 0h5m1 0h1m1 0h1m2 0h1m1 0h3m1 0h1m4 0h2m1 0h1m1 0h1m2 0h3m1 0h5M9 25.5h1m1 0h1m4 0h3m3 0h3m2 0h3m4 0h2m1 0h1m1 0h2m1 0h1m2 0h3m1 0h1m2 0h1m1 0h3M4 26.5h1m1 0h2m2 0h2m2 0h2m2 0h1m1 0h2m4 0h4m1 0h1m3 0h1m1 0h2m2 0h1m1 0h6m1 0h2m2 0h2M7 27.5h1m1 0h1m4 0h4m1 0h1m6 0h1m1 0h1m5 0h1m1 0h1m3 0h3m2 0h4m2 0h1M4 28.5h3m1 0h5m1 0h1m1 0h1m1 0h1m4 0h1m3 0h6m2 0h1m1 0h1m2 0h1m6 0h6m1 0h3M4 29.5h1m3 0h1m3 0h1m1 0h1m1 0h2m1 0h3m2 0h1m1 0h1m1 0h1m3 0h1m1 0h3m3 0h2m1 0h6m3 0h2m1 0h2M4 30.5h5m1 0h1m1 0h2m1 0h1m1 0h1m1 0h1m1 0h2m1 0h2m2 0h1m1 0h1m1 0h2m1 0h2m1 0h1m1 0h1m1 0h3m3 0h1m1 0h1m1 0h1m2 0h1M5 31.5h2m1 0h1m3 0h3m1 0h1m1 0h1m4 0h1m1 0h1m2 0h1m3 0h3m2 0h2m2 0h4m1 0h1m1 0h1m3 0h2M6 32.5h7m2 0h4m3 0h1m1 0h1m2 0h6m2 0h2m1 0h5m2 0h10m1 0h1M4 33.5h1m1 0h4m3 0h1m1 0h2m2 0h1m3 0h9m1 0h2m1 0h1m3 0h2m2 0h3m4 0h2m1 0h3M4 34.5h1m3 0h3m1 0h1m1 0h1m1 0h2m3 0h2m1 0h1m3 0h1m2 0h1m1 0h8m1 0h1m1 0h2m5 0h1M4 35.5h3m2 0h1m2 0h3m3 0h2m7 0h3m4 0h1m4 0h2m2 0h3m1 0h2m2 0h1m4 0h1M6 36.5h3m1 0h6m2 0h1m2 0h1m1 0h2m3 0h1m4 0h3m2 0h3m8 0h3m1 0h4M4 37.5h4m5 0h1m1 0h1m4 0h1m2 0h1m1 0h1m3 0h1m2 0h1m1 0h3m2 0h3m1 0h1m1 0h8m3 0h1M4 38.5h1m1 0h2m2 0h2m1 0h2m2 0h5m2 0h1m3 0h8m1 0h1m4 0h1m4 0h1m1 0h1m2 0h1m1 0h1M4 39.5h1m1 0h1m1 0h1m3 0h4m1 0h1m1 0h1m1 0h5m2 0h1m5 0h3m1 0h1m2 0h5m1 0h4m1 0h2M5 40.5h3m1 0h7m7 0h1m3 0h3m4 0h1m2 0h4m7 0h2m2 0h1m1 0h2M4 41.5h2m3 0h1m1 0h1m3 0h1m1 0h1m1 0h3m2 0h2m1 0h1m2 0h1m2 0h2m1 0h1m1 0h2m1 0h1m1 0h4m2 0h4m3 0h1M4 42.5h1m2 0h1m2 0h1m1 0h1m1 0h2m1 0h1m1 0h1m2 0h1m3 0h1m4 0h2m2 0h3m1 0h1m1 0h1m2 0h1m2 0h1M5 43.5h1m3 0h1m1 0h2m2 0h1m1 0h1m4 0h1m2 0h2m1 0h2m3 0h2m1 0h1m1 0h1m3 0h1m1 0h1m1 0h3m1 0h1m1 0h1M4 44.5h2m1 0h1m2 0h3m1 0h3m3 0h2m4 0h2m1 0h1m1 0h1m3 0h1m1 0h4m1 0h2m1 0h2m2 0h1m3 0h2M4 45.5h6m1 0h6m2 0h5m1 0h1m1 0h1m2 0h1m2 0h2m6 0h3m2 0h1m2 0h5m2 0h1M4 46.5h2m1 0h4m5 0h2m4 0h1m1 0h1m4 0h2m1 0h1m4 0h2m1 0h1m2 0h1m1 0h1m5 0h3M5 47.5h2m5 0h1m5 0h1m1 0h1m1 0h1m2 0h1m2 0h3m3 0h1m1 0h5m1 0h1m3 0h2m1 0h4M7 48.5h1m2 0h1m1 0h4m1 0h1m1 0h1m1 0h2m1 0h2m2 0h8m3 0h1m1 0h1m3 0h2m1 0h8M12 49.5h1m2 0h2m1 0h4m1 0h2m1 0h1m1 0h1m3 0h5m3 0h2m2 0h1m1 0h3m3 0h2m1 0h2M4 50.5h7m3 0h1m3 0h1m1 0h3m1 0h2m2 0h1m1 0h1m1 0h2m4 0h3m1 0h1m4 0h2m1 0h1m1 0h1M4 51.5h1m5 0h1m1 0h1m2 0h1m2 0h1m1 0h1m6 0h2m3 0h4m3 0h1m3 0h2m2 0h2m3 0h2m1 0h2M4 52.5h1m1 0h3m1 0h1m1 0h2m1 0h3m5 0h1m1 0h1m1 0h8m5 0h3m2 0h11M4 53.5h1m1 0h3m1 0h1m1 0h2m1 0h1m1 0h1m1 0h2m1 0h2m5 0h1m3 0h3m3 0h3m2 0h1m1 0h2m1 0h1m3 0h1M4 54.5h1m1 0h3m1 0h1m1 0h1m9 0h2m1 0h1m1 0h1m1 0h3m5 0h4m1 0h2m3 0h1m1 0h5m1 0h2M4 55.5h1m5 0h1m2 0h3m1 0h1m1 0h1m1 0h2m2 0h1m2 0h1m2 0h1m1 0h1m1 0h3m1 0h1m4 0h1m2 0h1m3 0h2m2 0h1M4 56.5h7m1 0h1m2 0h1m7 0h2m2 0h2m1 0h1m1 0h1m2 0h1m3 0h3m4 0h2m1 0h2m3 0h1"></path>
                                                    </svg>
                                                </div>
                                            </div>
                                            <p class="pay-for-qr-num">
                                                ¥{{this.real_price}}
                                                <i>原价{{this.price}}</i>
                                            </p>
                                            <p class="pay-for-payment-txt">请使用微信扫码支付</p>
                                            <button class="real_pay btn-danger" @click="goPay">支付</button>

                                        </div> <!----></div>

                                </div>
                                <div class="pay-for-money-bottom-text" style="">商品展示的划横线价格为参考价，是该商品曾经出现过的销售价，并非原价</div>
                            </div>
                        </div>
                        <div data-v-a35c7fec="" class="bili-pay-for-point" style="display: none;">
                            <div data-v-a35c7fec="" class="pay-for-money-tv-wrapper">
                                <div class="bili-pay-txt-default">适用于TV/PC/手机/ipad</div>
                                <div>
                                    <div class="pay-for-money-list">
                                        <div class="pay-for-money-item pay-for-money-item-active"><span
                                                class="pay-for-money-dis">
          新客特惠
        </span>
                                            <p class="pay-for-money-price">
                                                ¥15/月
                                                <i class="pay-for-money-org-price">¥45</i></p>
                                            <p class="pay-for-money-text">电视大会员连续包月</p></div>
                                        <div class="pay-for-money-item"><span class="pay-for-money-dis">
          4.8折
        </span>
                                            <p class="pay-for-money-price">
                                                ¥188/年
                                                <i class="pay-for-money-org-price">¥388</i></p>
                                            <p class="pay-for-money-text">年度电视大会员</p></div>
                                        <div class="pay-for-money-item"><!----> <p class="pay-for-money-price">
                                            ¥98/季
                                            <i class="pay-for-money-org-price">¥115</i></p>
                                            <p class="pay-for-money-text">季度电视大会员</p></div>
                                        <div class="pay-for-money-item"><!----> <p class="pay-for-money-price">
                                            ¥35/月
                                            <i class="pay-for-money-org-price">¥45</i></p>
                                            <p class="pay-for-money-text">月度电视大会员</p></div>
                                    </div>
                                    <div class="pay-for-money-remark"></div>
                                </div>

                                <div class="pay-for-money-payment-wrapper">
                                    <div class="pay-for-money-payment-left">
                                        <div class="pay-for-money-payment-left-item pay-for-money-payment-left-item-active">
                                            扫码支付
                                        </div>
                                    </div>
                                    <div class="pay-for-money-payment-right">
                                        <div class="pay-for-qr-wrapper">
                                            <div class="pay-for-qr-code"><img width="100%" height="100%"
                                                                              src="http://q14723aic.bkt.clouddn.com/nidiediedeweixin.jpg"
                                                                              lazy="loading"></div>
                                            <p class="pay-for-qr-num-fail">您的订单已经超时失效</p>
                                            <p class="pay-for-payment-txt">请点击二维码上方刷新按钮重试</p></div>
                                    </div>
                                </div>
                                <div class="pay-for-money-bottom-text" style="">商品展示的划横线价格为参考价，是该商品曾经出现过的销售价，并非原价</div>
                            </div>
                        </div> <!----></div>
                    <div data-v-a35c7fec="" class="bili-pay-protocol"><a data-v-a35c7fec=""
                                                                         href="https://www.bilibili.com/blackboard/big-protocol.html "
                                                                         target="_blank" class="pay-bottom-link">《大会员用户协议》</a>
                        <a data-v-a35c7fec="" href="https://www.bilibili.com/blackboard/big-protocol.html#monthly"
                           target="_blank" class="pay-bottom-link" style="">《连续包月用户协议》</a> <a data-v-a35c7fec=""
                                                                                              href="https://www.bilibili.com/blackboard/activity-EUwyVx-ou.html"
                                                                                              target="_blank"
                                                                                              class="pay-bottom-link"
                                                                                              style="display: none;">《电视大会员用户协议》</a>
                        <a data-v-a35c7fec="" href="https://www.bilibili.com/blackboard/activity-M_UgW8wJE.html"
                           target="_blank" class="pay-bottom-link" style="display: none;">《电视大会员连续包月用户协议》</a></div>
                </div>
                <div data-v-a35c7fec="" style="display: none;">
                    <div data-v-42f1dd91="" data-v-a35c7fec="" class="bili-pay-result-wrapper">
                        <div data-v-42f1dd91="" class="pay-result-fail"></div>
                        <div data-v-42f1dd91="" class="pay-result-title"></div>  <!---->
                        <div data-v-42f1dd91="" class="pay-result-btn-wrapper">
                            <div data-v-42f1dd91="" class="pay-result-btn-left pay-result-btn-left-alone">知道了</div>
                            <!----></div>
                    </div>
                </div>
            </div>
        </div>
        </div>



    </div>
</template>

<script>


    export default {
        name: "site-info",
        components: {},
        data() {
            return {
                username: '',
                avatar: this.$settings.base_url + 'media/avatar/tank大帅比.png',
                isVip: '',
                vipLevel: '',
                vipExp: '',
                buyVip:false,
                a:true,
                isShow:'none',
                year:true,
                three_month:false,
                month:false,
                price:'',
                real_price:'',
                buy_time:12,
                vip_product_list:'',
                isSelected:'',
                months:12,
                product_id:0

            }
        },
        methods: {
            joinVip() {
                let token = this.$cookies.get('token');
                if (!token) {
                    this.$message({
                        message: '请先去登录',
                        type: 'error',
                        duration: 1000,
                        showClose: true
                    });
                }
                this.isShow = 'block';
                this.$axios({
                    url: this.$settings.base_url + 'user/vip/product/',
                    method:'get',
                    headers: {
                    'authorization': 'bearer ' + this.$cookies.get('token')
                    }
                }).then((response)=>{
                    // window.console.log(response.data);
                    this.vip_product_list = response.data
                })
            },
            leveVip(){
                this.isShow = 'none'
            },
            selectVip(time,real_price, price, id) {
                if (time === 12) {
                    this.months = 12;
                    this.real_price = real_price;
                    this.price = price;
                    this.product_id =id
                } else if (time === 3) {
                    this.months = 3;
                    this.real_price = real_price;
                    this.price = price;
                    this.product_id =id
                } else {
                    this.months = 1;
                    this.real_price = real_price;
                    this.price = price;
                    this.product_id =id

                }
            },
            goPay(){
                if(this.product_id){
                    this.$axios({
                    url: this.$settings.base_url + 'user/pay/',
                    method: 'post',
                    data: {pay_app: '支付宝', product: this.product_id},
                    headers: {
                    'authorization': 'bearer ' + this.$cookies.get('token')
                }
                }).then((response)=>{
                    if (response.data.status===0){
                        let order_url = response.data.order_url;
                        window.open(order_url, '_self')
                    }else {
                        this.$message({
                      message: response.data.msg,
                      type: 'error',
                      duration:1000,
                        showClose:true
                        });
                    }

                }).catch((error)=>{
                    window.console.log(error);
                    this.$message({
                      message: '支付失败',
                      type: 'error',
                      duration:1000,
                        showClose:true
                        });
                })
                }
            },
            toSite(){
                this.$router.push({
                    name:'Site'
                })
            },
            toVipMovie(){
                this.$router.push({
                    name:'vipMovie'
                })
            },
            toChangeInfo(){
                this.$router.push({
                    name:'ChangeInfo'
                })
            }
        },
        created() {
            this.$axios({
                url: this.$settings.base_url + 'user/site/',
                method: 'post',
                headers: {
                    'authorization': 'bearer ' + this.$cookies.get('token')
                }
            }).then((response) => {
                if (response.data.results.avatar){
                    this.avatar = response.data.results.avatar;
                }
                this.username = response.data.results.username;
                this.isVip = response.data.results.is_vip;
                this.vipLevel = response.data.results.vip_level;
                this.vipExp = response.data.results.vip_exp;
            })
        }
    }

</script>


<style scoped>
    .real_pay{
        float: left;
    }
    .pay_active{
        background-color: #EDD797;
    }

    .common_container {
        margin: 0 100px;
    }

    .main {
        position: relative;
        overflow: hidden;
    }

    .main, .s_body {
        min-height: 1200px;
    }

    .main .silder {
        position: absolute;
        width: 246px;
    }

    dl, dt, div {
        margin: 0;
        padding: 0;
    }

    .main .silder dt {
        position: relative;
        width: -webkit-calc(100% - 2px);
        width: calc(100% - 2px);
        height: 261px;
        overflow: hidden;
        text-align: center;
        border: 1px solid #f8f8f8;
    }

    .main .silder dt .avator-bg {
        display: block;
        position: absolute;
        top: 0;
        width: 244px;
        height: 261px;
        -webkit-filter: blur(20px);
        filter: blur(20px);
        z-index: 10;
    }

    img {
        border: 0;
        display: block;
    }

    .main .silder dt .avator {
        margin: 40px auto 0;
        width: 90px;
        height: 90px;
    }

    .main .silder dt .name {
        margin-top: 12px;
        color: #333;
    }

    .vip-des {
        margin-top: 5px;
    }
    .bili-pay-plugin {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 1000;
    background: rgba(0, 0, 0, 0.6);
}

    .main .silder dt .vip-link {
        display: inline-block;
        margin-top: 15px;
        padding: 0 16px;
        height: 30px;
        line-height: 30px;
        background: #cca558;
        color: #333;
        border-radius: 15px;
    }

    .main .silder dd a {
        position: relative;
        height: 40px;
        line-height: 40px;
        display: block;
        text-align: center;
        color: #666;
    }

    .record {
        width: -webkit-calc(100% - 246px);
        width: calc(100% - 246px);
        box-sizing: border-box;
        margin-left: 246px;
        min-width: 701px;
    }

    .record .record-list > dt:before {
        position: absolute;
        content: "";
        left: 0;
        top: 19px;
        width: 100%;
        height: 1px;
        background: #f0f0f0;
    }

    .record .record-list .data-title {
        position: relative;
        display: inline-block;
        padding-right: 18px;
        vertical-align: middle;
        color: #333;
        background-color: #fff;
        z-index: 10;
    }

    a:hover {
        cursor: pointer;
    }

    .bili-pay-plugin-box {
        position: absolute;
        top: 50%;
        left: 50%;
        -webkit-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
        z-index: 100;
    }

    body {
        font: 12px/1.5 Microsoft YaHei, tahoma, \\5B8B\4F53, sans-serif;
        color: #717171;
        font-size: 12px;
        font-family: MicrosoftYaHei;
    }

    .pay-box-type-1[data-v-a35c7fec] {
        width: 570px;
        min-height: 588px;
    }

    .bili-pay-box-wrapper[data-v-a35c7fec] {
        position: relative;
        background: #fff;
        -webkit-box-shadow: 0 3px 26px rgba(0, 0, 0, 0.9);
        box-shadow: 0 3px 26px rgba(0, 0, 0, 0.9);
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        border-radius: 4px;
        -webkit-animation: dialog-warp 0.3s;
        animation: dialog-warp 0.3s;
    }

    .bili-pay-header-wrapper[data-v-586cd7a1] {
        width: 100%;
        height: 56px;
        border-bottom: 1px solid #f0f1f4;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        padding: 10px 30px;
        position: relative;
    }

    .bili-pay-avatar[data-v-586cd7a1] {
        display: block;
        float: left;
        border-radius: 50%;
        overflow: hidden;
        background: #f0f1f4;
        margin-right: 10px;
    }

    img {
        border: 0;
    }

    .bili-pay-uname[data-v-586cd7a1] {
        float: left;
        font-size: 14px;
        color: #222222;
        line-height: 35px;
        vertical-align: text-bottom;
        max-width: 280px;
        margin-right: 10px;
    }

    .text-nowrap {
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
    }

    .bili-pay-close[data-v-586cd7a1] {
        display: block;
        width: 20px;
        height: 20px;
        background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAYAAABWzo5XAAAAAXNSR…/h2XMmakfmPArWNnGh151uLURzI/EJAhQNWjz5JuOZPwDXF66M8ZXOvwAAAABJRU5ErkJggg==) no-repeat;
        position: absolute;
        top: 20px;
        right: 30px;
        cursor: pointer;
        -webkit-transition: all 0.3s ease-in-out;
        transition: all 0.3s ease-in-out;
    }

    div {
        display: block;
    }

    .hide {
        display: none;
    }

    .bili-pay-message-wrapper {
        position: relative;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        padding: 0 14.5px 0 40px;
        height: 40px;
        background: #fff1cf;
        border-bottom: 1px solid #fddfa3;
        border-top: 1px solid #fddfa3;
        font-size: 14px;
        color: #e78b1f;
        line-height: 38px;
        cursor: pointer;
    }

    .text-nowrap {
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
    }

    .bili-pay-msg-icon {
        display: block;
        width: 17px;
        height: 17px;
        position: absolute;
        top: 10px;
        left: 14.5px;
        background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAsCAYAAAAehFoBAAAAAXNSR…TQY++peTP19Gg9Ci9ilFzw743HC53D4/Mq4FXAq8CfFfgGNkFHxRkcCmAAAAAASUVORK5CYII=) no-repeat;
        background-size: 100% 100%;
    }

    i {
        font-style: normal;
    }

    .bili-pay-message-wrapper {
        position: relative;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        padding: 0 14.5px 0 40px;
        height: 40px;
        background: #fff1cf;
        border-bottom: 1px solid #fddfa3;
        border-top: 1px solid #fddfa3;
        font-size: 14px;
        color: #e78b1f;
        line-height: 38px;
        cursor: pointer;
    }

    .bili-pay-box-default[data-v-a35c7fec] {
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        height: 480px;
        padding: 0 30px;
        margin-bottom: 12px;

        overflow: hidden;
    }

    .bili-pay-tabs-wrapper {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        justify-content: center;
    }

    .bili-pay-tabs-item {
        cursor: pointer;
        -webkit-box-flex: 1;
        -ms-flex: 1;
        flex: 1;
        text-align: center;
        padding-top: 16px;
        padding-bottom: 10px;
    }

    .bili-pay-tabs-item-span-active {
        color: #00a1d6;
        border-color: #00a1d6;
    }

    .bili-pay-tabs-item-span {
        font-family: MicrosoftYaHei;
        font-size: 14px;
        color: #99a2aa;
        padding-bottom: 8px;
        border-bottom: 2px solid #ffffff;
    }

    .bili-pay-tabs-item {
        cursor: pointer;
        -webkit-box-flex: 1;
        -ms-flex: 1;
        flex: 1;
        text-align: center;
        padding-top: 16px;
        padding-bottom: 10px;
    }

    .bili-pay-txt-default {
        padding: 14px 0 20px 0;
        font-family: MicrosoftYaHei;
        font-size: 12px;
        color: #212121;
    }

    .pay-for-money-list {
        width: 520px;

        display: flex;
        -webkit-box-align: center;

        align-items: center;
        -webkit-box-pack: justify;

        justify-content: space-between;
    }

    .pay-for-money-item-active {
        padding: 0;
        border: 3px solid #00a1d6;
    }

    .pay-for-money-item {
        position: relative;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        border: 1px solid #ccd0d7;
        padding: 1px;
        border-radius: 4px;
        -webkit-box-flex: 1;
        -ms-flex: 1;
        flex: 1;
        height: 66px;
        margin-right: 10px;
        cursor: pointer;
    }

    .pay-for-money-dis {
        position: absolute;
        top: -12px;
        right: -2px;
        background: #f25d8e;
        color: #ffffff;
        border: 2px solid #ffffff;
        border-radius: 100px;
        padding: 1px 4px;
        z-index: 100;
    }

    .pay-for-money-item {

        cursor: pointer;
    }

    .pay-for-money-price {
        margin-top: 10px;
        font-size: 16px;
        text-align: center;
    }

    .pay-for-money-org-price {
        font-size: 12px;
        color: #99a2aa;
        text-decoration: line-through;
        vertical-align: middle;
    }

    i {
        font-style: normal;
    }

    .pay-for-money-text {
        font-size: 12px;
        color: #99a2aa;
        text-align: center;
    }

    .pay-for-money-item {
        position: relative;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        border: 1px solid #ccd0d7;
        padding: 1px;
        border-radius: 4px;
        -webkit-box-flex: 1;
        -ms-flex: 1;
        flex: 1;
        height: 66px;
        margin-right: 10px;
        cursor: pointer;
    }

    .pay-for-money-dis {
        position: absolute;
        top: -12px;
        right: -2px;
        background: #f25d8e;
        color: #ffffff;
        border: 2px solid #ffffff;
        border-radius: 100px;
        padding: 1px 4px;
        z-index: 100;
    }

    .pay-for-money-check {
        margin-top: 10px;
    }

    .el-checkbox {
        color: #5a5e66;
        font-weight: 500;
        font-size: 14px;
        cursor: pointer;
        user-select: none;
    }

    .el-checkbox, .el-checkbox__input {
        display: inline-block;
        position: relative;
        white-space: nowrap;
    }

    .el-checkbox__input {
        cursor: pointer;
        outline: 0;
        line-height: 1;
        vertical-align: middle;
    }

    .el-checkbox__input {
        display: inline-block;
        position: relative;
        white-space: nowrap;
    }

    .el-checkbox {
        color: #5a5e66;
        font-weight: 500;
        font-size: 14px;
        cursor: pointer;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
    }

    .pay-for-money-check .el-checkbox__input.is-checked .el-checkbox__inner {
        background-color: #00a1d6;
        border-color: #00a1d6;
    }

    .el-checkbox__input.is-checked .el-checkbox__inner, .el-checkbox__input.is-indeterminate .el-checkbox__inner {
        background-color: #409EFF;
        border-color: #409EFF;
    }

    .el-checkbox__inner {
        display: inline-block;
        position: relative;
        border: 1px solid #d8dce5;
        border-radius: 2px;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        width: 14px;
        height: 14px;
        background-color: #fff;
        z-index: 1;
        -webkit-transition: border-color .25s cubic-bezier(.71, -.46, .29, 1.46), background-color .25s cubic-bezier(.71, -.46, .29, 1.46);
        transition: border-color .25s cubic-bezier(.71, -.46, .29, 1.46), background-color .25s cubic-bezier(.71, -.46, .29, 1.46);
    }

    .el-checkbox__input.is-checked .el-checkbox__inner::after {
        -webkit-transform: rotate(45deg) scaleY(1);
        transform: rotate(45deg) scaleY(1);
    }

    .el-checkbox__inner::after {
        -webkit-box-sizing: content-box;
        box-sizing: content-box;
        content: "";
        border: 1px solid #fff;
        border-left: 0;
        border-top: 0;
        height: 7px;
        left: 4px;
        position: absolute;
        top: 1px;
        -webkit-transform: rotate(45deg) scaleY(0);
        transform: rotate(45deg) scaleY(0);
        width: 3px;
        -webkit-transition: -webkit-transform .15s cubic-bezier(.71, -.46, .88, .6) 50ms;
        transition: -webkit-transform .15s cubic-bezier(.71, -.46, .88, .6) 50ms;
        transition: transform .15s cubic-bezier(.71, -.46, .88, .6) 50ms;
        transition: transform .15s cubic-bezier(.71, -.46, .88, .6) 50ms, -webkit-transform .15s cubic-bezier(.71, -.46, .88, .6) 50ms;
        transition: transform .15s cubic-bezier(.71, -.46, .88, .6) 50ms, -webkit-transform .15s cubic-bezier(.71, -.46, .88, .6) 50ms;
        -webkit-transform-origin: center;
        transform-origin: center;
    }

    .el-checkbox__original {
        opacity: 0;
        outline: 0;
        position: absolute;
        margin: 0;
        width: 0;
        height: 0;
        left: -999px;
    }

    input, select, textarea {
        font-family: inherit;
        font-size: inherit;
        font-weight: inherit;
        font-size: 100%;
    }

    .pay-for-money-check .el-checkbox__label {
        font-size: 12px !important;
        color: #99a2aa !important;
        font-weight: normal;
    }

    .el-checkbox__label {
        display: inline-block;
        padding-left: 10px;
        line-height: 19px;
        font-size: 14px;
    }

    .el-checkbox {
        color: #5a5e66;
        font-weight: 500;
        font-size: 14px;
        cursor: pointer;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
    }

    .el-checkbox, .el-checkbox__input {
        display: inline-block;
        position: relative;
        white-space: nowrap;
    }

    .pay-for-money-voucher-wrpapper {
        margin-top: 20px;
    }

    .pay-for-money-vouche-name-disable {
        opacity: 0.3;
    }

    .pay-for-money-vouche-name {
        position: relative;
        font-family: MicrosoftYaHei;
        font-size: 12px;
        color: #6d757a;
    }

    .el-select > .el-input {
        display: block;
    }

    .el-input--mini {
        font-size: 12px;
    }

    .el-input {
        position: relative;
        width: 100%;
    }

    .pay-for-money-vouche-name .el-input.is-disabled .el-input__inner {
        background-color: #ffffff;
        color: #6d757a;
    }

    .el-select .el-input.is-disabled .el-input__inner {
        cursor: not-allowed;
    }

    .el-input.is-disabled .el-input__inner {
        border-color: #dfe4ed;
    }

    .el-input--suffix .el-input__inner {
        padding-right: 30px;
    }

    .el-input__suffix {
        right: 5px;
        -webkit-transition: all .3s;
        transition: all .3s;
        pointer-events: none;
    }

    .el-input__prefix, .el-input__suffix {
        position: absolute;
        top: 0;
        -webkit-transition: all .3s;
        height: 100%;
        color: #b4bccc;
        text-align: center;
    }

    .el-input--mini {
        font-size: 12px;
    }

    .el-select-dropdown {
        border-color: #d8dce5;
        border-radius: 4px;
        border-top-right-radius: 0;
        border-top-left-radius: 0;
        margin-top: 0 !important;
        border-top-color: transparent;

        box-shadow: none;
    }


    .el-select-dropdown {
        position: absolute;
        z-index: 1001;
        border: 1px solid #dfe4ed;

        background-color: #fff;

        box-sizing: border-box;
        margin: 5px 0;
    }

    .el-scrollbar {
        overflow: hidden;
        position: relative;
    }

    .el-scrollbar__wrap {
        overflow: scroll;
        height: 100%;
    }

    .el-select-dropdown__wrap {
        max-height: 274px;
    }

    .el-select-dropdown__list {
        list-style: none;
        padding: 6px 0;
        margin: 0;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
    }

    .resize-triggers, .resize-triggers > div, .contract-trigger:before {
        content: " ";
        display: block;
        position: absolute;
        top: 0;
        left: 0;
        height: 100%;
        width: 100%;
        overflow: hidden;
        z-index: -1;
    }

    .resize-triggers {
        animation: 1ms resizeanim;
        visibility: hidden;
        opacity: 0;
    }

    .resize-triggers > div {
        background: #eee;
        overflow: auto;
    }

    .resize-triggers, .resize-triggers > div, .contract-trigger:before {
        content: " ";
        display: block;
        position: absolute;
        top: 0;
        left: 0;
        height: 100%;
        width: 100%;
        overflow: hidden;
        z-index: -1;
    }

    .resize-triggers {

        visibility: hidden;

    }

    .el-scrollbar__bar.is-horizontal {
        height: 6px;
        left: 2px;
    }

    .el-scrollbar__bar {
        position: absolute;
        right: 2px;
        bottom: 2px;
        z-index: 1;
        border-radius: 4px;
        opacity: 0;
        -webkit-transition: opacity 120ms ease-out;
        transition: opacity 120ms ease-out;
    }

    .el-scrollbar__thumb {
        position: relative;
        display: block;
        width: 0;
        height: 0;
        cursor: pointer;
        border-radius: inherit;
        background-color: rgba(135, 141, 153, .3);
        -webkit-transition: .3s background-color;
        transition: .3s background-color;
    }

    .el-scrollbar__bar.is-horizontal > div {
        height: 100%;
    }

    .is-vertical {
        width: 6px;
        top: 2px;
    }

    .el-scrollbar__thumb {
        position: relative;
        display: block;
        width: 0;
        height: 0;
        cursor: pointer;
        border-radius: inherit;
        background-color: rgba(135, 141, 153, .3);
        -webkit-transition: .3s background-color;
        transition: .3s background-color;
    }

    .el-scrollbar__bar.is-vertical > div {
        width: 100%;
    }

    .el-select-dropdown__empty {
        padding: 10px 0;
        margin: 0;
        text-align: center;
        color: #999;
        font-size: 14px;
    }

    .resize-triggers, .resize-triggers > div, .contract-trigger:before {
        content: " ";
        display: block;
        position: absolute;
        top: 0;
        left: 0;
        height: 100%;
        width: 100%;
        overflow: hidden;
        z-index: -1;
    }

    .resize-triggers {
        animation: 1ms resizeanim;
        visibility: hidden;
        opacity: 0;
    }

    .resize-triggers > div {
        background: #eee;
        overflow: auto;
    }

    .resize-triggers, .resize-triggers > div, .contract-trigger:before {
        content: " ";
        display: block;
        position: absolute;
        top: 0;
        left: 0;
        height: 100%;
        width: 100%;
        overflow: hidden;
        z-index: -1;
    }

    .resize-triggers > div {
        background: #eee;
        overflow: auto;
    }

    .resize-triggers, .resize-triggers > div, .contract-trigger:before {
        content: " ";
        display: block;
        position: absolute;
        top: 0;
        left: 0;
        height: 100%;
        width: 100%;
        overflow: hidden;
        z-index: -1;
    }

    .contract-trigger:before {
        width: 200%;
        height: 200%;
    }

    .contract-trigger:before {
        content: " ";
        display: block;
        position: absolute;
        top: 0;
        left: 0;
        overflow: hidden;
        z-index: -1;
    }

    .pay-for-money-payment-wrapper {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        margin-top: 24px;
        box-sizing: border-box;
        width: 510px;
        height: 154px;
        background: #ffffff;
        border: 1px solid #e5e9ef;
        border-radius: 2px;
        overflow: hidden;
    }

    .pay-for-money-payment-left {
        width: 100px;
        height: 100%;
        background: #f4f5f7;
    }

    .pay-for-money-payment-left-item-active {
        background: #ffffff;
    }

    .pay-for-money-payment-left-item {
        cursor: pointer;
        float: left;
        width: 100px;
        height: 40px;
        font-family: MicrosoftYaHei;
        font-size: 12px;
        color: #6d757a;
        text-align: center;
        line-height: 40px;
    }

    .pay-for-money-payment-right {
        -webkit-box-flex: 1;
        -ms-flex: 1;
        flex: 1;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
    }

    .pay-for-qr-wrapper {
        -webkit-box-flex: 1;
        -ms-flex: 1;
        flex: 1;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        padding: 22px 20px 22px 55px;
    }

    .pay-for-qr-code-fail {
        padding: 0;
    }

    .pay-for-qr-code {
        float: left;
        position: relative;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        width: 110px;
        height: 110px;
        border: 1px solid #e5e9ef;
        border-radius: 1px;
        padding: 5px;
        margin-right: 20px;
    }

    .pay-for-qr-code img {
        background: url(https://s1.hdslb.com/bfs/static/account-vip/static/img/code_fail.f41d4f5.png) no-repeat;
        background-size: 100% 100%;
        cursor: pointer;
    }

    img {
        border: 0;
    }

    .pay-for-qr-num-fail {
        float: left;
        min-width: 115px;
        margin-top: 20px;
        font-size: 14px;
        color: #6d757a;
    }

    .pay-for-payment-txt {
        float: left;
        font-size: 12px;
        color: #6d757a;
        margin-top: 8px;
    }

    .pay-for-money-bottom-text {
        margin-top: 8px;
        font-family: MicrosoftYaHei;
        font-size: 11px;
        color: #ccd0d7;
    }

    .bili-pay-txt-default {
        padding: 14px 0 20px 0;
        font-family: MicrosoftYaHei;
        font-size: 12px;
        color: #212121;
    }

    .pay-for-money-list {
        width: 520px;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
        -webkit-box-pack: justify;
        -ms-flex-pack: justify;
        justify-content: space-between;
    }

    .pay-for-money-bottom-text {
        margin-top: 8px;
        font-family: MicrosoftYaHei;
        font-size: 11px;
        color: #ccd0d7;
    }

    .pay-bottom-link[data-v-a35c7fec] {
        font-size: 12px;
        color: #99a2aa;
    }

    a {
        text-decoration: none;
    }

    .bili-pay-result-wrapper[data-v-42f1dd91] {
        padding-top: 30px;
    }

    .pay-result-fail[data-v-42f1dd91] {
        width: 220px;
        height: 180px;
        margin: 0 auto;
        background: url(https://s1.hdslb.com/bfs/static/account-vip/static/img/img_fail.c8667c6.png) no-repeat;
        background-size: 100% 100%;
    }

    .pay-result-title[data-v-42f1dd91] {
        margin-top: 20px;
        font-family: MicrosoftYaHei;
        font-size: 20px;
        color: #222222;
        text-align: center;
        margin-bottom: 10px;
    }

    .pay-result-btn-wrapper[data-v-42f1dd91] {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
        margin-top: 44px;
    }

    .pay-result-btn-left-alone[data-v-42f1dd91] {
        margin-right: 0 !important;
    }

    .pay-result-btn-left[data-v-42f1dd91] {
        margin-right: 10px;
        width: 124px;
        height: 40px;
        background: #00a1d6;
        border-radius: 4px;
        font-size: 14px;
        color: #ffffff;
        text-align: center;
        line-height: 40px;
        cursor: pointer;
    }


</style>