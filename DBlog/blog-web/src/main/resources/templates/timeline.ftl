<#include "include/macros.ftl">
<@compress single_line=false>
    <@header title="时光轴 | ${config.siteName}" keywords="" description="时光轴" canonical="/timeline"></@header>
<div class="about-main2" style="background-image: url(${config.staticWebSite}/img/lc_bg.jpg);">
    <div class="licheng-bg">
        <img src="${config.staticWebSite}/img/lc-quxian.png" class="quxian" />
        <div class="warper pr">
     <#--       <div class="ny-title">
                <h3 class="title-en">DEVELOPMENT</h3>
                <h4 class="title-ch">发展历程</h4>
                <i></i>
            </div>-->
            <div class="licheng-content swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <ul class="clearfix">
                            <li class="item1">
                                <a class="clearfix">
                                    <div class="lc-left">
                                        <i class="line"></i> <span class="date">2021</span>
                                    </div>
                                    <div class="lc-right">
                                        <div class="right-text">
                                            <h3>网站搭建</h3>
                                            <p>2021年04月28日，网站托管于阿里云。</p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="item2">
                                <a class="clearfix">
                                    <div class="lc-left">
                                        <span class="date">2021</span>
                                        <i class="line"></i> </div>
                                    <div class="lc-right">
                                        <div class="right-text">
                                            <h3>第一次版本更新</h3>
                                            <p>2021年5月上旬更新网站头部导航，新增动态便签云</p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="item3">
                                <a class="clearfix">
                                    <div class="lc-left">
                                        <i class="line"></i> <span class="date">2021</span>
                                    </div>
                                    <div class="lc-right">
                                        <div class="right-text">
                                            <h3>第二次版本更新</h3>
                                            <p>2021年5月下旬新增网站时光轴</p>
                                        </div>
                                    </div>
                                </a>
                            </li>
<#--                            <li class="item4">
                                <a class="clearfix">
                                    <div class="lc-left">
                                        <span class="date">2014</span>
                                        <i class="line"></i> </div>
                                    <div class="lc-right">
                                        <div class="right-text">
                                            <h3>公司增资，迁址，获得资管资格</h3>
                                            <p>根据文件某某某，公司迁址上海市；注册资本增加至6亿元人民币；取得某某某管理业务资格</p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="item5">
                                <a class="clearfix">
                                    <div class="lc-left">
                                        <i class="line"></i> <span class="date">2015</span>
                                    </div>
                                    <div class="lc-right">
                                        <div class="right-text">
                                            <h3>子公司成立</h3>
                                            <p>2015年1月15日，成立风险管理子公司某某某有限公司；2105年10月30日，成立上海某某某有限公司。</p>
                                        </div>
                                    </div>
                                </a>
                            </li>-->
                        </ul>
                    </div>
<#--                    <div class="swiper-slide">
                        <ul class="clearfix">
                            <li class="item1">
                                <a class="clearfix">
                                    <div class="lc-left">
                                        <i class="line"></i> <span class="date">2017</span>
                                    </div>
                                    <div class="lc-right">
                                        <div class="right-text">
                                            <h3>成为中国某某某交易中心会员</h3>
                                            <p>2017年5月，公司成为上海某某某中心首批会员</p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="item2">
                                <a class="clearfix">
                                    <div class="lc-left">
                                        <span class="date" style="text-align: center">2019.05.16</span>
                                        <i class="line"></i> </div>
                                    <div class="lc-right">
                                        <div class="right-text">
                                            <h3>公司更名</h3>
                                            <p>根据许可《关于核准某某某有限公司变更注册资本和股权的批复》，公司注册资本增加至2亿元，由上海某某某有限公司控股，公司名称变更为某某某有限公司。</p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>-->
                </div>
                <!--按钮-->
                <div class="lc-swiper-btn">
                    <a class="btn-prev fl"><i class="iconfont">&#xe624;</i></a>
                    <a class="btn-next fr"><i class="iconfont">&#xe626;</i></a>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="${config.staticWebSite}/js/swiper.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    var mySwiper = new Swiper('.swiper-container.licheng-content', {
        autoplay: false, //自动滑动
    })
    $('.btn-prev').click(function() {
        mySwiper.swipePrev();
    })
    $('.btn-next').click(function() {
        mySwiper.swipeNext();
    })
</script>


<@footer>

</@footer>
</@compress>
