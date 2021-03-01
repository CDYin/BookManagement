<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>首页</title>
    <script type="text/javascript" src="src/main/webapp/static/js/jquery-3.2.1.js"></script>
</head>

<body>
<div class="index-default" id="login">
    <div class="index-body">
        <div class="index-group">
            <label for="account">用户名</label>
            <input type="text" class="form-control" id="account" placeholder="请输入用户名"><p>
        </div>
        <div class="index-group">
            <label for="password">密  码</label>
            <input type="password" class="from-control" id="password" placeholder="请输入密码"><br>
        </div>
    <button id="login-button">登录</button>
    <button id="regist-button">注册</button>
    </div>
<script>
    
    $("#login-button").click(function () {
        var account = $("#account").val();
        var password = $("#password").val();
        if (account==''&&password==''){
            $("#info").text("提示:账号和密码不能为空");
        }else if (account==''){
            $("#info").text("提示:账号不能为空");
        }else if (password==''){
            $("#info").text("提示:密码不能为空");
        }else if (isNaN(account)){
            $("#info").text("提示:账号必须为数字");
        }else {
            $.ajax({
                type:"POST",
                url:"",
                data:{
                    account:account,
                    password:password
                },
                dataType:"json",
                success:function (data) {
                    if(data.stateCode.trim() == "0") {
                        $("#info").text("提示:该用户不存在");
                    } else if(data.stateCode.trim() == "1") {
                        $("#info").text("提示:密码错误");
                    } else if(data.stateCode.trim() == "2"){
                        $("#info").text("提示:登陆成功，跳转中...");
                        window.location.href="/User_main.jsp";
                    }
                }
            })
        }
    })
</script>
</div>
</body>
</html>