package proj.forms;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import proj.beans.Utilisateur;
import proj.dao.UtilisateurDao;

public class ModifiFicheForm{
	
	public static final String CHAMP_EMAIL 	= "email";
	public static final String CHAMP_OLD_LOGIN	= "login1";
	public static final String CHAMP_NEW_LOGIN	= "login2";
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
    
    public ModifiFicheForm( UtilisateurDao utilisateurDao ) {
        this.utilisateurDao = utilisateurDao;
    }
    
    
	public Utilisateur modifieUtilisateur( HttpServletRequest request ) {
    	
    	//RÈcupÈration du login de session
       /* HttpSession session= request.getSession();
		utilisateurDao.trouver((String)session.getAttribute("login"));
		System.out.println(utilisateurDao.trouver((String)request.getAttribute("login")));
		
		//String log=(String)request.getAttribute("login");
      
        */
        //RÈcupÈration des champs du formulaire
		String login1 = getValeurChamp( request, CHAMP_OLD_LOGIN );
    	String login2 = getValeurChamp( request, CHAMP_NEW_LOGIN );
    	String email = getValeurChamp( request, CHAMP_EMAIL );
    	String ville = getValeurChamp( request, CHAMP_VILLE );
        String codePostal =getValeurChamp( request, CHAMP_CP );
        String adresse = getValeurChamp( request, CHAMP_ADRESSE );
        
        //RÈcupÈration des donnÈes associÈes ‡ la session
    	//Utilisateur utilisateur=new Utilisateur();
    	Utilisateur utilisateur=utilisateurDao.trouver(login1);
    	
        String parameterValue1=utilisateur.getLogin();
        System.out.println(parameterValue1);
        
        String parameterValue3=utilisateur.getEmail();
        String parameterValue4=utilisateur.getAdresse();
        String parameterValue5=String.valueOf(utilisateur.getCodePostal());
        String parameterValue6=utilisateur.getVille();
        
        
        
        //Comparaison des donnÈes
        
      if(login2!=null){
    	  if(login2.compareTo("")==0){login2=parameterValue1;}
      }
      else {login2=parameterValue1;}
      
      if(email!=null){
    	  if(email.compareTo("")==0){email=parameterValue3;}
      }
      else {email=parameterValue3;}
      
      if(adresse!=null){
    	  if(adresse.compareTo("")==0){adresse=parameterValue4;}
      }
      else {adresse=parameterValue4;}
      
      if(codePostal!=null){
    	  if(codePostal.compareTo("")==0){codePostal=parameterValue5;}
      }
      else {codePostal=parameterValue5;}
      
      if(ville!=null){
    	  if(ville.compareTo("")==0){ville=parameterValue6;}
      }
      else {ville=parameterValue6;}
              
            utilisateur.setLogin(login2);
            System.out.println(login2);
            utilisateur.setEmail(email);
            utilisateur.setAdresse(adresse);
            utilisateur.setVille(ville);
            utilisateur.setCodePostal(Integer.parseInt(codePostal));
          
          //Modification de l'utilisateur dans la base de donnÈes
            utilisateurDao.modifier(utilisateur);
            
            return utilisateur;
       
        
    }
        
        
        
        private static String getValeurChamp( HttpServletRequest request, String nomChamp ) {
            String valeur = request.getParameter( nomChamp );
            if ( valeur == null || valeur.trim().length() == 0 ) {
                return null;
            } else {
                return valeur.trim();
            }
        }
        
        
        /*
         * Ajoute un message correspondant au champ sp√©cifi√© √† la map des erreurs.
         */
        private void setErreur( String champ, String message ) {
            erreurs.put( champ, message );
        }
        
        /*
         * Appel √† la validation de l'adresse email re√ßue et initialisation de la
         * propri√©t√© email du bean
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
                    throw new FormValidationException( "Cette adresse email est d√©j√† utilis√©e, merci d'en choisir une autre." );
                }*/
            } else {
                throw new FormValidationException( "Merci de saisir une adresse mail." );
            }
        }
        
        /*
         * Appel √† la validation des mots de passe re√ßus, chiffrement du mot de
         * passe et initialisation de la propri√©t√© motDePasse du bean
         */
       


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
                setErreur( CHAMP_NEW_LOGIN, e.getMessage() );
            }
            utilisateur.setLogin(login);
        }
        
        
        /**
         * Valide le nom d'utilisateur saisi.
         */
        private void validationLogin( String login ) throws FormValidationException {
        	
        	if (login == null){
        		throw new FormValidationException( "Le login doit contenir au moins 3 caract√®res." );
        	}	else if ( login != null && login.trim().length() < 3 ) {
                	throw new FormValidationException( "Le login doit contenir au moins 3 caract√®res." );
            	} 	else if (utilisateurDao.existe(login)){
            			throw new FormValidationException( "Le login est d√©j√† utilis√©" );
            		}
        }
        

}