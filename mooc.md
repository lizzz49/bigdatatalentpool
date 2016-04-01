# 引言
随着互联网的发展，人们在享受互联网带来的便捷的服务的时候，也面临着个人的隐私泄漏的问题。小到一个拥有用户系统的小型论坛，大到各个大型的银行机构，互联网安全问题都显得格外重要。而这些网站的背后，则是支撑整个服务的核心数据库。可以说数据库就是这些服务的命脉，没有数据库，也就无从谈起这些服务了。
对于数据库系统的安全特性，主要包括数据独立性、数据安全性、数据完整性、并发控制、故障恢复等方面。而这些里面显得比较重要的一个方面是数据的安全性。由于开发人员的设计不周到，以及数据库的某些缺陷，很容易让黑客发现系统的漏洞，从而造成巨大的损失。
接下来本文将会介绍非常常见的一种攻击数据库的方法：SQL注入，以及使用在项目使用Java开发的情况下如何使用SpringMVC的拦截器实现防止SQL注入的功能。

# SQL注入
## SQL注入简介
通俗的讲，SQL注入就是恶意黑客或者竞争对手利用现有的B/S或者C/S架构的系统，将恶意的SQL语句通过表单等传递给后台SQL数据库引擎执行。比如，一个黑客可以利用网站的漏洞，使用SQL注入的方式取得一个公司网站后台的所有数据。试想一下，如果开发人员不对用户传递过来的输入进行过滤处理，那么遇到恶意用户的时候，并且系统被发现有漏洞的时候，后果将是令人难以想象的。最糟糕的是攻击者拿到了数据库服务器最高级的权限，可以对整个数据库服务器的数据做任何操作。
通常情况下，SQL注入攻击一般分为以下几个步骤：
* 判断WEB环境是否可以注入SQL。对于一个传统的WEB网页来说，如果是一个简单的静态页面，比如地址为http://www.news.com/100.html的网页，这是一个简单的静态页面，一般不涉及对数据库的查询。而如果这个网页的网址变成了：http://www.news.com/news.asp?id=100 那么，这就是一个根据主键id来查询数据的动态网页了。攻击者往往能够在 id＝100的后面加上一些自己的SQL，用来“欺骗”过应用程序。
* 寻找SQL注入点。当攻击者确定某个页面可以使用SQL注入之后，他一般会寻找可以SQL注入的点。而这些点往往就是网页或者应用程序中的用于向服务器发送用户数据的表单了。一般的流程是，客户端通过这些表单发送一些用户信息的字段，比如用户名和密码，接着服务器就会根据这些字段去查询数据库。而如果用户输入了一些非法的字符，比如’这个符号，那么在SQL解析的时候，解析的结果可能并不是应用开发人员想象中那样。
* 寻找系统的后台。这一点就建立在破坏者对整个系统的了解程度上面了，如果攻击者对整个系统了如指掌，那么实现攻击也就是一件很简单的事情了。
* 入侵和破坏。当攻击者攻破系统之后，整个系统从某种意义上来讲已经失去意义了。

## SQL注入案例
## 一个简单的PHP登录验证SQL注入
比如一个公司有一个用来管理客户的客户管理系统，在进入后台进行管理的时候需要输入用户名和密码。
假设在客户端传给服务器的字段分别为用户名username和密码password，那么如果用来处理登录的服务器端代码对用户的输入做以下处理：
![PHPsql注入][1]
上面的PHP代码就是首先获取客户端POST过来的填写在表单里面的用户名和密码，接着要MySQL去执行下面这条SQL语句：
```
SELECT `id` FROM `users` WHERE `username` = username AND `password` = password;
```
可以看到上面的代码没有对用户的输入做任何的过滤，这是非常容易遭到黑客攻击的。
比如，一个用户在输入用户名的输入框里面输入了
```
user’;SHOW TABLES;--
```
那么就会解析为下面的SQL：
```
SELECT `id` FROM `users` WHERE `username` = ‘user’;SHOW TABLES;-- AND `password` = password;
```
可以看到被解析的SQL被拆分为了2条有用的SQL:
```
(1)SELECT `id` FROM `users` WHERE `username` = ‘user’;
(2)SHOW TABLES;
```
而后面验证密码的部分就被注释掉了。这样攻击者就轻松的获得了这个数据库里面的所有表的名字。同样的道理，如果攻击者在输入框里面输入：
```
’;DROP TABLE [table_name];--
```
那么，这一张表就被删除了，可见后果是非常严重的。
而用户如果在用户名输入框里面输入了：user’or 1=1--
那么会被解析成：
```
SELECT `id` FROM `users` WHERE `username` = ‘user’
or 1=1-- AND `password` = password;
```
这里可以看到1=1永远为真，这样不用输入用户名就直接可以登入系统了。

