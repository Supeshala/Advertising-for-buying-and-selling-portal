<%-- 
    Document   : jobs
    Created on : Feb 28, 2018, 10:10:10 PM
    Author     : HP
--%>

<%@page import="POJOS.User"%>
<%@page import="org.hibernate.criterion.Projections"%>
<%@page import="org.hibernate.FetchMode"%>
<%@ page import="org.hibernate.criterion.Restrictions" %>
<%@ page import="POJOS.Ad" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.Criteria" %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>

<%
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    Session ses = DB.Connection.getSessionFactory().openSession();

%>


<html>
    <head>
        <title>Jobs :: Sellit</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-select.css">
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/jquery-ui1.css">
        <link rel="stylesheet" href="css/font-awesome.min.css" /><!-- fontawesome-CSS -->
        <link rel="stylesheet" href="css/menu_sideslide.css" type="text/css" media="all"><!-- Navigation-CSS -->
        <!-- for-mobile-apps -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Resale Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- //for-mobile-apps -->
        <!--fonts-->
        <link href='//fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
        <!--//fonts-->	
        <!-- js -->
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <!-- js -->
        <script type="text/javascript" src="js/jquery.timeago.js" ></script>
        <script type="text/javascript">
            jQuery(document).ready(function () {
                $("time.timeago").timeago();
            });
        </script>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-select.js"></script>
        <script type="text/javascript">
            $('.selectpicker').selectpicker({
            });
        </script>
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
        <script src="js/tabs.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                var elem = $('#container ul');
                $('#viewcontrols a').on('click', function (e) {
                    if ($(this).hasClass('gridview')) {
                        elem.fadeOut(1000, function () {
                            $('#container ul').removeClass('list').addClass('grid');
                            $('#viewcontrols').removeClass('view-controls-list').addClass('view-controls-grid');
                            $('#viewcontrols .gridview').addClass('active');
                            $('#viewcontrols .listview').removeClass('active');
                            elem.fadeIn(1000);
                        });
                    }
                    else if ($(this).hasClass('listview')) {
                        elem.fadeOut(1000, function () {
                            $('#container ul').removeClass('grid').addClass('list');
                            $('#viewcontrols').removeClass('view-controls-grid').addClass('view-controls-list');
                            $('#viewcontrols .gridview').removeClass('active');
                            $('#viewcontrols .listview').addClass('active');
                            elem.fadeIn(1000);
                        });
                    }
                });
            });
        </script>
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
                <div class="w3ls-header-right">
                    <ul>
                        
                        <li class="dropdown head-dpdn">
                            <a href="help.jsp"><i class="fa fa-question-circle" aria-hidden="true"></i> Help</a>
                        </li>
                        <li class="dropdown head-dpdn">
                            <a href="#"><span class="active uls-trigger"><i class="fa fa-language" aria-hidden="true"></i>languages</span></a>
                        </li>
                        <%                            if (request.getSession().getAttribute("User_Email") != null) {
                        %>

                        <% Criteria cr = ses.createCriteria(User.class).add(Restrictions.eq("email", request.getSession().getAttribute("User_Email").toString()));
                        User us = (User) cr.uniqueResult();%>
                        <li class="dropdown head-dpdn">
                            <a href="profile.jsp" aria-expanded="false"><i class="fa fa-user" aria-hidden="true"></i> <%=us.getName()%></a>
                        </li>
                        <li class="dropdown head-dpdn">
                            <a href="Logout" aria-expanded="false"><i class="fa fa-user" aria-hidden="true"></i>Log Out</a>
                        </li>
                        <% } else { %>
                        <li class="dropdown head-dpdn">
                            <a href="signin.jsp" aria-expanded="false"><i class="fa fa-user" aria-hidden="true"></i> Sign In</a>
                        </li>
                        <% }

                        %>
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
                                <option value="">Select Category</option>
                                <option value="All Categories">All Categories</option>
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
                        <%   if (request.getSession().getAttribute("User_Email") != null) {
                        %>

                        <% Criteria cr = ses.createCriteria(User.class).add(Restrictions.eq("email", request.getSession().getAttribute("User_Email").toString()));
                               User us = (User) cr.uniqueResult();%>
                        <a class="post-w3layouts-ad" href="post-ad.jsp">Post Your Ad</a>
                        <% } else { %>
                        <a class="post-w3layouts-ad" href="signin.jsp">Post Your Ad</a>
                        <% }

                        %>
                    </div>	
                    <div class="clearfix"></div>
                </div>
            </div>
        </header>
        <!-- //header -->
        <!-- breadcrumbs -->
	<div class="w3layouts-breadcrumbs text-center">
		<div class="container">
			<span class="agile-breadcrumbs">
			<a href="index.jsp"><i class="fa fa-home home_1"></i></a> / 
			<a href="categories.jsp">Categories</a> / 
			<span>Jobs</span></span>
		</div>
	</div>
	<!-- //breadcrumbs -->
        <div class="total-ads main-grid-border">
            <div class="container">
                <div class="select-box">
                    <div class="select-city-for-local-ads ads-list">
                        <label>Select your city to see local ads</label>
                        <select>
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
                    <div class="browse-category ads-list">
                        <label>Browse Categories</label>
                        <select class="" data-live-search="true">
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
                    </div>
                    <div class="search-product ads-list">
                        <label>Search for a specific product</label>
                        <div class="search">
                            <div id="custom-search-input">
                                <div class="input-group">
                                    <input type="text" class="form-control input-lg" placeholder="Refrigirators" />
                                    <span class="input-group-btn">
                                        <button class="btn btn-info btn-lg" type="button">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                
                
                <div class="ads-grid">
                    <div class="side-bar col-md-3">
                        <div class="search-hotel">
                            <h3 class="sear-head">Name contains</h3>
                            <form>
                                <input type="text" value="Product name..." onfocus="this.value = '';" onblur="if (this.value == '') {
                                            this.value = 'Product name...';
                                        }" required="">
                                <input type="submit" value=" ">
                            </form>
                        </div>

                        <div class="range">
                            <h3 class="sear-head">Price range</h3>
                            <ul class="dropdown-menu6">
                                <li>

                                    <div id="slider-range"></div>							
                                    <input type="text" id="amount" style="border: 0; color: #ffffff; font-weight: normal;" />
                                </li>			
                            </ul>
                            <!---->
                            <script type="text/javascript" src="js/jquery-ui.js"></script>
                            <script type='text/javascript'>//<![CDATA[ 
                                    $(window).load(function () {
                                        $("#slider-range").slider({
                                            range: true,
                                            min: 0,
                                            max: 9000,
                                            values: [50, 6000],
                                            slide: function (event, ui) {
                                                $("#amount").val("Rs." + ui.values[ 0 ] + " - Rs." + ui.values[ 1 ]);
                                            }
                                        });
                                        $("#amount").val("$" + $("#slider-range").slider("values", 0) + " - $" + $("#slider-range").slider("values", 1));

                                    });//]]>  

                            </script>

                        </div>
