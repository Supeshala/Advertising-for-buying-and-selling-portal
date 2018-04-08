<%-- 
    Document   : categories
    Created on : Feb 17, 2018, 10:08:09 PM
    Author     : HP
--%>

<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="POJOS.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    Session ses = DB.Connection.getSessionFactory().openSession();

%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sell it </title>
    <link rel="stylesheet" href="css/bootstrap.min.css"><!-- bootstrap-CSS -->
    <link rel="stylesheet" href="css/bootstrap-select.css"><!-- bootstrap-select-CSS -->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" /><!-- style.css -->
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
    <!-- responsive tabs -->
    <link rel="stylesheet" type="text/css" href="css/easy-responsive-tabs.css " />
    <script src="js/easyResponsiveTabs.js"></script>
    <!-- /responsive tabs -->
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
                    <%     if (request.getSession().getAttribute("User_Email") != null) {
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
            <span class="agile-breadcrumbs"><a href="index.jsp"><i class="fa fa-home home_1"></i></a> / <span>Categories</span></span>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <!-- Categories -->
    <!--Vertical Tab-->
    <div class="categories-section main-grid-border">
        <div class="container">
            <h2 class="w3-head">All Categories</h2>
            <div class="category-list">
                <div id="parentVerticalTab">
                    <div class="agileits-tab_nav">
                        <ul class="resp-tabs-list hor_1">
                            <li>Mobiles</li>
                            <li>Electronics & Appliances</li>
                            <li>Cars</li>
                            <li>Bikes</li>
                            <li>Furniture</li>
                            <li>Pets</li>
                            <li>Books, Sports & Hobbies</li>
                            <li>Fashion</li>
                            <li>Kids</li>
                            <li>Services</li>
                            <li>Jobs</li>
                            <li>Real Estate</li>
                        </ul>
                        <a class="w3ls-ads" href="all-classifieds.jsp">View all Ads</a>
                    </div>
                    <div class="resp-tabs-container hor_1">
                        <!--<span class="active total" style="display:block;" data-toggle="modal" data-target="#myModal"><strong>All USA</strong> (Select your city to see local ads)</span>-->
                        <div>
                            <div class="category">
                                <div class="category-img">
                                    <img src="images/cat1.png" title="image" alt="" />
                                </div>
                                <div class="category-info">
                                    <h4>Mobiles</h4>
                                    <span>5,12,850 Ads</span>
                                    <a href="mobiles.jsp">View Ads</a>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="sub-categories">
                                <ul>
                                    <li><a href="mobiles.jsp">mobile phones</a></li>
                                    <li><a href="mobiles.jsp">Tablets</a></li>
                                    <li><a href="mobiles.jsp">Accessories</a></li>
                                </ul>
                            </div>
                        </div>
                        <div>
                            <div class="category">
                                <div class="category-img">
                                    <img src="images/cat2.png" title="image" alt="" />
                                </div>
                                <div class="category-info">
                                    <h4>Electronics & Appliances</h4>
                                    <span>2,01,850 Ads</span>
                                    <a href="electronics-appliances.jsp">View Ads</a>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="sub-categories">
                                <ul>
                                    <li><a href="electronics-appliances.jsp">Computers & accessories</a></li>
                                    <li><a href="electronics-appliances.jsp">Tv - video - audio</a></li>
                                    <li><a href="electronics-appliances.jsp">Cameras & accessories</a></li>
                                    <li><a href="electronics-appliances.jsp">Games & Entertainment</a></li>
                                    <li><a href="electronics-appliances.jsp">Fridge - AC - Washing Machine</a></li>
                                    <li><a href="electronics-appliances.jsp">Kitchen & Other Appliances</a></li>
                                </ul>
                            </div>
                        </div>
                        <div>
                            <div class="category">
                                <div class="category-img">
                                    <img src="images/cat3.png" title="image" alt="" />
                                </div>
                                <div class="category-info">
                                    <h4>Cars</h4>
                                    <span>1,98,080 Ads</span>
                                    <a href="cars.jsp">View Ads</a>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="sub-categories">
                                <ul>
                                    <li><a href="cars.jsp">Commercial Vehicles</a></li>
                                    <li><a href="cars.jsp">Other Vehicles</a></li>
                                    <li><a href="cars.jsp">Spare Parts</a></li>
                                </ul>
                            </div>
                        </div>
                        <div>
                            <div class="category">
                                <div class="category-img">
                                    <img src="images/cat4.png" title="image" alt="" />
                                </div>
                                <div class="category-info">
                                    <h4>Bikes</h4>
                                    <span>6,17,568 Ads</span>
                                    <a href="bikes.jsp">View Ads</a>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="sub-categories">
                                <ul>
                                    <li><a href="bikes.jsp">Motorcycles</a></li>
                                    <li><a href="bikes.jsp">Scooters</a></li>
                                    <li><a href="bikes.jsp">Bicycles</a></li>
                                    <li><a href="bikes.jsp">Spare Parts</a></li>
                                </ul>
                            </div>
                        </div>
                        <div>
                            <div class="category">
                                <div class="category-img">
                                    <img src="images/cat5.png" title="image" alt="" />
                                </div>
                                <div class="category-info">
                                    <h4>Furniture</h4>
                                    <span>1,05,168 Ads</span>
                                    <a href="furnitures.jsp">View Ads</a>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="sub-categories">
                                <ul>
                                    <li><a href="furnitures.jsp">Sofa & Dining</a></li>
                                    <li><a href="furnitures.jsp">Beds & Wardrobes</a></li>
                                    <li><a href="furnitures.jsp">Home Decor & Garden</a></li>
                                    <li><a href="furnitures.jsp">Other Household Items</a></li>
                                </ul>
                            </div>
                        </div>
                        <div>
                            <div class="category">
                                <div class="category-img">
                                    <img src="images/cat6.png" title="image" alt="" />
                                </div>
                                <div class="category-info">
                                    <h4>Pets</h4>
                                    <span>1,77,816 Ads</span>
                                    <a href="pets.jsp">View Ads</a>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="sub-categories">
                                <ul>
                                    <li><a href="pets.jsp">Dogs</a></li>
                                    <li><a href="pets.jsp">Aquariums</a></li>
                                    <li><a href="pets.jsp">Pet Food & Accessories</a></li>
                                    <li><a href="pets.jsp">Other Pets</a></li>
                                </ul>
                            </div>
                        </div>
                        <div>
                            <div class="category">
                                <div class="category-img">
                                    <img src="images/cat7.png" title="image" alt="" />
                                </div>
                                <div class="category-info">
                                    <h4>Books, Sports & Hobbies</h4>
                                    <span>9,58,458 Ads</span>
                                    <a href="books-sports-hobbies.jsp">View Ads</a>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="sub-categories">
                                <ul>
                                    <li><a href="books-sports-hobbies.jsp">Books & Magazines</a></li>
                                    <li><a href="books-sports-hobbies.jsp">Musical Instruments</a></li>
                                    <li><a href="books-sports-hobbies.jsp">Sports Equipment</a></li>
                                    <li><a href="books-sports-hobbies.jsp">Gym & Fitness</a></li>
                                    <li><a href="books-sports-hobbies.jsp">Other Hobbies</a></li>
                                </ul>
                            </div>
                        </div>
                        <div>
                            <div class="category">
                                <div class="category-img">
                                    <img src="images/cat8.png" title="image" alt="" />
                                </div>
                                <div class="category-info">
                                    <h4>Fashion</h4>
                                    <span>3,52,345 Ads</span>
                                    <a href="fashion.jsp">View Ads</a>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="sub-categories">
                                <ul>
                                    <li><a href="fashion.jsp">Clothes</a></li>
                                    <li><a href="fashion.jsp">Footwear</a></li>
                                    <li><a href="fashion.jsp">Accessories</a></li>
                                </ul>
                            </div>
                        </div>
                        <div>
                            <div class="category">
                                <div class="category-img">
                                    <img src="images/cat9.png" title="image" alt="" />
                                </div>
                                <div class="category-info">
                                    <h4>Kids</h4>
                                    <span>8,45,298 Ads</span>
                                    <a href="kids.jsp">View Ads</a>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="sub-categories">
                                <ul>
                                    <li><a href="kids.jsp">Furniture And Toys</a></li>
                                    <li><a href="kids.jsp">Prams & Walkers</a></li>
                                    <li><a href="kids.jsp">Accessories</a></li>
                                </ul>
                            </div>
                        </div>
                        <div>
                            <div class="category">
                                <div class="category-img">
                                    <img src="images/cat10.png" title="image" alt="" />
                                </div>
                                <div class="category-info">
                                    <h4>Services</h4>
                                    <span>7,58,867 Ads</span>
                                    <a href="services.jsp">View Ads</a>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="sub-categories">
                                <ul>
                                    <li><a href="services.jsp">Education & Classes</a></li>
                                    <li><a href="services.jsp">Web Development</a></li>
                                    <li><a href="services.jsp">Electronics & Computer Repair</a></li>
                                    <li><a href="services.jsp">Maids & Domestic Help</a></li>
                                    <li><a href="services.jsp">Health & Beauty</a></li>
                                    <li><a href="services.jsp">Movers & Packers</a></li>
                                    <li><a href="services.jsp">Drivers & Taxi</a></li>
                                    <li><a href="services.jsp">Event Services</a></li>
                                    <li><a href="services.jsp">Other Services</a></li>
                                </ul>
                            </div>
                        </div>
                        <div>
                            <div class="category">
                                <div class="category-img">
                                    <img src="images/cat11.png" title="image" alt="" />
                                </div>
                                <div class="category-info">
                                    <h4>Jobs</h4>
                                    <span>5,74,547 Ads</span>
                                    <a href="jobs.jsp">View Ads</a>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="sub-categories">
                                <ul>
                                    <li><a href="jobs.jsp">Customer Service</a></li>
                                    <li><a href="jobs.jsp">IT</a></li>
                                    <li><a href="jobs.jsp">Online</a></li>
                                    <li><a href="jobs.jsp">Marketing</a></li>
                                    <li><a href="jobs.jsp">Advertising & PR</a></li>
                                    <li><a href="jobs.jsp">Sales</a></li>
                                    <li><a href="jobs.jsp">Clerical & Administration</a></li>
                                    <li><a href="jobs.jsp">Human Resources</a></li>
                                    <li><a href="jobs.jsp">Education</a></li>
                                    <li><a href="jobs.jsp">Hotels & Tourism</a></li>
                                    <li><a href="jobs.jsp">Accounting & Finance</a></li>
                                    <li><a href="jobs.jsp">Manufacturing</a></li>
                                    <li><a href="jobs.jsp">Part - Time</a></li>
                                    <li><a href="jobs.jsp">Other Jobs</a></li>
                                </ul>
                            </div>
                        </div>
                        <div>
                            <div class="category">
                                <div class="category-img">
                                    <img src="images/cat12.png" title="image" alt="" />
                                </div>
                                <div class="category-info">
                                    <h4>Real Estate</h4>
                                    <span>98,156 Ads</span>
                                    <a href="real-estate.jsp">View Ads</a>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="sub-categories">
                                <ul>
                                    <li><a href="real-estate.jsp">Houses</a></li>
                                    <li><a href="real-estate.jsp">Apartments</a></li>
                                    <li><a href="real-estate.jsp">PG & Roommates</a></li>
                                    <li><a href="real-estate.jsp">Land & Plots</a></li>
                                    <li><a href="real-estate.jsp">Shops - Offices - Commercial Space</a></li>
                                    <li><a href="real-estate.jsp">Vacation Rentals - Guest Houses</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
    <!--Plug-in Initialisation-->
    <script type="text/javascript">
$(document).ready(function () {

    //Vertical Tab
    $('#parentVerticalTab').easyResponsiveTabs({
        type: 'vertical', //Types: default, vertical, accordion
        width: 'auto', //auto or any width like 600px
        fit: true, // 100% fit in a container
        closed: 'accordion', // Start closed if in accordion view
        tabidentify: 'hor_1', // The tab groups identifier
        activate: function (event) { // Callback function if tab is switched
            var $tab = $(this);
            var $info = $('#nested-tabInfo2');
            var $name = $('span', $info);
            $name.text($tab.text());
            $info.show();
        }
    });
});
    </script>
    <!-- //Categories -->
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
