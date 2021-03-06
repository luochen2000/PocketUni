# PockUni口袋校园

**本项目是一个基于 SpringBoot 的资讯平台。数据库使用了 redis 和 mysql，实现注册登录、点赞点踩、评论站内信、等功能，同时通过一个异步消息框架来实现事件的异步处理。**

## 目录

- [项目的基本框架及配置](#项目的基本框架及配置)
- [AOP 和 IOC](#AOP-和-IOC)
- [MySQL 和 MyBatis](#MySQL-和-MyBatis)
- [注册与登录的实现](#注册与登录的实现)
- [发表问题和敏感词过滤](#发表问题和敏感词过滤)
- [发表评论和站内信](#发表评论和站内信)
- [Redis 实现点赞和点踩功能](#Redis-实现点赞和点踩功能)
- [异步消息机制](#异步消息机制)
- [关注和粉丝列表的实现](#关注和粉丝列表的实现)
- [功能扩展](#功能扩展)

## 项目的基本框架及配置 ##

创建 git 仓库，本地配置 IDEA 并测试 pull 和 push。
    
创建 SpringBoot 工程，导入 web，velocity 和 aop 的包。
    
生成 maven 项目，pom.xml 包含上述依赖。
    
Controller 中使用注解配置，requestmapping，responsebody 基本可以解决请求转发以及响应内容的渲染。responsebody 自动选择 viewresolver 进行解析。

使用 pathvariable 和 requestparam 传递参数，使用 velocity 编写页面模板，注意其中的语法使用。常用 $!{} 和 ${}。
    
使用 HTTP 规范下的 httpservletrequest 和 httpservletresponse 来封装请求和相响应，使用封装好的 session 和 cookie 对象。
    
使用重定向的 redirectview 和统一异常处理器 exceptionhandler。

## AOP 和 IOC ##

IOC 解决对象实例化以及依赖传递问题，解耦。
    
AOP 解决纵向切面问题，主要实现日志和权限控制功能。
    
Aspect 实现切面，并且使用 logger 来记录日志，用该切面的切面方法来监听 Controller。


## MySQL 和 MyBatis ##

使用 MySQL 创建数据库和表。
    
加入 MyBatis和 MySQL 的 maven 仓库，注意，由于现在版本的 SpringBoot 不再支持 velocity 进而导致我使用较早版本的 SpringBoot，所以这里提供一可以正常运行的版本设置。

SpringBoot 使用1.4.0，mybatis-spring-boot-starter 使用1.2.1，mysql-connector-java 使用8.0.12。
    
注意 MyBatis 的注解语法以及 xml 的配置要求，xml 要求放在 resource 中并且与 DAO 接口在相同的包路径下。
    
application.properties 增加 Spring 配置数据库链接地址。
    
两个小工具：

- ViewObject:方便传递任何数据到
- VelocityDateTool:velocity 自带工具类
    
写好静态文件 html、css 和 js，并且注意配置。

- spring.velocity.suffix=.html 保证跳转请求转发到 html 上
- spring.velocity.toolbox-config-location=toolbox.xml

## 注册与登录的实现 ##

新建数据表 login_ticket 用来存储 ticket 字段。该字段在用户登录成功时被生成并存入数据库，并被设置为 Cookie，下次用户登录时会带上这个 ticket，ticket 是随机的 UUID 字符串，有过期时间以及有效状态。

使用拦截器 interceptor 来拦截所有用户请求，判断请求中是否存在有效的 ticket，如果有就将用户信息写入 Threadlocal。所有线程的 threadlocal 都被存在一个叫做 hostholder 的实例中，根据该实例就可以在全局任意位置获取用户的信息。

该 ticket 的功能类似 Session，也是通过 Cookie 写回浏览器，浏览器请求时再通过 Cookie 传递，区别是该字段是存在数据库中的，并且可以用于移动端。

通过用户访问权限拦截器来拦截用户的越界访问，比如用户没有管理员权限就不能访问管理员页面。

数据安全性的保障手段：HTTPS 使用公钥加密私钥解密，比如支付宝的密码加密，单点登录验证，验证码机制等。

## 发表问题和敏感词过滤 ##

发布问题时检查标题和内容，防止 xss 注入，并且过滤敏感词。

防止 xss 注入直接使用 HTMLutils 的方法即可实现。

过滤敏感词首先需要建立一个字典树，并且读取一份保存敏感词的文本文件，然后初始化字典树。最后将过滤器作为一个服务，让需要过滤敏感词的服务进行调用即可。

## 发表评论和站内信 ##

首先建立表 comment 和 message 分别代表评论和站内信。

评论的逻辑是每一个问题下面都有评论，显示评论数量，具体内容，评论人等信息。

消息的逻辑是，两个用户之间发送一条消息，有一个唯一的会话 id，这个会话里可以有多条这两个用户的交互信息。通过一个用户 id 获取该用户的会话列表，再根据会话 id 再获取具体的会话内的多条消息。

逻辑清楚之后，再加上一些附加功能，比如显示未读消息数量，根据时间顺序排列会话和消息。

本节内容基本就是业务逻辑的开发，没有新增什么技术点，主要是前后端交互的逻辑比较复杂，前端的开发量也比较大。

## Redis 实现点赞和点踩功能 ##

首先了解一下 Redis 的基础知识，数据结构，Jedis 使用等。

编写list，string，hashmap，set，sortset的测试用例，熟悉 Jedis API。

开发点踩和点赞功能，在此之前根据业务封装好 Jedis 的增删改查操作，放在 util 包中。

根据需求确定 key 字段，格式是——like：实体类型：实体id 和 dislike：实体类型：实体 id。这样可以将喜欢一条新闻的人存在一个集合，不喜欢的存在另一个集合。通过统计数量可以获得点赞和点踩数。

一般点赞点踩操作是先修改 Redis 的值并获取返回值，然后再异步修改 MySQL 数据库的 likecount 数值。这样既可以保证点赞操作快速完成，也可保证数据一致性。

## 异步消息机制 ##

在之前的功能中有一些不需要实时执行的操作或者任务，我们可以把它们改造成异步消息来进行发送。

具体操作就是使用 Redis 来实现异步消息队列。代码中使用事件 Event 来包装一个事件，事件需要记录事件实体的各种信息：一个异步工具类（事件生产者 + 事件消费者 + EventHandler 接口），让以后各种事件的实现类来实现这个接口。

事件生产者一般作为一个服务，由 Controller 中的业务逻辑调用并产生一个事件，将事件序列化存入 Redis 队列中，事件消费者则通过一个线程循环获取队列里的事件，并且寻找对应的 handler 进行处理。

整个异步事件的框架开发完成，后面新加入的登录，点赞等事件都可以这么实现。
