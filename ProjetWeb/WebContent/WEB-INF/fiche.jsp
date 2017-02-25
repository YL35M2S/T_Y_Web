<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Fiche</title>

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
    
    
    <header>
        <div class="container">
            <div class="row">
            	<div class="col-lg-12">
            		<table class="table">
	            		<tr>
	            			 <td><label for="nom">Nom: ${sessionScope.sessionUtilisateur.nom}</label></td>		
	            		</tr>
	            		
	            		<tr>
	            			<td><label for="prenom">Prénom : ${sessionScope.sessionUtilisateur.prenom}</label></td>     		
	            		</tr>
	            		
	            		<tr>
	            			<td><label for="email">Email: ${sessionScope.sessionUtilisateur.email}</label></td>  		
	            		</tr>
	            		
	            		<tr>
	            			<td><label for="adresse">Adresse: ${sessionScope.sessionUtilisateur.adresse}</label></td>  		
	            		</tr>
	            		
	            		<tr>
	            			<td><label for="ville">Ville : ${sessionScope.sessionUtilisateur.ville}</label></td>  		
	            		</tr>
	            		
	            		<tr>
	            			<td><label for="codePostal">Code Postal : ${sessionScope.sessionUtilisateur.codePostal}</label></td> 
			    		</tr>
			    		
			    		<tr>
			    			<td><label for="modif"><a href="modifiFiche" class="btn btn-success2 btn-lg">Modifie tes infos !</a></label></td>
			    		</tr>
	            	 </table>

             </div>
            <div class="col-lg-12">
             			 <hr class="star-light">
            			 <a href="bonjour"  class="btn btn-outline"><i class="fa"></i> Retour</a>
            			 
            </div>	
        </div>
        
      </div>
    </header>
    
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