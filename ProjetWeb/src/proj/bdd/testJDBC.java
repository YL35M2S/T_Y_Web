package proj.bdd;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement; 
import java.sql.SQLException;


public class testJDBC {
	/* La liste qui contiendra tous les résultats de nos essais */
    private List<String> messages = new ArrayList<String>();

    public List<String> executerTests( HttpServletRequest request ) {
    	
    	/* Chargement du driver JDBC pour MySQL */
    	try {
    		messages.add( "Chargement du driver..." );
    	    Class.forName( "com.mysql.jdbc.Driver" );
    	    messages.add( "Driver chargé !" );
    	} catch ( ClassNotFoundException e ) {messages.add( "Erreur lors du chargement : le driver n'a pas été trouvé dans le classpath ! <br/>"
                + e.getMessage() );}
    	
    	/* Connexion à la base de données */
    	 String url = "jdbc:mysql://mysql.istic.univ-rennes1.fr:3306/base_17012949";
		 String user = "user_17012949";
		 String passwd = ":colokar";
		 Connection connexion = null;
		 String utilisateur="Theo"; 
		 String mdp="Perrin";
		
		 try { 
			 /*Connexion BDD */
			 messages.add( "Connexion à la base de données..." );
			    connexion = DriverManager.getConnection( url, user, passwd );
		     messages.add( "Connexion réussie !" );  
		     
			    /* Création de l'objet gérant les requêtes */
			    java.sql.Statement statement = connexion.createStatement();
			 messages.add( "Objet requête créé !" );
			 
			 /* Exécution d'une requête d'écriture */
		    	ResultSet rst = statement.executeQuery("SELECT * FROM repertoire Where Login='"+utilisateur+"' and MDP='"+mdp+"'");
		    	/*int statut = statement.executeUpdate( "INSERT INTO repertoire (Login, MDP) VALUES ('Hello', 'World');" );
		    	ResultSet rst2 = statement.executeQuery("SELECT * FROM repertoire Where Login='Hello'");*/
			    
		    	/* Récupération des données du résultat de la requête de lecture */
		    	while ( rst.next() ) {
		    	    String motDP = rst.getString( "MDP" );
		    	    String login = rst.getString( "Login" );
		    	    String adresse = rst.getString("Adresse"); 
		    	    String cp = rst.getString("Cp");
		    	    String ville = rst.getString("Ville"); 
		   
		    	 messages.add( "Données retournées par la requête : Login= "+login+", MDP= "+motDP+", Adresse= "+adresse+", CP= "+cp+", Ville= "+ville+".");
		    	}
		
			} catch ( SQLException e ) { 
				messages.add( "Erreur lors de la connexion : <br/>"
		                + e.getMessage() );
			    /* Gérer les éventuelles erreurs ici */
			} finally {
			    if ( connexion != null )
			        try {
			    messages.add( "Fermeture de l'objet ResultSet." );	
			            /* Fermeture de la connexion */
			            connexion.close();
			        } catch ( SQLException ignore ) {
			            /* Si une erreur survient lors de la fermeture, il suffit de l'ignorer. */
			        }
			}
        return messages;
			
    
    }
    
}


