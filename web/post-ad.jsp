<%-- 
    Document   : index
    Created on : Jan 25, 2018, 12:30:06 PM
    Author     : HP
--%>
<%@ page import="org.hibernate.criterion.Restrictions" %>
<%@ page import="POJOS.User" %>
<%@ page import="POJOS.Ad" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.Criteria" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" import="java.util.*" %>

<!DOCTYPE html>

<%
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    Session ses = DB.Connection.getSessionFactory().openSession();
    if (request.getSession().getAttribute("User_Email") == null) {

        response.sendRedirect("index.jsp");
    } else {
%>


<html>    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sell it </title>
        <link rel="stylesheet" href="css/bootstrap.min.css"><!-- bootstrap-CSS -->
        <link rel="stylesheet" href="css/bootstrap-select.css"><!-- bootstrap-select-CSS -->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" /><!-- style.css -->
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" /><!-- flexslider-CSS -->
        <link rel="stylesheet" href="css/font-awesome.min.css" /><!-- fontawesome-CSS -->
        <link rel="stylesheet" href="css/menu_sideslide.css" type="text/css" media="all"><!-- Navigation-CSS -->
        <!-- meta tags -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Resale Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- //meta tags -->
        <!--fonts-->
        <link href='//fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
        <!--//fonts-->	
        <!-- js -->
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <!-- js -->
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/bootstrap.js"></script>
        <script src="js/bootstrap-select.js"></script>
        <script>
            $(document).ready(function () {
                var mySelect = $('#first-disabled2');

                $('#special').on('click', function () {
                    mySelect.find('option:selected').prop('disabled', true);
                    mySelect.selectpicker('refresh');
                });

                $('#special2').on('click', function () {
                    mySelect.find('option:disabled').prop('disabled', false);
                    mySelect.selectpicker('refresh');
                });

                $('#basic2').selectpicker({
                    liveSearch: true,
                    maxOptions: 1
                });
            });
        </script>

        <style>
            .w3ls-header-right ul.dropdown-menu{
                background-color: #000;
            }          
        </style>

        <!-- language-select -->
        <script type="text/javascript" src="js/jquery.leanModal.min.js"></script>
        <link href="css/jquery.uls.css" rel="stylesheet"/>
        <link href="css/jquery.uls.grid.css" rel="stylesheet"/>
        <link href="css/jquery.uls.lcd.css" rel="stylesheet"/>
        <!-- Source -->
        <script src="js/jquery.uls.data.js"></script>
        <script src="js/jquery.uls.data.utils.js"></script>
        <script src="js/jquery.uls.lcd.js"></script>
        <script src="js/jquery.uls.languagefilter.js"></script>
        <script src="js/jquery.uls.regionfilter.js"></script>
        <script src="js/jquery.uls.core.js"></script>
        <script>
            $(document).ready(function () {
                $('.uls-trigger').uls({
                    onSelect: function (language) {
                        var languageName = $.uls.data.getAutonym(language);
                        $('.uls-trigger').text(languageName);
                    },
                    quickList: ['en', 'hi', 'he', 'ml', 'ta', 'fr'] //FIXME
                });
            });
        </script>
        <!-- //language-select -->
    </head>
    <body>
        <!-- Navigation -->
        <div class="agiletopbar">
            <div class="wthreenavigation">
                <div class="menu-wrap">
                    <nav class="menu">
                        <div class="icon-list">
                            <a href="mobiles.jsp"><i class="fa fa-fw fa-mobile"></i><span>Mobiles</span></a>
                            <a href="electronics-appliances.jsp"><i class="fa fa-fw fa-laptop"></i><span>Electronics and appliances</span></a>
                            <a href="cars.jsp"><i class="fa fa-fw fa-car"></i><span>Cars</span></a>
                            <a href="bikes.jsp"><i class="fa fa-fw fa-motorcycle"></i><span>Bikes</span></a>
                            <a href="furnitures.jsp"><i class="fa fa-fw fa-wheelchair"></i><span>Furnitures</span></a>
                            <a href="pets.jsp"><i class="fa fa-fw fa-paw"></i><span>Pets</span></a>
                            <a href="books-sports-hobbies.jsp"><i class="fa fa-fw fa-book"></i><span>Books, Sports & Hobbies</span></a>
                            <a href="fashion.jsp"><i class="fa fa-fw fa-asterisk"></i><span>Fashion</span></a>
                            <a href="kids.jsp"><i class="fa fa-fw fa-asterisk"></i><span>Kids</span></a>
                            <a href="services.jsp"><i class="fa fa-fw fa-shield"></i><span>Services</span></a>
                            <a href="jobs.jsp"><i class="fa fa-fw fa-at"></i><span>Jobs</span></a>
                            <a href="real-estate.jsp"><i class="fa fa-fw fa-home"></i><span>Real Estate</span></a>
                        </div>
                    </nav>
                    <button class="close-button" id="close-button">Close Menu</button>
                </div>
                <button class="menu-button" id="open-button"> </button>
            </div>
            <div class="clearfix"></div>
        </div>
        <!-- //Navigation -->
        <!-- header -->
        <header>
            <div class="w3ls-header"><!--header-one--> 
                <div class="w3ls-header-left">

                </div>
                <% Criteria cr = ses.createCriteria(User.class).add(Restrictions.eq("email", request.getSession().getAttribute("User_Email").toString()));
                    User us = (User) cr.uniqueResult();%>

                <div class="w3ls-header-right">
                    <ul>
                        <li class="dropdown head-dpdn">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user"></span> <%=us.getName()%>

                                <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="profile.jsp">My Profile</a></li>
                                <li><a href="Logout">Logout</a></li>

                            </ul>
                        </li>
                        <li class="dropdown head-dpdn">
                            <a href="help.jsp"><i class="fa fa-question-circle" aria-hidden="true"></i> Help</a>
                        </li>
                        <li class="dropdown head-dpdn">
                            <a href="#"><span class="active uls-trigger"><i class="fa fa-language" aria-hidden="true"></i>languages</span></a>
                        </li>
                        <li class="dropdown head-dpdn">
                            <div class="header-right">			
                                <!-- Large modal -->
                                <div class="agile-its-selectregion">
                                    <button class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                                        <i class="fa fa-globe" aria-hidden="true"></i>Select Town</button>
                                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                                         aria-hidden="true">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                        &times;</button>
                                                    <h4 class="modal-title" id="myModalLabel">
                                                        Please Choose Your Location</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <form class="form-horizontal" action="#" method="get">
                                                        <div class="form-group">
                                                            <select id="basic2" class="show-tick form-control" multiple>
                                                                <optgroup label="Popular Cities">
                                                                    <option selected style="display:none;color:#eee;">Select Town</option>
                                                                    <option>Ampara</option>
                                                                    <option>Anuradhapura</option>
                                                                    <option>Badulla</option>
                                                                    <option>Batticalo</option>
                                                                    <option>Colombo</option>
                                                                    <option>Galle</option>
                                                                    <option>Gampaha</option>
                                                                    <option>Hambantota</option>
                                                                    <option>Jaffna</option>
                                                                    <option>Kalutara</option>
                                                                    <option>Kandy</option>
                                                                    <option>Kegalle</option>
                                                                    <option>Kilinochchi</option>
                                                                    <option>Kurunegala</option>
                                                                    <option>Mannar</option>
                                                                    <option>Matale</option>
                                                                    <option>Matara</option>
                                                                    <option>Monaragala</option>
                                                                    <option>Mullativu</option>
                                                                    <option>Nuwara Eliya</option>
                                                                    <option>Polonnaruwa</option>
                                                                    <option>Puttalam</option>
                                                                    <option>Ratnapura</option>
                                                                    <option>Trincomalee</option>
                                                                    <option>Vavuniya</option>
                                                                </optgroup>
                                                                <optgroup label="Ampara">
                                                                    <option>Akkarepattu</option>
                                                                    <option>Ampara</option>
                                                                    <option>Kalmunai</option>
                                                                    <option>Sainthamaruthu</option>
                                                                </optgroup>
                                                                <optgroup label="Anuradhapura">
                                                                    <option>Anuradhapura</option>
                                                                    <option>Kekirawa</option>
                                                                    <option>Tambuttegama</option>
                                                                    <option>Medawachchiya</option>
                                                                    <option>KetchikanEppawala</option>
                                                                </optgroup>
                                                                <optgroup label="Badulla">
                                                                    <option>Badulla</option>
                                                                    <option>Bandarawela</option>
                                                                    <option>Welimada</option>
                                                                    <option>Mahiyanganaya</option>
                                                                    <option>Hali Ela</option>
                                                                </optgroup>
                                                                <optgroup label="Batticalo">
                                                                    <option>Batticalo</option>
                                                                </optgroup>
                                                                <optgroup label="Colombo">
                                                                    <option>Dehiwala</option>
                                                                    <option>Nugegoda</option>
                                                                    <option>Piliyandala</option>
                                                                    <option>Maharagama</option>
                                                                    <option>Kottawa</option>
                                                                </optgroup>
                                                                <optgroup label="Galle">
                                                                    <option>Galle</option>
                                                                    <option>Alpitiya</option>
                                                                    <option>Ambalangoda</option>
                                                                    <option>Baddegama</option>
                                                                    <option>Hikkaduwa</option>
                                                                </optgroup>
                                                                <optgroup label="Gampaha">
                                                                    <option>Gampaha</option>
                                                                    <option>Kadawatha</option>
                                                                    <option>Negombo</option>
                                                                    <option>Ja Ela</option>
                                                                    <option>Kelaniya</option>
                                                                </optgroup>
                                                                <optgroup label="Hambantota">
                                                                    <option>Ambalanthota</option>
                                                                    <option>Beliatta</option>
                                                                    <option>Hambanthota</option>
                                                                    <option>Tangalle</option>
                                                                    <option>Tissamaharamaya</option>
                                                                </optgroup>
                                                                <optgroup label="Jaffna">
                                                                    <option>Jaffna</option>
                                                                    <option>Nallur</option>
                                                                </optgroup>
                                                                <optgroup label="Kalutara">
                                                                    <option>Bandaragama</option>
                                                                    <option>Horana</option>
                                                                    <option>Kalutara</option>
                                                                    <option>Mathugama</option>
                                                                    <option>Panadura</option>
                                                                </optgroup>
                                                                <optgroup label="Kegalle">
                                                                    <option>Kegalle</option>
                                                                    <option>Mawanella</option>
                                                                    <option>Rambukkana</option>
                                                                    <option>Ruwanwella</option>
                                                                    <option>Warakapola</option>
                                                                </optgroup>
                                                                <optgroup label="Kilinochchi">
                                                                    <option>Kilinochchi</option>
                                                                </optgroup>
                                                                <optgroup label="Kurunegala">
                                                                    <option>Kurunegala</option>
                                                                    <option>Kuliyapitiya</option>
                                                                    <option>Narammala</option>
                                                                    <option>Pannala</option>
                                                                    <option>Wariyapola</option>
                                                                </optgroup>
                                                                <optgroup label="Mannar">
                                                                    <option>Mannar</option>														       
                                                                </optgroup>
                                                                <optgroup label="Matale">
                                                                    <option>Dambulla</option>
                                                                    <option>Galewela</option>
                                                                    <option>Matale</option>
                                                                    <option>Sigiriya</option>
                                                                    <option>Ukuwela</option>       													
                                                                </optgroup>
                                                                <optgroup label="Matara">
                                                                    <option>Akuressa</option>
                                                                    <option>Dikwella</option>
                                                                    <option>Hakmana</option>
                                                                    <option>Matara</option>
                                                                    <option>Weligama</option>            													
                                                                </optgroup>
                                                                <optgroup label="Moneragala">
                                                                    <option>Bibile</option>
                                                                    <option>Buttala</option>
                                                                    <option>Kataragama</option>
                                                                    <option>Moneragala</option>
                                                                    <option>Wellawaya</option>        														
                                                                </optgroup>
                                                                <optgroup label="Mullativu">
                                                                    <option>Mullativu</option>          														
                                                                </optgroup>
                                                                <optgroup label="Nuwara Eliya">
                                                                    <option>Ginigathena</option>
                                                                    <option>Hatton</option>
                                                                    <option>Madulla</option>
                                                                    <option>Nuwara Eliya</option>        														
                                                                </optgroup>
                                                                <optgroup label="Polonnaruwa">
                                                                    <option>Hingurakgoda</option>
                                                                    <option>Kaduruwela</option>
                                                                    <option>Medirigiriya</option>
                                                                    <option>Polonnaruwa</option>         														
                                                                </optgroup>
                                                                <optgroup label="Puttalam">
                                                                    <option>Chilaw</option>
                                                                    <option>Dankotuwa</option>
                                                                    <option>Nattandiya</option>
                                                                    <option>Puttalam</option>
                                                                    <option>Wennappuwa</option>  
                                                                </optgroup>
                                                                <optgroup label="Ratnapura">
                                                                    <option>Balangoda</option>
                                                                    <option>Eheliyagoda</option>
                                                                    <option>Embilipitiya</option>
                                                                    <option>Pelmadulla</option>
                                                                    <option>Ratnapura</option> 
                                                                </optgroup>
                                                                <optgroup label="Trincomalee">
                                                                    <option>Kinniya</option>
                                                                    <option>Trincomalee</option>      														
                                                                </optgroup>
                                                                <optgroup label="Vavuniya">
                                                                    <option>Vavuniya</option>        														
                                                                </optgroup>

                                                            </select>
                                                        </div>
                                                    </form>    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>

                <div class="clearfix"> </div> 
            </div>
            <div class="container">
                <div class="agile-its-header">
                    <div class="logo">
                        <h1><img src=""><a href="index.jsp"><span>Sell </span>it</a></h1>
                    </div>
                    <div class="agileits_search">
                        <form action="IndexSearch" method="post">
                            <input name="Search" type="text" placeholder="How can we help you today?" required="" />
                            <select id="agileinfo_search" name="agileinfo_search" required="">
                                <option value="">All Categories</option>
                                <option value="Mobiles">Mobiles</option>
                                <option value="Electronics & Appliances">Electronics & Appliances</option>
                                <option value="Cars">Cars</option>
                                <option value="Bikes">Bikes</option>
                                <option value="Furnitures">Furnitures</option>
                                <option value="Books, Sports & Hobbies">Books, Sports & Hobbies</option>
                                <option value="Fashion">Fashion</option>
                                <option value="Kids">Kids</option>
                                <option value="Services">Services</option>
                                <option value="Jobs">Jobs</option>
                                <option value="Real Estates">Real Estates</option>
                            </select>
                            <button type="submit" class="btn btn-default" aria-label="Left Align">
                                <i class="fa fa-search" aria-hidden="true"> </i>
                            </button>
                        </form>
                        <a class="post-w3layouts-ad" href="signin.jsp">Post Your Ad</a>
                    </div>	
                    <div class="clearfix"></div>
                </div>
            </div>
        </header>
        <!-- //header -->
        <!-- breadcrumbs -->
        <div class="w3layouts-breadcrumbs text-center">
            <div class="container">
                <span class="agile-breadcrumbs"><a href="index.jsp"><i class="fa fa-home home_1"></i></a> / <span>Post your Ad</span></span>
            </div>
        </div>
        <!-- //breadcrumbs -->
        <!-- Submit Ad -->
        <div class="submit-ad main-grid-border">
            <div class="container">
                <h2 class="w3-head">Post an Ad</h2>
                <div class="post-ad-form">
                    <form action="PostAd" method="post" enctype="multipart/form-data">
                        <label>Select Category <span>*</span></label>
                        <select required name="category">
                            <option selected disabled value="">Select Category</option>
                            <option>Mobiles</option>
                            <option>Electronics and Appliances</option>
                            <option>Cars</option>
                            <option>Bikes</option>
                            <option>Furniture</option>
                            <option>Pets</option>
                            <option>Books, Sports and hobbies</option>
                            <option>Fashion</option>
                            <option>Kids</option> 
                            <option>Services</option>
                            <option>Real, Estate</option>
                        </select>
                        <div class="clearfix"></div>
                        <label>Ad Title <span>*</span></label>
                        <input type="text" name="title"  placeholder="" required="">
                        <div class="clearfix"></div>
                        <label>Ad Description <span>*</span></label>
                        <textarea  name="description" placeholder="Write few lines about your product" required=""></textarea>
                        <div class="clearfix"></div>

                        <div class="sell-details">

                            <label>Price <span>*</span></label>
                            <input type="text"  name="price" placeholder="" required="">
                            <div class="clearfix"></div>
                            <label>Brand <span>*</span></label>
                            <input type="text"  name="brand" placeholder="" required="">
                            <div class="clearfix"></div>
                            <label>Select Location <span>*</span></label>
                            <select required name="location">
                                <option selected disabled value="">Select Location</option>

                                <optgroup label="Ampara">
                                    <option>Akkarepattu</option>
                                    <option>Ampara</option>
                                    <option>Kalmunai</option>
                                    <option>Sainthamaruthu</option>
                                </optgroup>
                                <optgroup label="Anuradhapura">
                                    <option>Anuradhapura</option>
                                    <option>Kekirawa</option>
                                    <option>Tambuttegama</option>
                                    <option>Medawachchiya</option>
                                    <option>KetchikanEppawala</option>
                                </optgroup>
                                <optgroup label="Badulla">
                                    <option>Badulla</option>
                                    <option>Bandarawela</option>
                                    <option>Welimada</option>
                                    <option>Mahiyanganaya</option>
                                    <option>Hali Ela</option>
                                </optgroup>
                                <optgroup label="Batticalo">
                                    <option>Batticalo</option>
                                </optgroup>
                                <optgroup label="Colombo">
                                    <option>Dehiwala</option>
                                    <option>Nugegoda</option>
                                    <option>Piliyandala</option>
                                    <option>Maharagama</option>
                                    <option>Kottawa</option>
                                </optgroup>
                                <optgroup label="Galle">
                                    <option>Galle</option>
                                    <option>Alpitiya</option>
                                    <option>Ambalangoda</option>
                                    <option>Baddegama</option>
                                    <option>Hikkaduwa</option>
                                </optgroup>
                                <optgroup label="Gampaha">
                                    <option>Gampaha</option>
                                    <option>Kadawatha</option>
                                    <option>Negombo</option>
                                    <option>Ja Ela</option>
                                    <option>Kelaniya</option>
                                </optgroup>
                                <optgroup label="Hambantota">
                                    <option>Ambalanthota</option>
                                    <option>Beliatta</option>
                                    <option>Hambanthota</option>
                                    <option>Tangalle</option>
                                    <option>Tissamaharamaya</option>
                                </optgroup>
                                <optgroup label="Jaffna">
                                    <option>Jaffna</option>
                                    <option>Nallur</option>
                                </optgroup>
                                <optgroup label="Kalutara">
                                    <option>Bandaragama</option>
                                    <option>Horana</option>
                                    <option>Kalutara</option>
                                    <option>Mathugama</option>
                                    <option>Panadura</option>
                                </optgroup>
                                <optgroup label="Kegalle">
                                    <option>Kegalle</option>
                                    <option>Mawanella</option>
                                    <option>Rambukkana</option>
                                    <option>Ruwanwella</option>
                                    <option>Warakapola</option>
                                </optgroup>
                                <optgroup label="Kilinochchi">
                                    <option>Kilinochchi</option>
                                </optgroup>
                                <optgroup label="Kurunegala">
                                    <option>Kurunegala</option>
                                    <option>Kuliyapitiya</option>
                                    <option>Narammala</option>
                                    <option>Pannala</option>
                                    <option>Wariyapola</option>
                                </optgroup>
                                <optgroup label="Mannar">
                                    <option>Mannar</option>														       
                                </optgroup>
                                <optgroup label="Matale">
                                    <option>Dambulla</option>
                                    <option>Galewela</option>
                                    <option>Matale</option>
                                    <option>Sigiriya</option>
                                    <option>Ukuwela</option>       													
                                </optgroup>
                                <optgroup label="Matara">
                                    <option>Akuressa</option>
                                    <option>Dikwella</option>
                                    <option>Hakmana</option>
                                    <option>Matara</option>
                                    <option>Weligama</option>            													
                                </optgroup>
                                <optgroup label="Moneragala">
                                    <option>Bibile</option>
                                    <option>Buttala</option>
                                    <option>Kataragama</option>
                                    <option>Moneragala</option>
                                    <option>Wellawaya</option>        														
                                </optgroup>
                                <optgroup label="Mullativu">
                                    <option>Mullativu</option>          														
                                </optgroup>
                                <optgroup label="Nuwara Eliya">
                                    <option>Ginigathena</option>
                                    <option>Hatton</option>
                                    <option>Madulla</option>
                                    <option>Nuwara Eliya</option>        														
                                </optgroup>
                                <optgroup label="Polonnaruwa">
                                    <option>Hingurakgoda</option>
                                    <option>Kaduruwela</option>
                                    <option>Medirigiriya</option>
                                    <option>Polonnaruwa</option>         														
                                </optgroup>
                                <optgroup label="Puttalam">
                                    <option>Chilaw</option>
                                    <option>Dankotuwa</option>
                                    <option>Nattandiya</option>
                                    <option>Puttalam</option>
                                    <option>Wennappuwa</option>  
                                </optgroup>
                                <optgroup label="Ratnapura">
                                    <option>Balangoda</option>
                                    <option>Eheliyagoda</option>
                                    <option>Embilipitiya</option>
                                    <option>Pelmadulla</option>
                                    <option>Ratnapura</option> 
                                </optgroup>
                                <optgroup label="Trincomalee">
                                    <option>Kinniya</option>
                                    <option>Trincomalee</option>      														
                                </optgroup>
                                <optgroup label="Vavuniya">
                                    <option>Vavuniya</option>        														
                                </optgroup>

                            </select>

                            <div class="clearfix"></div>

                        </div>

                        <div class="clearfix"></div>
                        <div class="upload-ad-photos">
                            <label>Photos for your ad :</label>	
                            <div class="photos-upload-view">
                                
                                    <img id="output" style="width: 250px; height: 250px; " src="images/default-store.jpg"/>
                                    <input type="hidden" id="MAX_FILE_SIZE" name="MAX_FILE_SIZE" value="300000" />

                                    <div>
                                        <input type="file" id="fileselect" onchange="loadFile(event)" name="image" multiple="multiple"/>
                                        
                                    </div>
                                <div id="messages">
                                    <p>Status Messages</p>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <script src="js/filedrag.js"></script>
                            <script>
                                        var loadFile = function (event) {
                                            var reader = new FileReader();
                                            reader.onload = function () {
                                                var output = document.getElementById('output');

                                                output.src = reader.result;
                                            };
                                            reader.readAsDataURL(event.target.files[0]);
                                        };

                                        function deleteimage() {
                                            $("#output").remove();
                                        }


                            </script>
                        </div>
                        <div class="clearfix"></div>
                        
                        <div class="personal-details">

                            <label>Your Name <span>*</span></label>
                            <input type="text"  name="name" value="<%=us.getName()%>" placeholder="" >
                            <div class="clearfix"></div>
                            <label>Your Mobile No <span>*</span></label>
                            <input type="text"  name="tel" value="<%=us.getMobile()%>" placeholder="" >
                            <div class="clearfix"></div>
                            <label>Your Email Address<span>*</span></label>
                            <input type="text"  name="email" value="<%=us.getEmail()%>" placeholder="" >
                            <div class="clearfix"></div>
<!--                            <p class="post-terms">By clicking <strong>post Button</strong> you accept our <a href="terms.html" target="_blank">Terms of Use </a> and <a href="privacy.html" target="_blank">Privacy Policy</a></p>-->
                            <input type="submit" value="Continue">					
                            <div class="clearfix"></div>

                        </div>
                    </form>
                </div>
            </div>	
        </div>
        <!-- // Submit Ad -->
        <!--footer section start-->		
        <footer>
            <div class="w3-agileits-footer-top">
                <div class="container">
                    <div class="wthree-foo-grids">
                        <div class="col-md-3 wthree-footer-grid">
                            <h4 class="footer-head">Who We Are</h4>
                            <p></p>
                        </div>
                        <div class="col-md-3 wthree-footer-grid">
                            <h4 class="footer-head">Help</h4>
                            <ul>
                                <li><a href="howitworks.jsp"><i class="fa fa-long-arrow-right" aria-hidden="true"></i>How it Works</a></li>						
                                <li><a href="sitemap.jsp"><i class="fa fa-long-arrow-right" aria-hidden="true"></i>Sitemap</a></li>
                                <li><a href="help.jsp"><i class="fa fa-long-arrow-right" aria-hidden="true"></i>Faq</a></li>
                                <li><a href="feedback.jsp"><i class="fa fa-long-arrow-right" aria-hidden="true"></i>Feedback</a></li>
                                <li><a href="contact.jsp"><i class="fa fa-long-arrow-right" aria-hidden="true"></i>Contact</a></li>
                            </ul>
                        </div>
                        <div class="col-md-3 wthree-footer-grid">
                            <h4 class="footer-head">Information</h4>
                            <ul>
                                <li><a href="regions.jsp"><i class="fa fa-long-arrow-right" aria-hidden="true"></i>Locations Map</a></li>	
                                <li><a href="terms.jsp"><i class="fa fa-long-arrow-right" aria-hidden="true"></i>Terms of Use</a></li>	
                            </ul>
                        </div>
                        <div class="col-md-3 wthree-footer-grid">
                            <h4 class="footer-head">Contact Us</h4>

                            <address>

                                <div class="clearfix"> </div>
                                <ul class="location">
                                    <li><span class="glyphicon glyphicon-earphone"></span></li>
                                    <li>0 714 543 081</li>
                                </ul>	
                                <div class="clearfix"> </div>
                                <ul class="location">
                                    <li><span class="glyphicon glyphicon-envelope"></span></li>
                                    <li><a href="mailto:igsbinukagamage@gmail.com">igsbinukagamage@gmail.com</a></li>
                                </ul>						
                            </address>
                        </div>
                        <div class="clearfix"></div>
                    </div>						
                </div>	
            </div>	
            <div class="agileits-footer-bottom text-center">
                <div class="container">
                    <div class="w3-footer-logo">
                        <h1><a href="index.jsp"><span>Sell </span>it</a></h1>
                    </div>
                    <div class="w3-footer-social-icons">
                        <ul>
                            <li><a class="facebook" href="#"><i class="fa fa-facebook" aria-hidden="true"></i><span>Facebook</span></a></li>
                            <li><a class="twitter" href="#"><i class="fa fa-twitter" aria-hidden="true"></i><span>Twitter</span></a></li>
                            <li><a class="flickr" href="#"><i class="fa fa-flickr" aria-hidden="true"></i><span>Flickr</span></a></li>
                            <li><a class="googleplus" href="#"><i class="fa fa-google-plus" aria-hidden="true"></i><span>Google+</span></a></li>
                            <li><a class="dribbble" href="#"><i class="fa fa-dribbble" aria-hidden="true"></i><span>Dribbble</span></a></li>
                        </ul>
                    </div>
                    <div class="copyrights">
                        <p> © 2017 Sell it. All Rights Reserved </p>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </footer>
        <!--footer section end-->
        <!-- Navigation-JavaScript -->
        <script src="js/classie.js"></script>
        <script src="js/main.js"></script>
        <!-- //Navigation-JavaScript -->
        <!-- here stars scrolling icon -->
        <script type="text/javascript">
                                        $(document).ready(function () {
                                            /*
                                             var defaults = {
                                             containerID: 'toTop', // fading element id
                                             containerHoverID: 'toTopHover', // fading element hover id
                                             scrollSpeed: 1200,
                                             easingType: 'linear' 
                                             };
                                             */

                                            $().UItoTop({easingType: 'easeOutQuart'});

                                        });
        </script>
        <!-- start-smoth-scrolling -->
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script type="text/javascript">
                                        jQuery(document).ready(function ($) {
                                            $(".scroll").click(function (event) {
                                                event.preventDefault();
                                                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                                            });
                                        });
        </script>
        <!-- start-smoth-scrolling -->
        <!-- //here ends scrolling icon -->
    </body>
</html>
<%    }
%>
