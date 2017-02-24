<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Connexion</title>
        
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
                    <img class="img-responsive" src="image/profile.png" alt="" width="200" height="200">
                    <div class="intro-text">
                        <span class="name">Connexion</span>
                        <hr class="star-light">   
                    </div>
                    <form method="post" action="connexion">
           	   
                
                <label for="nom">Login <span class="requis">*</span></label>
                <br/>
                <input type="text" class="form-control2" id="login" name="login" value="<c:out value="${utilisateur.login}"/>" size="20" maxlength="60" />
                <br/>
                <span class="erreur">${form.erreurs['login']}</span>
                <br/>

                <label for="motdepasse">Mot de passe <span class="requis">*</span></label>
                <br/>
                <input type="password" class="form-control2" id="motDePasse" name="motDePasse" value="" size="20" maxlength="20" />
                <br/>
                <span class="erreur">${form.erreurs['motDePasse']}</span>
				<br/>
				<br/>
                <a href="inscription" class="btn btn-success2 btn-lg">S'inscrire</a>
                <button type="submit" value="Connexion" class="btn btn-primary btn-lg">Se connecter</button>
                <br/>
                <br/>
                <p class="${empty form.erreurs ? 'succes' : 'erreur'}">${form.resultat}</p>
                
                <%-- Vérification de la présence d'un objet utilisateur en session --%>
                <c:if test="${!empty sessionScope.sessionUtilisateur}">
                <%-- Si l'utilisateur existe en session, alors on affiche son adresse email. --%>
                <p class="succes">Vous êtes connecté(e) avec l'adresse : ${sessionScope.sessionUtilisateur.email}</p>
                </c:if>
        </form>
                </div>
                
            </div>
        </div>
    </header>
    
     <!-- Contact Section -->
    <section id="compte" class="success" id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                	<h3>Contacter nous pour récupérer une clé d'inscription</h3>
                    <ul class="list-inline">
                            <li>
                                <a href="index.jsp#contact" class="btn-social btn-outline"><i class="fa fa-fw fa-dribbble"></i></a>
                            </li>
                    </ul>
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