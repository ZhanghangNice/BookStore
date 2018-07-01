# BookStore

* JAVA
* jsp servlet
* Bootstap
* jQuery
* mysql

### 运行效果图

![](image/bookstore001.png)
![](image/bookstore002.png)
![](image/bookstore003.png)
![](image/bookstore004.png)

### run 。。。

    1. 用 eclips 导入项目

    2. 设计 java 采用 JDK 1.8 编译

    3. 代码编码格式为 UTF-8

    4. 将 bookstores.sql 导入 bookstores 数据库

        CREATE SCHEMA `bookstores` DEFAULT CHARACTER SET utf8 ;

        mysql --host=127.0.0.1 --user=root --port=3306 --default-character-set=utf8 --comments --database=bookstores  < "./bookstores.sql"

    5. 修改连接数据库配置

        src/com/zh/util/Dbcp.java