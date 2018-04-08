<%-- 
    Document   : profile
    Created on : Jan 28, 2018, 6:00:14 PM
    Author     : HP
--%>

<%@ page import="org.hibernate.criterion.Restrictions" %>
<%@ page import="POJOS.User" %>
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
        <%
            if (request.getParameter("adId") != null) {

                POJOS.Ad ad = (POJOS.Ad) ses.load(POJOS.Ad.class, Integer.parseInt(request.getParameter("adId")));

        %>


        <!-- breadcrumbs -->

        <div class="w3layouts-breadcrumbs text-center">
            <div class="container">
                <span class="agile-breadcrumbs">
                    <a href="index.html"><i class="fa fa-home home_1"></i></a> / 
                    <a href="all-classifieds.jsp">All Ads</a> / 
                    <a href="cars.html"><%=ad.getCategory()%></a> / 
                    <span><%=ad.getBrand()%></span></span>
            </div>
        </div>
        <!-- //breadcrumbs -->
        <!--single-page-->
        <div class="single-page main-grid-border">
            <div class="container">
                <div class="product-desc">
                    <div class="col-md-7 product-view">
                        <h2><%=ad.getTitle()%></h2>
                        <p> <i class="glyphicon glyphicon-map-marker"></i><a href="#"><%=ad.getLocation()%></a>| Added at <%=ad.getDate()%> , Ad ID: <%=ad.getIdad()%></p>
                        <div class="flexslider">
                            <img src="<%=ad.getImage()%>" alt="">
                        </div>

                        <div class="product-details">
                            <h4><span class="w3layouts-agileinfo"> Brand </span> : <%=ad.getBrand()%> </h4>
                            <h4><span class="w3layouts-agileinfo">Price</span> : Rs.<%=ad.getPrice()%></h4>
                            <h4><span class="w3layouts-agileinfo">Summary</span> :<p> <%=ad.getDescription()%> </p>

                        </div>
                    </div>
                    <div class="col-md-5 product-details-grid">
                        <div class="item-price">
                            <div class="itemtype">
                                <p class="p-price"></p>
                                <h4><%=ad.getCategory()%></h4>
                                <div class="clearfix"></div>
                            </div>
                            <div class="product-price">
                                <p class="p-price">Location</p>
                                <h3 class="rate"><%=ad.getLocation()%> </h3>
                                <div class="clearfix"></div>
                            </div>
                            <div class="condition">
                                <p class="p-price">Condition</p>
                                <h4>Good</h4>
                                <div class="clearfix"></div>
                            </div>

                        </div>
                        <div class="interested text-center">
                            <h4>Interested in this Ad?<small> Contact the Seller!</small></h4>
                            <p><i class="glyphicon glyphicon-user"></i><%=ad.getUser().getName()%></p>
                            <p><i class="glyphicon glyphicon-earphone"></i><%=ad.getUser().getMobile()%></p>
                            <p><i class="glyphicon glyphicon-envelope"></i><%=ad.getUser().getEmail()%></p>
                        </div>

                        <!--                        <div class="tips">
                                                    <h4>Safety Tips for Buyers</h4>
                                                    <ol>
                                                        <li><a href="#">Contrary to popular belief.</a></li>
                                                        <li><a href="#">Contrary to popular belief.</a></li>
                                                        <li><a href="#">Contrary to popular belief.</a></li>
                                                        <li><a href="#">Contrary to popular belief.</a></li>
                                                        <li><a href="#">Contrary to popular belief.</a></li>
                                                        <li><a href="#">Contrary to popular belief.</a></li>
                                                        <li><a href="#">Contrary to popular belief.</a></li>
                                                        <li><a href="#">Contrary to popular belief.</a></li>
                                                        <li><a href="#">Contrary to popular belief.</a></li>
                                                    </ol>
                                                </div>-->
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <%
            }
        %>  
        <!--//single-page-->
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
                                    <li><a href="mailto:binukagamage@gmail.com">binukagamage@gmail.com</a></li>
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
        <!-- Navigation-Js-->
        <script type="text/javascript" src="js/main.js"></script>
        <script type="text/javascript" src="js/classie.js"></script>
        <!-- //Navigation-Js-->
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
        <script type="text/javascript" src="js/jquery.flexisel.js"></script><!-- flexisel-js -->	
        <script type="text/javascript">
            $(window).load(function () {
                $("#flexiselDemo3").flexisel({
                    visibleItems: 1,
                    animationSpeed: 1000,
                    autoPlay: true,
                    autoPlaySpeed: 5000,
                    pauseOnHover: true,
                    enableResponsiveBreakpoints: true,
                    responsiveBreakpoints: {
                        portrait: {
                            changePoint: 480,
                            visibleItems: 1
                        },
                        landscape: {
                            changePoint: 640,
                            visibleItems: 1
                        },
                        tablet: {
                            changePoint: 768,
                            visibleItems: 1
                        }
                    }
                });

            });
        </script>
        <!-- Slider-JavaScript -->
        <script src="js/responsiveslides.min.js"></script>	
        <script>
            $(function () {
                $("#slider").responsiveSlides({
                    auto: true,
                    pager: false,
                    nav: true,
                    speed: 500,
                    maxwidth: 800,
                    namespace: "large-btns"
                });

            });
        </script>
        <!-- //Slider-JavaScript -->
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

