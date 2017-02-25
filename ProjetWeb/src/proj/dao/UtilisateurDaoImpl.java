package proj.dao;

import java.sql.SQLException;

import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import proj.beans.Utilisateur;
import static proj.dao.DAOUtilitaire.*;
import static proj.dao.DAOFactory.initialisationRequetePreparee;

public class UtilisateurDaoImpl implements UtilisateurDao {
	
	private DAOFactory daoFactory;
	private static final String SQL_SELECT_PAR_LOGIN = "SELECT * FROM repertoire WHERE Login = ?";
	private static final String SQL_INSERT_UTILISATEUR = "INSERT INTO repertoire VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?);";
	private static final String SQL_EXIST_LOGIN = "SELECT * FROM repertoire WHERE Login = ? ";
	private static final String SQL_UPDATE_UTILISATEUR ="UPDATE repertoire SET Login = ?, Adresse = ?, Email = ?, Cp= ?, Ville = ? WHERE Login=?";
	
	/*Constructeur*/
	public UtilisateurDaoImpl( DAOFactory daoFactory ) { 
        this.daoFactory = daoFactory;
    }
	
	/* Implémentation de la méthode trouver() définie dans l'interface UtilisateurDao */
	
    @Override
    public Utilisateur trouver( String login ) throws DAOException {
    	Connection connexion = null;
    	PreparedStatement preparedStatement = null;
    	ResultSet resultSet = null;
    	Utilisateur utilisateur = null;
    	
    	try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_SELECT_PAR_LOGIN, false, login );
            resultSet = preparedStatement.executeQuery();

            /* Parcours de la ligne de données de l'éventuel ResulSet retourné */
            while ( resultSet.next() ) {
               utilisateur = new Utilisateur();
               utilisateur.setIdUtilisateur	( resultSet.getInt   ( "idUtilisateur" ));
               utilisateur.setLogin			( resultSet.getString( "Login"		   ));
               utilisateur.setMdp			( resultSet.getString( "MotDePasse"	   ));
               utilisateur.setNom			( resultSet.getString( "Nom" 		   ));
               utilisateur.setPrenom		( resultSet.getString( "Prenom"  	   ));
               utilisateur.setEmail			( resultSet.getString( "Email"		   ));
               utilisateur.setAdresse		( resultSet.getString( "Adresse" 	   ));
               utilisateur.setCodePostal	( resultSet.getInt   ( "Cp" 	 	   ));
               utilisateur.setVille			( resultSet.getString( "Ville" 	 	   ));

            }
        } catch ( SQLException e ) {
            throw new DAOException( e ); 
        } finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        }

        return utilisateur;
    }

    /* Implémentation de la méthode creer() définie dans l'interface UtilisateurDao */
    @Override
    public void creer( Utilisateur utilisateur ) throws DAOException {
    	
    	int 	idUtilisateur 	= utilisateur.getIdUtilisateur();
    	String 	login 			= utilisateur.getLogin();
    	String 	motDePasse 		= utilisateur.getMdp();
    	String 	nom				= utilisateur.getNom();
    	String  prenom			= utilisateur.getPrenom();
    	String  email 			= utilisateur.getEmail();
    	String  adresse 		= utilisateur.getAdresse();
    	int 	codePostal		= utilisateur.getCodePostal();
    	String 	ville 			= utilisateur.getVille(); 	
    	int 			   statut;
    	
    	Connection connexion = null; 
	    PreparedStatement preparedStatement = null; 
	     
	    try{
	    	connexion = daoFactory.getConnection();
	    	preparedStatement = DAOFactory.initialisationRequetePreparee(connexion, SQL_INSERT_UTILISATEUR, false, idUtilisateur, login, motDePasse, nom, prenom, email, adresse, codePostal, ville);
	    	statut = preparedStatement.executeUpdate();
	    	if (statut==0){System.out.println("ok");};
	    } 	catch ( SQLException e ) {
        	throw new DAOException( e );
		  	}
				finally {
				fermeturesSilencieuses( preparedStatement, connexion );
				}  
    }
    
    @Override
    public void modifier( Utilisateur utilisateur ) throws DAOException{
    	String 	login 			= utilisateur.getLogin();
    	String 	motDePasse 		= utilisateur.getMdp();
    	String  email 			= utilisateur.getEmail();
    	String  adresse 		= utilisateur.getAdresse();
    	int 	codePostal		= utilisateur.getCodePostal();
    	String 	ville 			= utilisateur.getVille(); 	
    	int 			   statut;
    	
    	Connection connexion = null; 
	    PreparedStatement preparedStatement = null; 
	     
	    try{
	    	connexion = daoFactory.getConnection();
	    	preparedStatement = DAOFactory.initialisationRequetePreparee(connexion, SQL_UPDATE_UTILISATEUR, false, login, email, adresse, codePostal, ville, login);
	    	statut = preparedStatement.executeUpdate();
	    	if (statut==0){System.out.println("ok");};
	    } 	catch ( SQLException e ) {
        	throw new DAOException( e );
		  	}
				finally {
				fermeturesSilencieuses( preparedStatement, connexion );
				}  
    }
    
    
    @Override
    public boolean existe (String login) throws DAOException {
    	boolean existe = false;
    	Connection connexion = null; 
	    PreparedStatement preparedStatement = null;
	    ResultSet resultSet = null;
	    
	    try {
	    	/* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee( connexion, SQL_EXIST_LOGIN, false, login );
            resultSet = preparedStatement.executeQuery();
	    	
	    		if ( resultSet.next() ) {
	    			
	         		existe = true;
	    		}
	  		
	    } catch ( SQLException e ) {
            throw new DAOException( e ); 
        } finally {
            fermeturesSilencieuses( resultSet, preparedStatement, connexion );
        } 
	    
    	return existe;
    }
    
	
}
