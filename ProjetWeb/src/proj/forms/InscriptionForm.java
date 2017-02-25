package proj.forms;

import java.util.HashMap;
import java.util.Map;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import proj.beans.*;
import proj.dao.*;
import org.jasypt.util.password.ConfigurablePasswordEncryptor;
import javax.servlet.http.HttpServletRequest;

public class InscriptionForm {

	public static final String CHAMP_ID		= "idUtilisateur";
	public static final String CHAMP_EMAIL 	= "email";
	public static final String CHAMP_LOGIN	= "login";
    public static final String CHAMP_PASS 	= "motdepasse";
    public static final String CHAMP_CONF 	= "confirmation";
    public static final String CHAMP_NOM 	= "nom";
    public static final String CHAMP_PRENOM = "prenom";
    public static final String CHAMP_ADRESSE= "adresse";
    public static final String CHAMP_CP		= "codePostal";
    public static final String CHAMP_VILLE 	= "ville";
    
    private String              resultat;
    private Map<String, String> erreurs      = new HashMap<String, String>();
    
    public String getResultat() {
        return resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }
    
    private UtilisateurDao      utilisateurDao;

    public InscriptionForm( UtilisateurDao utilisateurDao ) {
        this.utilisateurDao = utilisateurDao;
    }

   
    /* Méthode principale
     * 
     * @return un utilisateur
     * */
    
    public Utilisateur inscrireUtilisateur( HttpServletRequest request ) {
        String idUtilisateur = getValeurChamp( request, CHAMP_ID );
    	String email = getValeurChamp( request, CHAMP_EMAIL );
        String login = getValeurChamp( request, CHAMP_LOGIN );
        String motDePasse = getValeurChamp( request, CHAMP_PASS );
        String confirmation = getValeurChamp( request, CHAMP_CONF );
        String nom = getValeurChamp( request, CHAMP_NOM );
        String prenom = getValeurChamp( request, CHAMP_PRENOM );
        String ville = getValeurChamp( request, CHAMP_VILLE );
        String codePostal = getValeurChamp( request, CHAMP_CP );
        String adresse = getValeurChamp( request, CHAMP_ADRESSE );

        
        /** 
         * Création de l'objet utilisateurTest
         * 
         * On teste la validité de chaque champ
         * 
         * Si c'est ok ( erreur.isEmpty() ) alors on créer le véritable utilisateur dans la base
         */
        
		Utilisateur utilisateurTest = new Utilisateur();
        
		utilisateurTest.setNom(nom);
		utilisateurTest.setPrenom(prenom);
		utilisateurTest.setAdresse(adresse);
		utilisateurTest.setVille(ville);
        traiterEmail(email, utilisateurTest);
        traiterLogin(login, utilisateurTest);
        traiterMotsDePasse( motDePasse, confirmation, utilisateurTest );
        traiterCodePostal(codePostal, utilisateurTest);
        traiterIdUtilisateur (idUtilisateur, utilisateurTest);
        

        if ( erreurs.isEmpty() ) {
            resultat = "Succ�s de l'inscription.";
            Utilisateur utilisateur = new Utilisateur();
            utilisateur.setIdUtilisateur(Integer.parseInt(idUtilisateur));
            utilisateur.setLogin(login);
            utilisateur.setEmail(email);
            utilisateur.setNom(nom);
            utilisateur.setPrenom(prenom);
            utilisateur.setAdresse(adresse);
            utilisateur.setVille(ville);
            utilisateur.setCodePostal(Integer.parseInt(codePostal));
            
            //Cryptage du mot de passe à l'aide de l'algorithme SHA-256
            ConfigurablePasswordEncryptor passwordEncryptor = new ConfigurablePasswordEncryptor();
            passwordEncryptor.setAlgorithm( "SHA-256" );
            passwordEncryptor.setPlainDigest( false );
            String motDePasseChiffre = passwordEncryptor.encryptPassword( motDePasse );

            utilisateur.setMdp( motDePasseChiffre );
            
          //Création de l'utilisateur dans la base de donnée
            utilisateurDao.creer(utilisateur);
            return utilisateur;
        } else {
            resultat = "Echec de l'inscription.";
            return utilisateurTest;
        }

    }
    
