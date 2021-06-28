<#-- 公共顶部 -->
<#macro header title="wlBlog" keywords="" description="" canonical="" hasEditor=false>
<#include "/common/annotation.ftl">
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="referrer" content="no-referrer">   <#--网络路径图片无法加载-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>${title}</title>
    <meta name="author" content="${config.authorName}(${config.authorEmail})">
    <meta name="keywords" content="${keywords}"/>
    <meta name="description" content="${description}" id="meta_description">
    <link rel="canonical" href="${config.siteUrl}${canonical}" />
    <#include "/layout/quote.ftl">
    <#--黑白界面-->
<#--    <style>
        html {
            filter: grayscale(100%);
            -webkit-filter: grayscale(100%);
            -moz-filter: grayscale(100%);
            -ms-filter: grayscale(100%);
            -o-filter: grayscale(100%);
            filter: url("data:image/svg+xml;utf8,<svg xmlns="\'http://www.w3.org/2000/svg\'"><filter id="\'grayscale\'"><feColorMatrix type="\'matrix\'" values="\'0.3333" 0.3333="" 0="" 1="" 0\'=""></fecolormatrix></filter></svg>#grayscale");filter:progid:DXImageTransform.Microsoft.BasicImage(grayscale=1);-webkit-filter:grayscale(1);}
    </style>-->
    <#if hasEditor>
        <link href="https://cdn.jsdelivr.net/npm/simplemde@1.11.2/dist/simplemde.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/github-markdown-css@2.10.0/github-markdown.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/highlight.js@9.12.0/styles/github.min.css" rel="stylesheet">
    </#if>
    <#nested>
</head>
<body <#--style="background-size:100%,100%;background:url(${config.staticWebSite}/img/bg.jpg)"-->>
    <#include "/layout/header.ftl"/>
</#macro>

<#--&lt;#&ndash;星空连线背景&ndash;&gt;
<canvas style="height: 0px" id="canvas"></canvas>-->
<#--<script>
    //==========================================
    // File:    star.js
    // Title:   几何星空连线背景
    // Author   李少杰
    //==========================================

    // 可调参数
    var BACKGROUND_COLOR = "rgba(7,92,113)";   // 背景颜色
    var POINT_NUM = 100;                        // 星星数目
    var POINT_COLOR = "rgba(255,255,255,0.7)";  // 点的颜色
    var LINE_LENGTH = 10000;                    // 点之间连线长度(的平方)

    // 创建背景画布
    var cvs = document.createElement("canvas");
    cvs.width = window.innerWidth;
    cvs.height = window.innerHeight;
    cvs.style.cssText = "\
    position:fixed;\
    top:0px;\
    left:0px;\
    z-index:-1;\
    opacity:1.0;\
    ";
    document.body.appendChild(cvs);

    var ctx = cvs.getContext("2d");

    var startTime = new Date().getTime();

    //随机数函数
    function randomInt(min, max) {
        return Math.floor((max - min + 1) * Math.random() + min);
    }

    function randomFloat(min, max) {
        return (max - min) * Math.random() + min;
    }

    //构造点类
    function Point() {
        this.x = randomFloat(0, cvs.width);
        this.y = randomFloat(0, cvs.height);

        var speed = randomFloat(0.3, 1.4);
        var angle = randomFloat(0, 2 * Math.PI);

        this.dx = Math.sin(angle) * speed;
        this.dy = Math.cos(angle) * speed;

        this.r = 1.2;

        this.color = POINT_COLOR;
    }

    Point.prototype.move = function () {
        this.x += this.dx;
        if (this.x < 0) {
            this.x = 0;
            this.dx = -this.dx;
        } else if (this.x > cvs.width) {
            this.x = cvs.width;
            this.dx = -this.dx;
        }
        this.y += this.dy;
        if (this.y < 0) {
            this.y = 0;
            this.dy = -this.dy;
        } else if (this.y > cvs.height) {
            this.y = cvs.height;
            this.dy = -this.dy;
        }
    }

    Point.prototype.draw = function () {
        ctx.fillStyle = this.color;
        ctx.beginPath();
        ctx.arc(this.x, this.y, this.r, 0, Math.PI * 2);
        ctx.closePath();
        ctx.fill();
    }

    var points = [];

    function initPoints(num) {
        for (var i = 0; i < num; ++i) {
            points.push(new Point());
        }
    }

    var p0 = new Point(); //鼠标
    p0.dx = p0.dy = 0;
    var degree = 2.5;
    document.onmousemove = function (ev) {
        p0.x = ev.clientX;
        p0.y = ev.clientY;
    }
    document.onmousedown = function (ev) {
        degree = 5.0;
        p0.x = ev.clientX;
        p0.y = ev.clientY;
    }
    document.onmouseup = function (ev) {
        degree = 2.5;
        p0.x = ev.clientX;
        p0.y = ev.clientY;
    }
    window.onmouseout = function () {
        p0.x = null;
        p0.y = null;
    }

    function drawLine(p1, p2, deg) {
        var dx = p1.x - p2.x;
        var dy = p1.y - p2.y;
        var dis2 = dx * dx + dy * dy;
        if (dis2 < 2 * LINE_LENGTH) {
            if (dis2 > LINE_LENGTH) {
                if (p1 === p0) {
                    p2.x += dx * 0.03;
                    p2.y += dy * 0.03;
                } else return;
            }
            var t = (1.05 - dis2 / LINE_LENGTH) * 0.2 * deg;
            ctx.strokeStyle = "rgba(255,255,255," + t + ")";
            ctx.beginPath();
            ctx.lineWidth = 1.5;
            ctx.moveTo(p1.x, p1.y);
            ctx.lineTo(p2.x, p2.y);
            ctx.closePath();
            ctx.stroke();
        }
        return;
    }

    //绘制每一帧
    function drawFrame() {
        cvs.width = window.innerWidth;
        cvs.height = window.innerHeight;
        ctx.fillStyle = BACKGROUND_COLOR;
        ctx.fillRect(0, 0, cvs.width, cvs.height);

        var arr = (p0.x == null ? points : [p0].concat(points));
        for (var i = 0; i < arr.length; ++i) {
            for (var j = i + 1; j < arr.length; ++j) {
                drawLine(arr[i], arr[j], 1.0);
            }
            arr[i].draw();
            arr[i].move();
        }

        window.requestAnimationFrame(drawFrame);
    }

    initPoints(POINT_NUM);
    drawFrame();
</script>-->

<#-- 公共底部 -->
<#macro footer>
    <#include "/layout/footer.ftl"/>

    <#nested>

    </body>
</html>
</#macro>

<#-- 分页组件 -->
<#macro pageBar>
    <#if page?? && (page.pages > 1)>
    <nav class="pagination"
         data-url="${config.siteUrl}/${url!}"
         data-search="${(model.keywords == null || model.keywords == '')?string('false', 'true')}"
         data-total-page="${page.pages?c}"
         data-current-page="${page.pageNum?c}"
         data-pre="${page.prePage}"
         data-next="${page.nextPage}"></nav>
    </#if>
</#macro>


<#-- blog-header -->
<#macro blogHeader title="Header" weiboName="@我的微博">
    <div class="col-sm-12 blog-main">
        <div class="blog-header">
            <h4>${title}</h4>
            <p class="blog-description" id="hitokoto"></p>
            <div>
                <a href="javascript:void(0);" target="_blank" title="点击QQ联系我" onclick="window.open('tencent://message/?uin=${config.qq}&amp;Site=www.${config.domain}&amp;Menu=yes')" rel="external nofollow"><i class="fa fa fa-qq fa-fw"></i>QQ联系</a>
                |
                <a href="mailto:${config.authorEmail}" target="_blank" title="点击给我发邮件" rel="external nofollow"><i class="fa fa fa-envelope fa-fw"></i>邮箱联系</a>
                |
                <a href="${config.weibo}" target="_blank" title="点击查看我的微博" rel="external nofollow"><i class="fa fa fa-weibo fa-fw"></i>${weiboName}</a>
            </div>
        </div>
    </div>
</#macro>

<#-- 页面顶部、菜单下方提示栏 -->
<#macro prompt>
    <!--[if lt IE 9]><div class="alert alert-danger topframe" role="alert">Oh My God！你的浏览器实在<strong>太太太太太太旧了</strong>，赶紧升级浏览器 <a target="_blank" class="alert-link" href="http://browsehappy.com">立即升级</a></div><![endif]-->
    <#if config.maintenance! && config.maintenance == 1>
    <div class="alert alert-warning fade-in" role="alert">
        <a href="#" class="close" data-dismiss="alert">&times;</a>
        系统预计将在<strong>${config.maintenanceDate}</strong>左右进行更新维护，届时网站将无法使用，更新大约持续${config.maintenanceTime!(30)}分钟，敬请悉知。
    </div>
    </#if>
</#macro>

<#-- 赞赏 -->
<#macro praise>
    <#if config.wxPraiseCode! || config.zfbPraiseCode!>
        <h5 class="custom-title"><i class="fa fa-dollar fa-fw"></i><strong>鼓励一下</strong><small></small></h5>
        <div class="col-sm-12 col-md-12" style="float: initial;">
            <#if config.zfbPraiseCode!>
                <a href="${config.zfbPraiseCode}" class="showImage" title="支付宝收钱码" rel="external nofollow">
                    <img src="${config.zfbPraiseCode}" onerror="this.src='${config.staticWebSite}/img/default.png'" alt="支付宝收钱码" class="img-rounded" style="width: 250px;height: auto;">
                </a>
            </#if>
            <#if config.wxPraiseCode!>
                <a href="${config.wxPraiseCode}" class="showImage" title="微信收钱码" rel="external nofollow">
                    <img src="${config.wxPraiseCode}" onerror="this.src='${config.staticWebSite}/img/default.png'" alt="微信收钱码" class="img-rounded" style="width: 250px;height: auto;">
                </a>
            </#if>
        </div>
    </#if>
</#macro>
