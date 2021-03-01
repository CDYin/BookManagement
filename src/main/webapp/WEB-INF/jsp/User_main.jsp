<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>User</title>
    <h1 style="text-align: center">欢迎</h1>
    <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
</head>
<body>
<div class="User-body">
    <div class="User-group" id="Bseek">
        <div class="User-group" id="Bsearch">
            <label for="search">图书编号</label>
            <input type="text" class="User-control" id="search" placeholder="请输入查询的输图书编号">
        </div>
        <button id="booksearch">查询</button>
    </div>
    <div class="User-group" id="Bcancel">
        <div class="User-group" id="Bdelete">
            <label for="delete">图书编号</label>
            <input type="text" class="User-control" id="delete" placeholder="请输入删除的图书编号">
        </div>
        <button id="bookdelete">删除</button>
    </div>
    <div class="User-group" id="Badd">
        <div class="User-group" id="ID">
            <label for="BID">图书编号</label>
            <input type="text" class="User-control" id="BID" placeholder="请输入图书编号">
        </div>
        <div class="User-group" id="name">
            <label for="Bname">图书名称</label>
            <input type="text" class="User-control" id="Bname" placeholder="请输入图书名称">
        </div>
        <div class="User-group" id="author">
            <label for="Bauthor">图书作者</label>
            <input type="text" class="User-control" id="Bauthor" placeholder="请输入图书作者">
        </div>
        <div class="User-group" id="price">
            <label for="Bprice">图书价格</label>
            <input type="text" class="User-control" id="Bprice" placeholder="请输入图书价格">
        </div>
        <button id="bookadd">完成</button>
    </div>
    <p style="text-align: right;color: red;position: absolute" id="info"></p><br/>
</div>

<script type="text/javascript">
    $("#bookadd").click(function () {
        var ID = $("#BID").val();
        var name = $("#Bname").val();
        var author = $("#Bauthor").val();
        var price = $("#Bprice").val();
        $.ajax({
            type:"POST",
            url:"/bookadd",
            data:{
                ID:ID,
                name:name,
                author:author,
                price:price
            },
            dataType:"json",
            success:function () {
                $("#info").text("提示:图书信息加入成功");
            }
        })
    })
    $("#booksearch").click(function () {
        var ID = $("#search").val();
        $.ajax({
            type:"POST",
            url:"/Book_info",
            data:{
                ID:ID
            },
            dataType:"json",
            success:function (data) {
                if (data){
                    var result = eval(data)
                    console.log(result)
                    //将数据显示在页面上
                    var str = "";
                    str +="<table><thead><tr><th>ID</th><th>name</th><th>author</th><th>price</th></tr></thead><tbody>";                    //遍历数据
                    str +="<tr><td>"+result.iD+"</td><td>"+result.name+"</td><td>"+result.author+"</td><td>"+result.price+"</td></tr>";
                    str +="</tbody></table>";
                    $('body').append(str);
                }
            }
        })
    })
    $("#bookdelete").click(function () {
        var ID = $("#delete").val();
        $.ajax({
            type:"POST",
            url:"/bookdelete",
            data:{
                ID:ID
            },
            dataType:"json",
            success:function () {
                $("#info").text("提示:图书信息删除成功");
            }
        })
    })
</script>
</body>
</html>