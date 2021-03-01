<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Regist</title>
    <h1 style="text-align: center">注册</h1>
    <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
</head>
<body>

<div class="Regist-default" id="Regist">
    <style>
        #Raccount{
            position: absolute;
            left: 600px;
            top: 80px;
        }
        #Rpassword{
            position: absolute;
            left: 600px;
            top: 130px;
        }
        #regist-button{
            position: absolute;
            left: 600px;
            top: 180px;
        }
        #cancel-button{
            position: absolute;
            left: 650px;
            top: 180px;
        }
    </style>
    <div class="Regist-body">
        <div class="Regist-group" id="Raccount">
            <span class="input-account">用户名</span>
            <input type="text" class="Regist-control" id="account" placeholder="请输入用户名">
        </div>

        <div class="Regist-group" id="Rpassword">
            <span class="input-password">密&nbsp&nbsp&nbsp码</span>
            <input type="password" class="Regist-control" id="password" placeholder="请输入密码">
        </div>
        <p style="text-align: right;color: red;position: absolute" id="info"></p><br/>
        <button id="regist-button">完成</button>
        <button id="cancel-button">返回</button>
    </div>
    <script>
        $("#regist-button").click(function () {
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
                    url:"/Regist",
                    data:{
                        account:account,
                        password:password
                    },
                    dataType:"json",
                    success:function (data) {
                        if(data){
                            window.location.href="/index";
                        }
                    }
                });
            }
        })
        $("#cancel-button").click(function () {
            window.location.href = "/index";
        })
    </script>
</div>
</body>
</html>