<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Inscription</title>
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
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="#page-top">WebLib</a>
            </div>

            <!-- Regroupe les liens de navigation, ici uniquement le lien pour nous contacter -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li class="page-scroll">
                        <a href="#compte">Je n'ai pas de compte</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
    </nav>
    
    <!-- Header -->
    <header>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-text">
                        <span class="name">Formulaire d'inscription</span>
                        <h4> Veillez à demander une clé d'inscription !</h4>
                        <hr class="star-light">
                        
                    </div>
                </div>
            
            	<div class="col-lg-12">
            	
            	<form method="post" action="inscription">
            	<table class="table">
            	
            		<tr>
            			<td><label for="idUtilisateur">Clé d'inscription</label></td> 			
            			<td><input type="text" class="form-control" id="idUtilisateur" name="idUtilisateur" value="<c:out value=""/>" size="20" maxlength="20" placeholder="Ex : 34565982" /></td>
            			<td><div class="erreur">${form.erreurs['idUtilisateur']}</div></td>         		
            		</tr>
            		
            		<tr>
            			<td><label for="email">Adresse email <span class="requis">*</span></label></td>
            			<td><input type="text" class="form-control" id="email" name="email" value="<c:out value="${utilisateur.email}"/>" size="20" maxlength="60" /></td>
            			<td><div class="erreur"> ${form.erreurs['email']}</div></td>           		
            		</tr>
            		
            		<tr>
            			<td><label for="login">Login <span class="requis">*</span></label></td>
            			<td><input type="text" class="form-control" id="login" name="login" value="<c:out value="${utilisateur.login}"/>" size="20" maxlength="20" /></td>
            			<td><div class="erreur">${form.erreurs['login']}</div></td>           		
            		</tr>
            		
            		<tr>
            			<td><label for="motdepasse">Mot de passe <span class="requis">*</span></label></td>
            			<td><input type="password" class="form-control" id="motdepasse" name="motdepasse" value="" size="20" maxlength="20" /></td>
            			<td><div class="erreur">${form.erreurs['motdepasse']}</div></td>           		
            		</tr>
            		
            		<tr>
            			<td><label for="confirmation">Confirmation du mot de passe <span class="requis">*</span></label></td>
            			<td><input type="password" class="form-control" id="confirmation" name="confirmation" value="" size="20" maxlength="20" /></td>
            			<td><div class="erreur">${form.erreurs['confirmation']}</div></td>           		
            		</tr>
            		
            		<tr>
            			<td><label for="nom">Nom d'utilisateur</label></td>
            			<td><input type="text" class="form-control" id="nom" name="nom" value="<c:out value="${utilisateur.nom}"/>" size="20" maxlength="20"  /></td>
            			<td></td>           		
            		</tr>
            		
            		<tr>
            			<td><label for="prenom">Prénom d'utilisateur</label></td>
            			<td><input type="text" class="form-control" id="prenom" name="prenom" value="<c:out value="${utilisateur.prenom}"/>" size="20" maxlength="20" /></td>
            			<td></td>           		
            		</tr>
            		
            		<tr>
            			<td><label for="adresse">Adresse</label></td>
            			<td><input type="text" class="form-control" id="adresse" name="adresse" value="<c:out value="${utilisateur.adresse}"/>" size="20" maxlength="20" /></td>
            			<td></td>           		
            		</tr>
            		
            		<tr>
            			<td><label for="ville">Ville</label></td>
            			<td><input type="text" class="form-control" id="ville" name="ville" value="<c:out value="${utilisateur.ville}"/>" size="20" maxlength="20" /></td>
            			<td></td>           		
            		</tr>
            		
            		<tr>
            			<td><label for="codePostal">Code Postal</label></td>
            			<td><input type="text" class="form-control" id="codePostal" name="codePostal" value="<c:out value=""/>" size="20" maxlength="20"  placeholder="Ex : 35000"/></td>
            			<td><div class="erreur">${form.erreurs['codePostal']}</div></td>           		
            		</tr>
            		
            		<tr>
            			<td><a href="index.jsp#contact"><input type="button" class="btn btn-success2" value="Demander une clé d'inscription"/></a></td>
            			<td><input type="submit" value="inscription" class="btn btn-success2" /></td>
            			<td><span class="${empty form.erreurs ? 'ok' : 'erreur'}">${form.resultat}</span></td>           		
            		</tr>


            	 </table>
            	 </form>
             </div>
             	<div class="col-lg-12">
             			 <hr class="star-light">
            			 <a href="connexion"  class="btn btn-outline"><i class="fa"></i> Retour</a>
            			 
               </div>
            		
        </div>
        
      </div>
    </header>




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