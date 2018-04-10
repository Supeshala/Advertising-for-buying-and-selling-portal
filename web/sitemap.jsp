<%-- 
    Document   : sitemap
    Created on : Apr 9, 2018, 1:10:52 PM
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
    <title>Sitemap :: Sell it </title>
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
            <span class="agile-breadcrumbs"><a href="index.jsp"><i class="fa fa-home home_1"></i></a> / <span>Sitemap</span></span>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <!-- Regions -->
		<div class="container">
			<h2 class="w3-head">Sitemap</h2>
		</div>
		<div class="sitemap-regions">
			<div class="container">
				<div class="sitemap-region-grid">
					<div class="sitemap-region">
						<h4>Furniture</h4>
						<ul>
							<li><a href="furnitures.jsp">Sofa & Dining</a></li>
							<li><a href="furnitures.jsp">Other Household Items</a></li>
							<li><a href="furnitures.jsp">Beds & Wardrobes</a></li>
							<li><a href="furnitures.jspl">Home Decor & Garden</a></li>
							<li><a href="furnitures.jsp">Kitchen & Other Appliances</a></li>
							<li><a href="furnitures.jsp">Fridge - AC - Washing Machine</a></li>
							<li class="left-gap"><a href="furnitures.jsp">Fridges</a></li>
							<li class="left-gap"><a href="furnitures.jsp">AC</a></li>
							<li class="left-gap"><a href="furnitures.jsp">Washing Machine</a></li>
						</ul>
					</div>
					<div class="sitemap-region">
						<h4>Services</h4>
						<ul>
							<li><a href="services.jsp">Other Services</a></li>
							<li><a href="services.jsp">Education & Classes</a></li>
							<li class="left-gap"><a href="services.jsp">Tutoring</a></li>
							<li class="left-gap"><a href="services.jsp">Other</a></li>
							<li class="left-gap"><a href="services.jsp">Computer</a></li>
							<li class="left-gap"><a href="services.jsp">Language Classes</a></li>
							<li class="left-gap"><a href="services.jsp">Music & Dance</a></li>
							<li><a href="services.jsp">Drivers & Taxi</a></li>
							<li><a href="services.jsp">Web Development</a></li>
							<li><a href="services.jsp">Electronics & Computer Repair</a></li>
							<li class="left-gap"><a href="services.jsp">Computer</a></li>
							<li class="left-gap"><a href="services.jsp">Home Appliances</a></li>
							<li class="left-gap"><a href="services.jsp">Other Electronics</a></li>
							<li class="left-gap"><a href="services.jsp">Mobile</a></li>
							<li><a href="services.jsp">Health & Beauty</a></li>
							<li><a href="services.jsp">Event Services</a></li>
							<li><a href="services.jsp">Movers & Packers</a></li>
							<li><a href="services.jsp">Maids & Domestic Help</a></li>
						</ul>
					</div>
					<div class="sitemap-region">
						<h4>Real Estate</h4>
						<ul>
							<li><a href="real-estate.jsp">Land & Plots</a></li>
							<li class="left-gap"><a href="real-estate.jsp">Sale</a></li>
							<li class="left-gap"><a href="real-estate.jsp">Rent</a></li>
							<li><a href="real-estate.jsp">Apartments</a></li>
							<li class="left-gap"><a href="real-estate.jsp">Rent</a></li>
							<li class="left-gap"><a href="real-estate.jsp">Sale</a></li>
							<li><a href="real-estate.html">Houses</a></li>
							<li class="left-gap"><a href="real-estate.jsp">Rent</a></li>
							<li class="left-gap"><a href="real-estate.jsp">Sale</a></li>
							<li><a href="real-estate.jsp">Shops - Offices - Commercial Space</a></li>
							<li class="left-gap"><a href="real-estate.jsp">Lease</a></li>
							<li class="left-gap"><a href="real-estate.jsp">Sale</a></li>
							<li><a href="real-estate.jsp">PG & Roommates</a></li>
							<li><a href="real-estate.jsp">Vacation Rentals - Guest Houses</a></li>
						</ul>
					</div>
					<div class="sitemap-region">
						<h4>Bikes</h4>
						<ul>
							<li><a href="bikes.jsp">Motorcycles</a></li>
							<li><a href="bikes.jsp">Bajaj</a></li>
							<li><a href="bikes.jsp">Hero Honda</a></li>
							<li><a href="bikes.jsp">Yamaha</a></li>
							<li><a href="bikes.jsp">Royal Enfield</a></li>
							<li><a href="bikes.jsp">Honda</a></li>
							<li><a href="bikes.jsp">Hero</a></li>
							<li><a href="bikes.jsp">TVS</a></li>
							<li><a href="bikes.jsp">Suzuki</a></li>
							<li><a href="bikes.jsp">Other Brands</a></li>
							<li><a href="bikes.jsp">KTM</a></li>
							<li><a href="bikes.jsp">Mahindra</a></li>
							<li><a href="bikes.jsp">Kawasaki</a></li>
							<li><a href="bikes.jsp">Harley Davidson</a></li>
							<li><a href="bikes.jsp">Spare Parts</a></li>
							<li><a href="bikes.jsp">Scooters</a></li>
							<li><a href="bikes.jsp">Honda</a></li>
							<li><a href="bikes.jsp">TVS </a></li>
							<li><a href="bikes.jsp">Bajaj</a></li>
							<li><a href="bikes.jsp">Hero</a></li>
							<li><a href="bikes.jsp">Suzuki</a></li>
							<li><a href="bikes.jsp">Mahindra</a></li>
							<li><a href="bikes.jsp">LML</a></li>
							<li><a href="bikes.jsp">Kinetic</a></li>
							<li><a href="bikes.jsp">Other Brands</a></li>
							<li><a href="bikes.jsp">Yamaha</a></li>
							<li><a href="bikes.jsp">Vespa</a></li>
							<li><a href="bikes.jsp">Lambretta</a></li>
							<li><a href="bikes.jsp">Bicycles</a></li>
							<li><a href="bikes.jsp">Hero</a></li>
							<li><a href="bikes.jsp">Other Brands</a></li>
							<li><a href="bikes.jsp">Hercules</a></li>
							<li><a href="bikes.jsp">BSA</a></li>
							<li><a href="bikes.jsp">Atlas</a></li>
							<li><a href="bikes.jsp">Avon</a></li>
							<li><a href="bikes.jsp">Firefox</a></li>
							<li><a href="bikes.jsp">Trek</a></li>
						</ul>
					</div>
				</div>
				<div class="sitemap-region-grid">
					<div class="sitemap-region">
						<h4>Jobs</h4>
						<ul>
							<li><a href="jobs.jsp">Online</a></li>
							<li><a href="jobs.jsp">Other Jobs</a></li>
							<li><a href="jobs.jsp">Customer Service</a></li>
							<li><a href="jobs.jsp">IT</a></li>
							<li><a href="jobs.jsp">Marketing</a></li>
							<li><a href="jobs.jsp">Sales</a></li>
							<li><a href="jobs.jsp">Manufacturing</a></li>
							<li><a href="jobs.jsp">Clerical & Administration</a></li>
							<li><a href="jobs.jsp">Hotels & Tourism</a></li>
							<li><a href="jobs.jsp">Accounting & Finance</a></li>
							<li><a href="jobs.jsp">Advertising & PR</a></li>
							<li><a href="jobs.jsp">Human Resources</a></li>
							<li><a href="jobs.jsp">Education</a></li>
						</ul>
					</div>				
					<div class="sitemap-region">
						<h4>Cars</h4>
						<ul>
							<li><a href="cars.html">Cars</a></li>
							<li class="left-gap"><a href="cars.jsp">Maruti Suzuki</a></li>
							<li class="left-gap"><a href="cars.jsp">Hyundai</a></li>
							<li class="left-gap"><a href="cars.jsp">Tata</a></li>
							<li class="left-gap"><a href="cars.jsp">Mahindra</a></li>
							<li class="left-gap"><a href="cars.jsp">Honda</a></li>
							<li class="left-gap"><a href="cars.jsp">Ford</a></li>
							<li class="left-gap"><a href="cars.jsp">Toyota</a></li>
							<li class="left-gap"><a href="cars.jsp">Chevrolet</a></li>
							<li class="left-gap"><a href="cars.jsp">Skoda</a></li>
							<li class="left-gap"><a href="cars.jsp">Volkswagen</a></li>
							<li class="left-gap"><a href="cars.jsp">Fiat</a></li>
							<li class="left-gap"><a href="cars.jsp">Mitsubishi</a></li>
							<li class="left-gap"><a href="cars.jsp">Other Brands</a></li>
							<li class="left-gap"><a href="cars.jsp">Mercedes-Benz</a></li>
							<li class="left-gap"><a href="cars.jsp">Nissan</a></li>
							<li class="left-gap"><a href="cars.jsp">BMW</a></li>
							<li class="left-gap"><a href="cars.jsp">Renault</a></li>
							<li class="left-gap"><a href="cars.jsp">Hindustan Motors</a></li>
							<li class="left-gap"><a href="cars.jsp">Audi</a></li>
							<li class="left-gap"><a href="cars.jsp">Mahindra Renault</a></li>
							<li class="left-gap"><a href="cars.jsp">Opel</a></li>
							<li class="left-gap"><a href="cars.jsp">Daewoo</a></li>
							<li class="left-gap"><a href="cars.jsp">Force Motors</a></li>
							<li class="left-gap"><a href="cars.jsp">Landrover</a></li>
							<li class="left-gap"><a href="cars.jsp">Premier</a></li>
							<li class="left-gap"><a href="cars.jsp">Jaguar</a></li>
							<li class="left-gap"><a href="cars.jsp">Volvo</a></li>
							<li class="left-gap"><a href="cars.jsp">Isuzu</a></li>
							<li class="left-gap"><a href="cars.jsp">Mini</a></li>
							<li class="left-gap"><a href="cars.jsp">Porsche</a></li>
							<li class="left-gap"><a href="cars.jsp">Ssangyong</a></li>
							<li class="left-gap"><a href="cars.jsp">Mahindra Reva</a></li>
							<li class="left-gap"><a href="cars.jsp">Rolls Royce</a></li>
							<li class="left-gap"><a href="cars.jsp">Bentley</a></li>
							<li class="left-gap"><a href="cars.jsp">Ferrari</a></li>
							<li class="left-gap"><a href="cars.jsp">Lamborghini </a></li>
							<li><a href="cars.jsp">Spare Parts</a></li>
							<li class="left-gap"><a href="cars.jsp">Car Parts</a></li>
							<li class="left-gap"><a href="cars.jsp">Other Parts</a></li>
							<li class="left-gap"><a href="cars.jsp">Spare Parts</a></li>
							<li><a href="cars.jsp">Commercial Vehicles</a></li>
							<li><a href="cars.jsp">Other Vehicles</a></li>
							
						</ul>
					</div>
					<div class="sitemap-region">
						<h4>Pets</h4>
						<ul>
							<li><a href="pets.jsp">Dogs</a></li>
							<li class="left-gap"><a href="pets.jsp">Other Breeds</a></li>
							<li class="left-gap"><a href="pets.jsp">Labrador</a></li>
							<li class="left-gap"><a href="pets.jsp">German Shepherd</a></li>
							<li class="left-gap"><a href="pets.jsp">Rottweiler</a></li>
							<li class="left-gap"><a href="pets.jsp">Pug</a></li>
							<li class="left-gap"><a href="pets.jsp">Mastiff</a></li>
							<li class="left-gap"><a href="pets.jsp">Saint Bernard</a></li>
							<li class="left-gap"><a href="pets.jsp">Golden Retriever</a></li>
							<li class="left-gap"><a href="pets.jsp">Beagle</a></li>
							<li class="left-gap"><a href="pets.jsp">Pomeranian</a></li>
							<li class="left-gap"><a href="pets.jsp">Doberman</a></li>
							<li class="left-gap"><a href="pets.jsp">Husky</a></li>
							<li class="left-gap"><a href="pets.jsp">Cocker Spaniel</a></li>
							<li class="left-gap"><a href="pets.jsp">Boxer</a></li>
							<li class="left-gap"><a href="pets.jsp">Bulldog</a></li>
							<li class="left-gap"><a href="pets.jsp">Dalmatian</a></li>
							<li><a href="pets.jsp">Other Pets</a></li>
							<li><a href="pets.jsp">Aquariums</a></li>
							<li><a href="pets.jsp">Pet Food & Accessories</a></li>
						</ul>
					</div>
				</div>
				<div class="sitemap-region-grid">
					<div class="sitemap-region">					
						<h4>Mobiles</h4>
						<ul>
							<li><a href="mobiles.jsp">Mobile Phones</a></li>
							<li class="left-gap"><a href="mobiles.jsp">Samsung</a></li>
							<li class="left-gap"><a href="mobiles.jsp">Nokia</a></li>
							<li class="left-gap"><a href="mobiles.jsp">Other Mobiles</a></li>
							<li class="left-gap"><a href="mobiles.jsp">Micromax</a></li>
							<li class="left-gap"><a href="mobiles.jsp">iPhone</a></li>
							<li class="left-gap"><a href="mobiles.jsp">Sony</a></li>
							<li class="left-gap"><a href="mobiles.jsp">HTC</a></li>
							<li class="left-gap"><a href="mobiles.jsp">Lenovo</a></li>
							<li class="left-gap"><a href="mobiles.jsp">Intex</a></li>
							<li class="left-gap"><a href="mobiles.jsp">Motorola</a></li>
							<li class="left-gap"><a href="mobiles.jsp">Lava</a></li>
							<li class="left-gap"><a href="mobiles.jsp">LG</a></li>
							<li class="left-gap"><a href="mobiles.jsp">Mi</a></li>
							<li class="left-gap"><a href="mobiles.jsp">BlackBerry</a></li>
							<li class="left-gap"><a href="mobiles.jsp">Karbonn</a></li>
							<li class="left-gap"><a href="mobiles.jsp">Asus</a></li>
							<li><a href="mobiles.jsp">Accessories</a></li>
							<li class="left-gap"><a href="mobiles.jsp">Mobile</a></li>
							<li class="left-gap"><a href="mobiles.jsp">Tablets</a></li>
							<li><a href="mobiles.jsp">Tablets</a></li>
							<li class="left-gap"><a href="mobiles.jsp">Samsung</a></li>
							<li class="left-gap"><a href="mobiles.jsp">Other Tablets</a></li>
							<li class="left-gap"><a href="mobiles.jsp">iPads</a></li>
							<li class="left-gap"><a href="mobiles.jsp">iBall</a></li>
							<li class="left-gap"><a href="mobiles.jsp">Micromax</a></li>
							<li class="left-gap"><a href="mobiles.jsp">Lenovo</a></li>
							<li class="left-gap"><a href="mobiles.jsp">Asus</a></li>
							<li class="left-gap"><a href="mobiles.jsp">HP</a></li>
							<li class="left-gap"><a href="mobiles.jsp">Dell</a></li>
							<li class="left-gap"><a href="mobiles.jsp">HCL</a></li>
							<li class="left-gap"><a href="mobiles.jsp">Acer</a></li>
							<li class="left-gap"><a href="mobiles.jsp">Blackberry</a></li>
							<li class="left-gap"><a href="mobiles.jsp">Sony</a></li>
						</ul>
					</div>
					<div class="sitemap-region">					
						<h4>Kids</h4>
						<ul>
							<li><a href="kids.jsp">Furniture And Toys</a></li>
							<li><a href="kids.jsp">Accessories</a></li>
							<li><a href="kids.jsp">Prams & Walkers</a></li>
						</ul>
					</div>
					<div class="sitemap-region">
						<h4>Fashion</h4>
						<ul>
							<li><a href="fashion.jsp">Accessories</a></li>
							<li class="left-gap"><a href="fashion.jsp">Women</a></li>
							<li class="left-gap"><a href="fashion.jsp">Men</a></li>
							<li><a href="fashion.jsp">Clothes</a></li>
							<li class="left-gap"><a href="fashion.jsp">Women</a></li>
							<li class="left-gap"><a href="fashion.jsp">Men</a></li>
							<li><a href="fashion.jsp">Footwear</a></li>
							<li class="left-gap"><a href="fashion.jsp">Men</a></li>
							<li class="left-gap"><a href="fashion.jsp">Women</a></li>
						</ul>
					</div>
					<div class="sitemap-region">
						<h4>Electronics & Appliances</h4>
						<ul>
							<li><a href="electronics-appliances.jsp">Computers & Accessories</a></li>
							<li class="left-gap"><a href="electronics-appliances.jsp">Laptops</a></li>
							<li class="left-gap"><a href="electronics-appliances.jsp">Computers</a></li>
							<li class="left-gap"><a href="electronics-appliances.jsp">Other Accessories</a></li>
							<li class="left-gap"><a href="electronics-appliances.jsp">Internet</a></li>
							<li class="left-gap"><a href="electronics-appliances.jsp">Printers</a></li>
							<li class="left-gap"><a href="electronics-appliances.jsp">Monitors</a></li>
							<li class="left-gap"><a href="electronics-appliances.jsp">Hard Disk</a></li>
							<li><a href="electronics-appliances.jsp">Kitchen & Other Appliances</a></li>
							<li><a href="electronics-appliances.jsp">TV - Video - Audio</a></li>
							<li class="left-gap"><a href="electronics-appliances.jsp">Video - Audio</a></li>
							<li class="left-gap"><a href="electronics-appliances.jsp">TV</a></li>
							<li><a href="electronics-appliances.jsp">Cameras & Accessories</a></li>
							<li class="left-gap"><a href="electronics-appliances.jsp">Cameras</a></li>
							<li class="left-gap"><a href="electronics-appliances.jsp">Other Accessories</a></li>
							<li class="left-gap"><a href="electronics-appliances.jsp">Lenses</a></li>
							<li><a href="electronics-appliances.jsp">Games & Entertainment</a></li>
							<li><a href="electronics-appliances.jsp">Fridge - AC - Washing Machine</a></li>
							<li class="left-gap"><a href="electronics-appliances.jsp">Fridges</a></li>
							<li class="left-gap"><a href="electronics-appliances.jsp">Washing Machine</a></li>
							<li class="left-gap"><a href="electronics-appliances.jsp">AC</a></li>
						</ul>
					</div>
					<div class="sitemap-region">
						<h4>Books, Sports & Hobbies</h4>
						<ul>
							<li><a href="books-sports-hobbies.jsp">Gym & Fitness</a></li>
							<li><a href="books-sports-hobbies.jsp">Other Hobbies</a></li>
							<li><a href="books-sports-hobbies.jsp">Musical Instruments</a></li>
							<li><a href="books-sports-hobbies.jsp">Books & Magazines</a></li>
							<li class="left-gap"><a href="books-sports-hobbies.jsp">Education & Training</a></li>
							<li class="left-gap"><a href="books-sports-hobbies.jsp">Competitive Exam</a></li>
							<li class="left-gap"><a href="books-sports-hobbies.jsp">Literature & Fiction</a></li>
							<li class="left-gap"><a href="books-sports-hobbies.jsp">Professional & Technical</a></li>
							<li class="left-gap"><a href="books-sports-hobbies.jsp">Other Books</a></li>
							<li class="left-gap"><a href="books-sports-hobbies.jsp">School Books</a></li>
							<li class="left-gap"><a href="books-sports-hobbies.jsp">Children</a></li>
							<li><a href="books-sports-hobbies.jsp">Sports Equipment</a></li>
						</ul>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	<!-- //Regions -->
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
