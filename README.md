# wlblog
### 环境
安装 JDK（1.8+）<br>
安装 Maven (3.3.0+)<br>
安装 Redis服务 (3.0+)<br>
安装 MySQL (5.6+)<br>
### 数据库配置
CREATE DATABASE dblog;
sql文件在项目根目录 Dblog/docs/db下
 导入数据库`docs/db/dblog.sql` <br>
 初始化数据库`docs/db/init_data.sql`<br>
 更新数据库`docs/db/update.sql`<br>
数据库链接属性(在[blog-core]/resources/config/application-center-{env}.yml配置文件中搜索datasource或定位到L.5)<br>
redis配置(在[blog-core]/resources/config/application-center-{env}.yml配置文件中搜索redis或定位到L.14)<br>
以上两个必备的配置项修改完成后就能启动项目了。











wlblog博客二次开发于oneblog,oneblog链接：https://gitee.com/yadong.zhang/DBlog?_from=gitee_search

