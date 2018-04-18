<%-- 
    Document   : editAd
    Created on : Apr 11, 2018, 7:21:41 PM
    Author     : HP
--%>

<%@page import="POJOS.Ad"%>
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
    <title>Edit Ad :: Sellit  </title>
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
                    <% Criteria cr = ses.createCriteria(User.class).add(Restrictions.eq("email", request.getSession().getAttribute("User_Email").toString()));
                        User us = (User) cr.uniqueResult();%>
                    <li class="dropdown head-dpdn">
                        <a href="help.jsp"><i class="fa fa-question-circle" aria-hidden="true"></i> Help</a>
                    </li>
                    <li class="dropdown head-dpdn">
                        <a href="#"><span class="active uls-trigger"><i class="fa fa-language" aria-hidden="true"></i>languages</span></a>
                    </li>
                    <%                            if (request.getSession().getAttribute("User_Email") != null) {
                    %>


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
            <span class="agile-breadcrumbs"><a href="index.jsp"><i class="fa fa-home home_1"></i></a> / <a href="profile.jsp"><i class="fa fa-user user"></i></a> /<span> Edit your Ad</span></span>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <%        if (request.getParameter("adId") != null) {

            POJOS.Ad a = (POJOS.Ad) ses.load(POJOS.Ad.class, Integer.parseInt(request.getParameter("adId")));

    %>
    <div class="container">
        <h2 class="w3-head">Post an Ad</h2>
        <div class="post-ad-form">
            <form action="AdDetails_Update" method="post">

                <input type="hidden" name="adId" value="<%=a.getIdad()%>">
                <div class="clearfix"></div>
                <label>Select Category</label>
                <select name="category">
                    <option selected=""><%=a.getCategory()%></option>
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
                <label>Ad Title </label>
                <input type="text" name="title" value="<%=a.getTitle()%>">
                <div class="clearfix"></div>
                <label>Ad Description </label>
                <textarea  name="description"><%=a.getDescription()%></textarea>
                <div class="clearfix"></div>

                <div class="sell-details">

                    <label>Price </label>
                    <input type="text"  name="price" value="<%=a.getPrice()%>">
                    <div class="clearfix"></div>
                    <label>Brand </label>
                    <input type="text"  name="brand" value="<%=a.getBrand()%>" >
                    <div class="clearfix"></div>
                    <label>Select Location </label>
                    <select name="location">
                        <option selected=""><%=a.getLocation()%></option>

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
<!--                <div class="upload-ad-photos">
                    <label>Photos for your ad :</label>	
                    <div class="photos-upload-view">

                        <img id="output" style="width: 250px; height: 250px; " src="<%=a.getImage()%>"/>
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
                </div>-->
                <div class="modal-footer">
                    <button  type="submit" class="btn btn-danger" name="personal_update" value="Update">Update</button>
                    <a href="profile.jsp#parentVerticalTab2"><button type="button" class="btn btn-danger">Close</button></a>
                </div>
            </form>
        </div>
    </div>
        <%
            }
        %>  
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
