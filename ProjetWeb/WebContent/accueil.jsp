<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->

<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <title>Yoann & Theo </title>
    <!--REQUIRED STYLE SHEETS-->
    <!-- BOOTSTRAP CORE STYLE CSS -->
    <link href="css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLE CSS -->
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <!--ANIMATED FONTAWESOME STYLE CSS -->
    <link href="css/font-awesome-animation.css" rel="stylesheet" />
    <!-- VEGAS STYLE CSS -->
    <link href="scripts/vegas/jquery.vegas.min.css" rel="stylesheet" />
    <!-- SIDE MENU STYLE CSS -->
    <link href="css/component.css" rel="stylesheet" />
    <!-- CUSTOM STYLE CSS -->
    <link href="css/style.css" rel="stylesheet" />
    <!-- GOOGLE FONT -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body class="cbp-spmenu-push">

    <!-- ENTETE ACCUEIL-->
    <div class="for-full-back color-bg-one" id="main-sec">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-8 col-md-offset-2 ">
                    <h1 class="pad-adjust"></i>Partage.CCI</h1>
                   <!-- // le + animÃ© <i class="fa fa-plus faa-pulse animated"> --> 
                </div>
            </div>
        </div>
    </div>
    <!--END MAIN HEADING-->
    <!--LEFT SLIDE MENU-->
    <nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s1">
        <h3>Menu</h3>
        <a href="#about-sec"><i class="fa fa-microphone fa-3x"></i>VIDEO</a>
        <a href="#price-sec"><i class="fa fa-dollar fa-3x"></i>PHOTOS</a>
        <a href="#services-sec"><i class="fa fa-rocket fa-3x"></i>MUSIQUES</a>
        <a href="#contact-sec"><i class="fa fa-globe fa-3x"></i>CONTACT</a>
    </nav>

    <div class="row" id="icon-left">
        <div class="col-md-12">
            <i id="showLeftPush" class="fa fa-cut fa-4x faa-horizontal animated "></i>
        </div>
    </div>
    <!--END LEFT SLIDE MENU-->

    <!--RIGHT SLIDE MENU-->
    <nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right" id="cbp-spmenu-s2">
        <!-- <h3>SOCIAL</h3>
        <a href="#">MY SOCIAL PRESENCE</a>
        <a href="#"><i class="fa fa-facebook fa-3x"></i>Facebook</a>
        <a href="#"><i class="fa fa-twitter fa-3x"></i>Twitter</a>
        <a href="#"><i class="fa fa-linkedin fa-3x"></i>Linked In</a>
        <a href="#"><i class="fa fa-google-plus fa-3x"></i>Google Plus</a>-->
    </nav>

    <div class="row" id="icon-right">
        <div class="col-md-12">
            <i id="showRightPush" class="fa fa-paperclip fa-4x "></i>
        </div>
    </div>
    <!--END RIGHT SLIDE MENU-->

    <!--HOME SECTION-->
    <form action="connect" method="post" > <!-- Appelle la servlet  -->
    <div class="container" id="home">
        <div class="row text-center">
            <div class="col-md-12">
                <span class="head-main">ZONE Y&T</span>
                <h2 class="head-sub-main">Ma Mini librairie Web</h2>
                <!--<h3 class="head-last">Lorem ipsum dolor sit ametLorem ipsum dolor sit amet</h3>-->
                <input type="text" class= "form-control2"  name="pseudo" value="Login" size="16" /><br><br>
                <input type="password" class="form-control2" name="pass" value="" size="16" /><br><br>
                <input type="submit" class="btn btn-danger btn-lg head-btn-one" name="post" value="Connexion"/>
             <!--   <a href="#about-sec" class="btn btn-danger btn-lg head-btn-one">Se connecter</a> &nbsp;  
                <a href="#about-sec" class="btn btn-primary btn-lg">MODEL THEME</a>-->
            </div>
        </div>
    </div>
    <!--END HOME SECTION-->

    <!--ABOUT SECTION
    <section class="for-full-back color-bg-one" id="about-sec">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-8 col-md-offset-2 ">
                    <h1><i class="fa fa-microphone faa-pulse animated  "></i>About</h1>
                </div>
                <div class="row text-center">
                    <div class="col-md-8 col-md-offset-2 ">
                        <h4>
                            <strong>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                            </strong>
                        </h4>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="for-full-back color-white" id="about-team">
        <div class="container">
            <div class="row text-center g-pad-bottom">
                <div class="col-md-8 col-md-offset-2 ">
                    <h3>OUR TEAM PROFILE</h3>
                    <h4>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.                          
                    </h4>
                </div>

            </div>
            <div class="row text-center g-pad-bottom">
                <div class="col-md-12 ">
                    <div class="col-md-3 col-sm-3 col-xs-6">
                        <div class="team-member">
                            <img src="image/team/1.png" alt="">
                            <h3><strong>ANDREWA ALEX </strong></h3>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-6">
                        <div class="team-member">
                            <img src="image/team/2.png" alt="">
                            <h3><strong>ROMILIA JHON </strong></h3>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-6">
                        <div class="team-member">
                            <img src="image/team/3.png" alt="">
                            <h3><strong>TINA WAY LEU </strong></h3>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-6">
                        <div class="team-member">
                            <img src="image/team/4.png" alt="">
                            <h3><strong>JHON DEO ALEX </strong></h3>
                        </div>
                    </div>





                </div>
            </div>
            <div class="row g-pad-bottom">
                <div class="col-md-6">
                    <h3>Lorem ipsum  dolor sit amet</h3>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                           Lorem ipsum dolor sit amet, consectetur nec nisl odio
                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                    </p>
                </div>
                <div class="col-md-6">
                    <h3>Lorem ipsum  dolor sit amet</h3>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                           Lorem ipsum dolor sit amet, consectetur nec nisl odio
                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                    </p>
                </div>
            </div>

        </div>
    </section>-->
    <!--END ABOUT SECTION-->

    <!--PRICE SECTION
    <section id="price-sec">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-12 ">
                    <div class="col-md-3">
                        <ul class="plan">
                            <li class="plan-head c-b">BASIC PLAN</li>
                            <li class="main-price">$99 only</li>
                            <li><strong>12</strong> Accounts</li>
                            <li><strong>52</strong> Emails</li>
                            <li><strong>50 GB</strong> Space</li>
                            <li><strong>Free</strong> Support</li>
                            <li class="bottom">
                                <a href="#" class="btn btn-danger">Read More</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-3">
                        <ul class="plan">
                            <li class="plan-head">SIMPLE PLAN</li>
                            <li class="main-price">$199 only</li>
                            <li><strong>12</strong> Accounts</li>
                            <li><strong>52</strong> Emails</li>
                            <li><strong>50 GB</strong> Space</li>
                            <li><strong>Free</strong> Support</li>
                            <li class="bottom">
                                <a href="#" class="btn btn-primary">Read More</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-3">
                        <ul class="plan">
                            <li class="plan-head c-v">VALUE PLAN</li>
                            <li class="main-price">$299 only</li>
                            <li><strong>12</strong> Accounts</li>
                            <li><strong>52</strong> Emails</li>
                            <li><strong>50 GB</strong> Space</li>
                            <li><strong>Free</strong> Support</li>
                            <li class="bottom">
                                <a href="#" class="btn btn-success">Read More</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-3">
                        <ul class="plan">
                            <li class="plan-head c-a">ADVANCE PLAN</li>
                            <li class="main-price">$399 only</li>
                            <li><strong>12</strong> Accounts</li>
                            <li><strong>52</strong> Emails</li>
                            <li><strong>50 GB</strong> Space</li>
                            <li><strong>Free</strong> Support</li>
                            <li class="bottom">
                                <a href="#" class="btn btn-default">Read More</a>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>


        </div>
    </section>-->
    <!-- END PRICE SECTION-->

    <!--SERVICES SECTION
    <section class="for-full-back color-bg-one" id="services-sec">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-8 col-md-offset-2 ">
                    <h1><i class="fa fa-rocket faa-pulse animated  "></i>Services</h1>

                </div>
                <div class="row text-center">
                    <div class="col-md-8 col-md-offset-2 ">
                        <h4>
                            <strong>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                            </strong>
                        </h4>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="for-full-back color-white " id="services-inner">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-12">
                    <div class="col-md-3 ">
                        <div class="service-div">
                            <i class="fa fa-desktop fa-5x faa-vertical animated"></i>
                            <h4>Sure Quique Menu </h4>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                            </p>
                        </div>
                    </div>
                    <div class="col-md-3 ">
                        <div class="service-div">
                            <i class="fa fa-flask fa-5x faa-ring animated"></i>
                            <h4>100% Free Responsive </h4>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                            </p>
                        </div>
                    </div>
                    <div class="col-md-3 ">
                        <div class="service-div">
                            <i class="fa fa-plus fa-5x faa-float animated"></i>
                            <h4>Well Documented </h4>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                            </p>
                        </div>
                    </div>
                    <div class="col-md-3 ">
                        <div class="service-div">
                            <i class="fa fa-credit-card fa-5x faa-shake animated"></i>
                            <h4>Clean & Customizable </h4>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                         Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>-->
    <!--END SERVICES SECTION-->
    <!--STATS SECTION
    <section>
        <div class="container">
            <div class="row ">
                <div class="col-md-3 ">
                    <div class="stats-div">
                        <h3>5000+ </h3>
                        <h4>Projects</h4>
                    </div>
                </div>


                <div class="col-md-3 ">
                    <div class="stats-div">
                        <h3>205+ </h3>
                        <h4>Countries</h4>
                    </div>

                </div>
                <div class="col-md-3 ">

                    <div class="stats-div">
                        <h3>1300+ </h3>
                        <h4>Offices</h4>
                    </div>
                </div>
                <div class="col-md-3 ">
                    <div class="stats-div">
                        <h3>2400+ </h3>
                        <h4>Clients</h4>
                    </div>
                </div>
            </div>
        </div>
    </section>-->
    <!--END STATS SECTION-->

    <!--CONTACT SECTION-->
    <section class="for-full-back color-bg-one" id="contact-sec">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-8 col-md-offset-2 ">
                    <h1><i class="fa fa-globe faa-pulse animated  "></i>Contact</h1>
                </div>
                <div class="row text-center">
                    <div class="col-md-8 col-md-offset-2 ">
                        <h4>
                            <strong>Pour avoir accès à notre site, veuillez nous contacter à l'aide de ce formulaire.  
                            </strong>
                        </h4>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="for-full-back color-white " id="contact-inner">
        <div class="container">
            <div class="row">
                <div class="col-md-5 contact-cls">
                    <div>
                        <!--<span><i class="fa fa-envelope-o"></i>theo.perrin@univ-rennes1.fr</span>
                        <br />
                        <span><i class="fa fa-envelope-o"></i>yoann.lespert@univ-rennes1.fr</span>
                        <br />
                        <br />-->
                    </div>
                </div>
                   
                    <form>
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" required="required" placeholder="Name">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" required="required" placeholder="Email address">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <div class="form-group">
                                    <textarea name="message" id="message" required="required" class="form-control" rows="3" placeholder="Message"></textarea>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-default">Envoyer</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!--END CONTACT SECTION-->

    <!-- SOCIAL STATS SECTION
    <section>
        <div class="container">
            <div class="row g-pad-bottom">
                <div class="col-md-3 ">
                    <div class="social-stats-div">
                        <i class="fa fa-facebook fa-5x "></i>
                        <h3>2000+ Followers </h3>
                    </div>
                </div>
                <div class="col-md-3 ">
                    <div class="social-stats-div">
                        <i class="fa fa-twitter fa-5x "></i>
                        <h3>1900+ Tweets </h3>
                    </div>
                </div>
                <div class="col-md-3 ">
                    <div class="social-stats-div">
                        <i class="fa fa-google-plus fa-5x "></i>
                        <h3>1530+ Followers </h3>
                    </div>
                </div>
                <div class="col-md-3 ">
                    <div class="social-stats-div">
                        <i class="fa fa-linkedin fa-5x "></i>
                        <h3>3000+ Connections </h3>
                    </div>
                </div>
            </div>
        </div>
    </section>-->
    <!-- END SOCIAL STATS SECTION-->

    <!--FOOTER SECTION -->
    <div class="for-full-back color-bg-one" id="footer">
        2017 | Master CCI | Projet Web |Yoann Lespert et Theo Perrin
         
    </div>
    <!-- END FOOTER SECTION -->

    <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY  -->
    <script src="plugins/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP CORE SCRIPT   -->
    <script src="plugins/bootstrap.js"></script>
    <!-- SIDE MENU SCRIPTS -->
    <script src="js/modernizr.custom.js"></script>
    <script src="js/classie.js"></script>
    <!-- VEGAS SLIDESHOW SCRIPTS -->
    <script src="plugins/vegas/jquery.vegas.min.js"></script>
    <!-- CUSTOM SCRIPTS -->
    <script src="js/custom.js"></script>

</body>
</html>