    /*méthode qui permet de vérifier si les champs remplis ne son pas nuls. 
     * 
     */
    private static String getValeurChamp( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur.trim();
        }
    }
    
    /*
     * Ajoute un message correspondant au champ spécifié à la map des erreurs.
     */
    private void setErreur( String champ, String message ) {
        erreurs.put( champ, message );
    }
    
    /*
     * Appel à la validation de l'adresse email reçue et initialisation de la
     * propriété email du bean
     */
    private void traiterEmail( String email, Utilisateur utilisateur ) {
        try {
            validationEmail( email );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_EMAIL, e.getMessage() );
        }
        utilisateur.setEmail( email );
    }
    
    /* Validation de l'adresse email */
    private void validationEmail( String email ) throws FormValidationException {
        if ( email != null ) {
            if ( !email.matches( "([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)" ) ) {
                throw new FormValidationException( "Merci de saisir une adresse mail valide." );
            } /*else if ( utilisateurDao.trouver( email ) != null ) {
                throw new FormValidationException( "Cette adresse email est déjà utilisée, merci d'en choisir une autre." );
            }*/
        } else {
            throw new FormValidationException( "Merci de saisir une adresse mail." );
        }
    }
    
    /*
     * Appel à la validation des mots de passe reçus, chiffrement du mot de
     * passe et initialisation de la propriété motDePasse du bean
     */
    private void traiterMotsDePasse( String motDePasse, String confirmation, Utilisateur utilisateur ) {
        try {
            validationMotsDePasse( motDePasse, confirmation );
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_PASS, e.getMessage() );
            setErreur( CHAMP_CONF, null );
        }
    }

    private void validationMotsDePasse( String motDePasse, String confirmation ) throws FormValidationException {
        if ( motDePasse != null && confirmation != null ) {
            if ( !motDePasse.equals( confirmation ) ) {
                throw new FormValidationException( "Les mots de passe entrés sont différents, merci de les saisir à nouveau." );
            } else if ( motDePasse.length() < 6 ) {
                throw new FormValidationException( "Les mots de passe doivent contenir au moins 6 caractères." );
            }
        } else {
            throw new FormValidationException( "Merci de saisir et confirmer votre mot de passe." );
        }
    }


    /**
     * Valide le code postal saisi.
     */
    
    private void traiterCodePostal ( String codePostal, Utilisateur utilisateur ) {
        try {
            validationCodePostal( codePostal);
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_CP, e.getMessage() );
        }
    }
    
    
    /**
     * Valide le code postal saisi.
     */
    private void validationCodePostal(String codePostal) throws FormValidationException {  	
    		if (codePostal == null){
    			throw new FormValidationException( "Merci de saisir un code postal valide" );
    		}
    		else if (codePostal.length() != 5){
	    		throw new FormValidationException( "Merci de saisir un code postal valide" );
	    	}
    }
    
    /**
     * Traite le login d'utilisateur saisi.
     */
    private void traiterLogin ( String login, Utilisateur utilisateur ) {
        try {
            validationLogin(login);
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_LOGIN, e.getMessage() );
        }
        utilisateur.setLogin(login);
    }
    
    
    /**
     * Valide le nom d'utilisateur saisi.
     */
    private void validationLogin( String login ) throws FormValidationException {
    	
    	if (login == null){
    		throw new FormValidationException( "Le login doit contenir au moins 3 caractères." );
    	}	else if ( login != null && login.trim().length() < 3 ) {
            	throw new FormValidationException( "Le login doit contenir au moins 3 caractères." );
        	} 	else if (utilisateurDao.existe(login)){
        			throw new FormValidationException( "Le login est déjà utilisé" );
        		}
    }
    
    
    /**
     * Valide la clé saisie
     */
    
    private void traiterIdUtilisateur ( String idUtilisateur, Utilisateur utilisateur ) {
        try {
            validationIdUtilisateur( idUtilisateur);
        } catch ( FormValidationException e ) {
            setErreur( CHAMP_ID, e.getMessage() );
        }
    }
    
    
    /**
     * Valide la clé saisie
     */
    private void validationIdUtilisateur(String idUtilisateur) throws FormValidationException {  	
    		if (idUtilisateur == null){
			throw new FormValidationException( "Merci de saisir une clé valide de 8 chiffres" );
    		} else if (idUtilisateur.trim().length() != 8){
	    		throw new FormValidationException( "Merci de saisir une clé valide de 8 chiffres" );
	    	  }

    }
    
    
    
    
}
    