## 一个ASP新闻动态页面的id查询
比如有一个新闻网站的动态页面是这种格式：
```
http://www.news.com/news.asp?id=100
```
那么当用户在浏览器的地址框里面输入
```
http://www.news.com/news.asp?id=100;and user>0
```
那么如果这个网站的数据库用的是SQL Server的话，那么SQL Server在解析的时候，由于user是SQL Server的一个内置变量，它的值就是当前连接数据库的用户，那么SQL在执行到这里的时候会拿一个类型为nvarchar的和一个int类型的比较。比较过程中就必然涉及类型的转化，然而不幸的是，转化过程并不是一帆风顺，出错的时候SQL Server将会给出类似将nvarchar值”aaa”转为为int的列时发生语法错误。这个时候攻击者就轻松的获得了数据库的用户名。

# SpringMVC拦截器防止SQL注入
为了有效的减少以及防止SQL注入的攻击，开发人员在开发的时候一定不要期待用户的输入都是合理的，当用户输入完毕之后，应该严谨的对用户提交的数据进行格式上的检查以及过滤，尽可能的减少被注入SQL 的风险。
一般来说，不同的服务器端语言都有不同的解决方案。比如拿中小型企业采用得最多的PHP语言来说，PHP的官方就为开发者提供了这样的一些函数，比如mysql_real_escape_string()等。
接下来会详细介绍如何通过SpringMVC的拦截器实现防止SQL注入的功能。
这里以我的大数据人才简历库的拦截器为例。
## 自定义拦截器类实现HandlerInterceptor接口
```
package com.data.job.util.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Enumeration;

/**
 * 防止SQL注入的拦截器
 *
 * @author tyee.noprom@qq.com
 * @time 2/13/16 8:22 PM.
 */
public class SqlInjectInterceptor implements HandlerInterceptor {

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        Enumeration<String> names = request.getParameterNames();
        while (names.hasMoreElements()) {
            String name = names.nextElement();
            String[] values = request.getParameterValues(name);
            for (String value : values) {
                value = clearXss(value);
            }
        }
        return true;
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object o, Exception e) throws Exception {

    }

    /**
     * 处理字符转义
     *
     * @param value
     * @return
     */
    private String clearXss(String value) {
        if (value == null || "".equals(value)) {
            return value;
        }
        value = value.replaceAll("<", "&lt;").replaceAll(">", "&gt;");
        value = value.replaceAll("\\(", "&#40;").replace("\\)", "&#41;");
        value = value.replaceAll("'", "&#39;");
        value = value.replaceAll("eval\\((.*)\\)", "");
        value = value.replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']",
                "\"\"");
        value = value.replace("script", "");
        return value;
    }
}
```
## 配置拦截器
```
<!-- 拦截器配置-->
    <mvc:interceptors>
<!-- SQL注入拦截-->
        <mvc:interceptor>
            <mvc:mapping path="/**"/>
            <bean class="com.data.job.util.interceptor.SqlInjectInterceptor"></bean>
        </mvc:interceptor>
    </mvc:interceptors>
```

# SQL注入总结
安全问题从古至今都有着非常高的关注度，如今互联网高速发达，各种网络应用层出不穷。不管是现在炙手可热的云计算和大数据，还是传统的B/S或者C/S架构的网络应用，数据的安全性是至关重要的。从应用层面来讲，网络应用的开发者可以通过完善软件的架构，尽量减少因为BUG而导致的数据泄漏的问题。开发者可以不断的审视与完善自己的系统，站在攻击者的角度上去开发某些关键的安全性要求比较高的环节，如银行支付部分等，这样能够在一定程度上面减少SQL注入等应用层面攻击数据库的风险。
# 项目地址
[完整代码](https://github.com/noprom/bigdatatalentpool)托管在github。
  [1]: http://img.mukewang.com/56fdb9a00001a8de08640168.png
  [2]: http://img.mukewang.com/56de3e9e0001637614341394.png
  [3]: http://img.mukewang.com/56de3eae0001481014321394.png
  [4]: http://img.mukewang.com/56de3eb70001e57a14300750.png
  [5]: http://img.mukewang.com/56de3ec1000104a514280750.png
  [6]: http://img.mukewang.com/56de3ec90001140c14320750.png
  [7]: http://img.mukewang.com/56de3ed10001584514320780.png
  [8]: http://img.mukewang.com/56de3ee1000163c315540920.png
  [9]: http://img.mukewang.com/56de3ee90001b0f508481170.png
  [10]: http://img.mukewang.com/56de3ef40001844919321238.png
  [11]: http://img.mukewang.com/56de3efe0001f75419321238.png
  [12]: http://img.mukewang.com/56de3f170001987825601546.png
