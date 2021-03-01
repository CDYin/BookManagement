<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <h1 style="text-align: center">首页</h1>
    <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
</head>
<body>
<div class="index-default" id="login">
    <div class="index-body">
        <div class="index-group" id="gaccount">
            <label for="account">用户名</label>
            <input type="text" class="form-control" id="account" placeholder="请输入用户名"><p>
        </div>
        <div class="index-group" id="gpassword">
            <label for="password">密&nbsp&nbsp&nbsp码</label>
            <input type="password" class="from-control" id="password" placeholder="请输入密码"><br>
        </div>
        <p style="text-align: right;color: red;position: absolute" id="info"></p><br/>
    <button id="login-button">登录</button>
    <button id="regist-button">注册</button>
    </div>
    <style>
        #gaccount{
            position: absolute;
            left: 600px;
            top: 80px;
        }
        #gpassword{
            position: absolute;
            left: 600px;
            top: 130px;
        }
        #login-button{
            position: absolute;
            left: 600px;
            top: 180px;
        }
        #regist-button{
            position: absolute;
            left: 650px;
            top: 180px;
        }
    </style>
<script type="text/javascript">
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
                url:"/Login",
                data:{
                    account:account,
                    password:password
                },
                dataType:"json",
                success:function (data) {
                    if(data.stateCode == "0") {
                        $("#info").text("提示:该用户不存在");
                    } else if(data.stateCode == "1") {
                        $("#info").text("提示:密码错误");
                    } else if(data.stateCode == "2"){
                        $("#info").text("提示:登陆成功，跳转中...");
                        window.location.href="/User_main";
                    }
                }
            });
        }
    })
    $("#regist-button").click(function () {
        window.location.href="/Regist_main";
    })
</script>
</div>
</body>
</html>