<!--                                                <div class="featured-ads">
                                                    <h2 class="sear-head fer">Featured Ads</h2>
                                                    <div class="featured-ad">
                                                        <a href="single.html">
                                                            <div class="featured-ad-left">
                                                                <img src="images/f1.jpg" title="ad image" alt="" />
                                                            </div>
                                                            <div class="featured-ad-right">
                                                                <h4>Lorem Ipsum is simply dummy text of the printing industry</h4>
                                                                <p>$ 450</p>
                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </a>
                                                    </div>
                                                    <div class="featured-ad">
                                                        <a href="single.html">
                                                            <div class="featured-ad-left">
                                                                <img src="images/f2.jpg" title="ad image" alt="" />
                                                            </div>
                                                            <div class="featured-ad-right">
                                                                <h4>Lorem Ipsum is simply dummy text of the printing industry</h4>
                                                                <p>$ 380</p>
                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </a>
                                                    </div>
                                                    <div class="featured-ad">
                                                        <a href="single.html">
                                                            <div class="featured-ad-left">
                                                                <img src="images/f3.jpg" title="ad image" alt="" />
                                                            </div>
                                                            <div class="featured-ad-right">
                                                                <h4>Lorem Ipsum is simply dummy text of the printing industry</h4>
                                                                <p>$ 560</p>
                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </a>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>-->
                    </div>
                    <div class="ads-display col-md-9">
                        <div class="wrapper">					
                            <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
                                <ul id="myTab" class="nav nav-tabs nav-tabs-responsive" role="tablist">
                                    <li role="presentation" class="active">
                                        <a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">
                                            <span class="text">All Ads</span>
                                        </a>
                                    </li>
                                    <!--                                    <li role="presentation" class="next">
                                                                            <a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">
                                                                                <span class="text">Ads with Photos</span>
                                                                            </a>
                                                                        </li>
                                                                        <li role="presentation">
                                                                            <a href="#samsa" role="tab" id="samsa-tab" data-toggle="tab" aria-controls="samsa">
                                                                                <span class="text">Company</span>
                                                                            </a>
                                                                        </li>-->
                                </ul>
                                <div id="myTabContent" class="tab-content">
                                    <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
                                        <div>
                                            <div id="container">
                                                <div class="view-controls-list" id="viewcontrols">
                                                    <label>view :</label>
                                                    <a class="gridview"><i class="glyphicon glyphicon-th"></i></a>
                                                    <a class="listview active"><i class="glyphicon glyphicon-th-list"></i></a>
                                                </div>
                                                <div class="sort">
                                                    <div class="sort-by">
                                                        <label>Sort By : </label>
                                                        <select>
                                                            <option value="">Most recent</option>
                                                            <option value="">Price: Rs Low to High</option>
                                                            <option value="">Price: Rs High to Low</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <% Criteria cr = ses.createCriteria(Ad.class).add(Restrictions.eq("category", "Jobs")); %>
                                                <% List<Ad> adList = cr.list(); %>
                                                <%
                                                    for (Ad a : adList) {
                                                %> 

                                                <ul class="list">
                                                    
                                                        <li>
                                                            <section class="list-left">
                                                                <h5 class="title"><%=a.getTitle()%></h5>
                                                                <span class="adprice">Rs.<%=a.getPrice()%></span>
                                                                <p class="catpath"> <%=a.getCategory()%> » <%=a.getBrand()%> </p>
                                                            </section>
                                                            <section class="list-group">
                                                                <time class="timeago" datetime="<%=a.getDate()%>" > new Date() </time> 
                                                                <br><br>
                                                                <span class="cityname"><%=a.getLocation()%></span>
                                                            </section> <br><br>
                                                            &nbsp;&nbsp;&nbsp;<a href="single.jsp?adId=<%=a.getIdad()%> "><button class="btn btn-success">View more»</button></a>
                                                            <div class="clearfix"></div>
                                                        </li> 
                                                    
                                                </ul>
                                                <% } %>
                                            </div>
                                        </div>
                                    </div>
                                    <ul class="pagination pagination-sm">
                               
                                        <li><a href="#">Prev</a></li>
                                        <li><a href="#">1</a></li>
                                        <li><a href="#">2</a></li>
                                        <li><a href="#">3</a></li>
                                        <li><a href="#">4</a></li>
                                        <li><a href="#">5</a></li>
                                        <li><a href="#">6</a></li>
                                        <li><a href="#">7</a></li>
                                        <li><a href="#">8</a></li>
                                        <li><a href="#">Next</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>	
        </div>
        <!--footer section start-->		
        <footer>
            <div class="w3-agileits-footer-top">
                <div class="container">
                    <div class="wthree-foo-grids">
                        <div class="col-md-3 wthree-footer-grid">
                            <h4 class="footer-head">Who We Are</h4>
                            <p>We are Sri Lanka's online marketplace where you can advertise your products and services. </p>
                        </div>
                        <div class="col-md-3 wthree-footer-grid">
                            <h4 class="footer-head">Help</h4>
                            <ul>
                                <li><a href="howitworks.jsp"><i class="fa fa-long-arrow-right" aria-hidden="true"></i>How it Works</a></li>
                                <li><a href="help.jsp"><i class="fa fa-long-arrow-right" aria-hidden="true"></i>Faq</a></li>
                                <li><a href="feedback.jsp"><i class="fa fa-long-arrow-right" aria-hidden="true"></i>Feedback</a></li>
                                <li><a href="contact.jsp"><i class="fa fa-long-arrow-right" aria-hidden="true"></i>Contact</a></li>
                            </ul>
                        </div>
                        <div class="col-md-3 wthree-footer-grid">
                            <h4 class="footer-head">Information</h4>
                            <ul>
                                <li><a href="sitemap.jsp"><i class="fa fa-long-arrow-right" aria-hidden="true"></i>Sitemap</a></li>
                                <li><a href="regions.jsp"><i class="fa fa-long-arrow-right" aria-hidden="true"></i>Locations Map</a></li>	
                                <li><a href="terms.jsp"><i class="fa fa-long-arrow-right" aria-hidden="true"></i>Terms of Use</a></li>
                                <li><a href="privacy.jsp"><i class="fa fa-long-arrow-right" aria-hidden="true"></i>Privacy Policy</a></li>
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
                            <li><a class="linkedin" href="#"><i class="fa fa-linkedin" aria-hidden="true"></i><span>LinkedIn</span></a></li>
                            <li><a class="googleplus" href="#"><i class="fa fa-google-plus" aria-hidden="true"></i><span>Google+</span></a></li>
                        </ul>
                    </div>
                    <div class="copyrights">
                        <p> © Sell it. All Rights Reserved </p>
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


