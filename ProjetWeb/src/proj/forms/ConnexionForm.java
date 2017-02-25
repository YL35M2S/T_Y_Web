package proj.forms;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import org.jasypt.util.password.ConfigurablePasswordEncryptor;

import java.util.HashMap; 
import java.util.Map;

import proj.beans.Utilisateur;
import proj.dao.UtilisateurDao;


public final class ConnexionForm {
	
    private static final String CHAMP_LOGIN  = "login";
    private static final String CHAMP_PASS   = "motDePasse";

    private String              resultat;
    private Map<String, String> erreurs      = new HashMap<String, String>();
    private UtilisateurDao      utilisateurDao;

    public String getResultat() {
        return resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }
    
    public ConnexionForm( UtilisateurDao utilisateurDao ) {
        this.utilisateurDao = utilisateurDao;
    }

    /* Méthode connecter utilisateur
     * 
     * renvoi l'utilisateur si il est connecté
     */
    
    public Utilisateur connecterUtilisateur( HttpServletRequest request ) {
    	
        /* Récupération des champs du formulaire */
        String login = getValeurChamp( request, CHAMP_LOGIN );
        String motDePasse = getValeurChamp( request, CHAMP_PASS );

        Utilisateur utilisateur = new Utilisateur();

        traiterLogin(login, utilisateur);
        traiterMotDePasse(login, motDePasse, utilisateur);

        /* Initialisation du résultat global de la validation. */
        if ( erreurs.isEmpty() ) {
        	utilisateur=utilisateurDao.trouver(login);
        	utilisateur.getLogin();
        	utilisateur.getMdp();
        	utilisateur.getIdUtilisateur();
        	utilisateur.getEmail();
        	utilisateur.getAdresse();
        	utilisateur.getNom();
        	utilisateur.getPrenom();
        	utilisateur.getVille();
        	utilisateur.getCodePostal();
        	
            resultat = "Succ�s de la connexion.";
            
        } else {
            resultat = "Echec de la connexion.";
        }

        return utilisateur;
    }

    /**
     * Valide le login saisi.
     */
    private void validationLogin( String login ) throws FormValidationException {
        if(login != null){
        	if(!utilisateurDao.existe(login)){
        		throw new FormValidationException( "Login incorrect" );
        	}
        } else {
        	throw new FormValidationException( "Merci de saisir un login." );
        }
        
    }

    /**
     * Valide le mot de passe saisi.
     */
       private void validationMotDePasse( String login, String motDePasse ) throws FormValidationException {
       if(motDePasse !=null){
    	   
       String motDePasseBDD = utilisateurDao.trouver(login).getMdp();
       
       ConfigurablePasswordEncryptor passwordEncryptor = new ConfigurablePasswordEncryptor();
//       passwordEncryptor.setAlgorithm( "SHA-256" );
//       passwordEncryptor.setPlainDigest( false );

       if (passwordEncryptor.checkPassword(motDePasse, motDePasseBDD)){
    	   System.out.println("hello");
       }else {
    	   throw new FormValidationException( "Mot de passe incorrect" );
       }
       }
    }
    
    /** 
     * Traite le Login
     * 
     */
    private void traiterLogin ( String login, Utilisateur utilisateur) {
        try {
            validationLogin(login);
            utilisateur.setLogin(login);
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_LOGIN, e.getMessage() );
        }
    }
    
    /** 
     * Traite le mot de passe
     * 
     * si ok, on enregistre tout l'utilisateur
     * 
     */
    private void traiterMotDePasse ( String login, String motDePasse, Utilisateur utilisateur) {
        try {
        	 if (motDePasse != null){
          	   
        	       String motDePasseBDD = utilisateurDao.trouver(login).getMdp();
        	       
        	       ConfigurablePasswordEncryptor passwordEncryptor = new ConfigurablePasswordEncryptor();
        	       passwordEncryptor.setAlgorithm( "SHA-256" );
        	       passwordEncryptor.setPlainDigest( false );

        	       if (passwordEncryptor.checkPassword(motDePasse, motDePasseBDD)){
        	       }	else {
        	    	   		throw new FormValidationException( "Mot de passe incorrect" );
        	       		}
        	 }else {
        		 throw new FormValidationException( "Veuillez entrer un mot de passe" );
        	 }
        	 utilisateur.setMdp(motDePasse);
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_PASS, e.getMessage() );
        }
        
    }

    /*
     * Ajoute un message correspondant au champ spécifié à la map des erreurs.
     */
    private void setErreur( String champ, String message ) {
        erreurs.put( champ, message );
    }

    /*
     * Méthode utilitaire qui retourne null si un champ est vide, et son contenu
     * sinon.
     */
    private static String getValeurChamp( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur;
        }
    }
}
