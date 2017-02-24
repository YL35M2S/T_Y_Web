<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bonjour</title>

<!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Theme CSS -->
    <link href="css/freelancer.min.css" rel="stylesheet">

    <!-- Importation des polices -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

</head>

<body id="page-top" class="index">

<!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
        <div class="container">
        
            <!-- Brand and toggle se regroupent pour un meilleur affichage mobile -->
            <div class="navbar-header page-scroll">
                <!--button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button-->
                <a class="navbar-brand" href="#page-top">WebLib</a>
                
            </div>

            <!-- Regroupe les liens de navigation, ici uniquement le lien pour nous contacter -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li class="page-scroll">
                        <a href="fiche">Toi :)</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#nouveautes">Nouveautés</a>
                    </li>
                    <li class="page-scroll">
                        <a href="video">Vidéos</a>
                    </li>
                    <li class="page-scroll">
                        <a href="photo">Photos</a>
                    </li>
                    <li class="page-scroll">
                        <a href="musique">Musiques</a>
                    </li>
                    <li class="page-scroll">
                        <a href="upload">Partager</a>
                    </li>
                    <li class="page-scroll">
                        <a href="deconnexion">Se déconnecter</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
    
 <!-- Header -->
    <header>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-text">
                   		 <img class="img-responsive" src="image/cinema.png" width="200" height="200" alt="">
                        <span class="name">Bienvenue sur notre WebLib</span>
                        <span class="skills">${sessionScope.sessionUtilisateur.login}, tu as désormais accès à tout le contenu de notre site.</span>
                        <hr class="star-light">
               			<p>
               			<label for="Rechercher"></label>
               			<input type="text" class="form-control2" id="recherche" name="recherche" value="" maxlength="60" placeholder="Rechercher des fichiers"/>
                		<p/>
                		<hr class="star-light">
                    </div>
                </div>
            </div>
        </div>
    </header>    

<!-- Portfolio Grid Section -->
    <section id="nouveautes">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Nouveautés</h2>
                    <hr class="star-primary">
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 portfolio-item">
                    <a href="video">
                        
                        <img src="image/videos/FMF.jpg" class="img-responsive" alt="">
                    </a>
                </div>
                <div class="col-sm-4 portfolio-item">
                    <a href="video">
                       
                        <img src="image/videos/MK.jpg" class="img-responsive" alt="">
                    </a>
                </div>
                <div class="col-sm-4 portfolio-item">
                    <a href="video">
                        
                        <img src="image/videos/TGBH.jpg" class="img-responsive" alt="">
                    </a>
                </div>
            </div>
        </div>
    </section>






  <!-- Footer -->
    <footer class="text-center">  
    <div class="footer-below">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        Yoann & Théo WebLib 2017
                    </div>
                </div>
            </div>
        </div>
    </footer>
    
    
    
     <!-- jQuery -->
 <script src="vendor/jquery/jquery.min.js"></script>

 <!-- Bootstrap Core JavaScript -->
 <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

 <!-- Plugin JavaScript -->
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

 <!-- Contact Form JavaScript -->
 <script src="js/jqBootstrapValidation.js"></script>
 <script src="js/contact_me.js"></script>

 <!-- Theme JavaScript -->
 <script src="js/freelancer.min.js"></script>               

     



</body>
</html>