<%-- 
    Document   : error500
    Created on : Feb 13, 2018, 11:16:50 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error 500</title>
        <link rel="stylesheet" href="css/bootstrap-theme.css" type="text/css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css" type="text/css">
        <link rel="stylesheet" href="css/bootstrap.css" type="text/css">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <style>
            body{
                background-image: url(images/bg.png);
            }
            .wrap{
                width: 100%;
            }
            .banner img{

                width: 30%;
            }

        </style>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <!--<a class="navbar-brand" href="#"><img alt="Brand" src="images/logo1.png" height="80px" width="160px" ></a>-->
                    <a class="navbar-brand" href="index.jsp"><b>Sellit</b></a>
                </div>
                <div class="navd">
                    <ul class="nav navbar-nav">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="all-classifieds.jsp">All Classifieds</a></li>
                        <li><a href="categories.jsp">Categories</a></li> 

                    </ul>
                </div>
                <!--	<ul class="nav navbar-nav navbar-right">
                      <li><a href="#sign"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                      <li><a href="#sign"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                    </ul>-->
            </div>
        </nav>
        <div class="wrap">
            <center><h1>A problem has been occurred !!!</h1></center>
            <div class="text-center">
                <img src="images/500.png" alt="" class="rounded mx-auto d-block"/>
            </div>
            <div class="page">
                <center> <h2>Dude,,we have encountered an internal server error!</h2></center>
            </div>
            <div class="footer">
                <center>&copy; 2018 All Rights Reserved</center>
            </div>
        </div>
        <script src="js/bootstrap.js"></script>
    </body>

</html>
