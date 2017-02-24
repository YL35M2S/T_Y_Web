package proj.dao;

import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement; 



public class DAOFactory {
    private static final String PROPERTY_URL             = "jdbc:mysql://mysql.istic.univ-rennes1.fr:3306/base_17012949";
    private static final String PROPERTY_DRIVER          = "com.mysql.jdbc.Driver";
    private static final String PROPERTY_NOM_UTILISATEUR = "user_17012949";
    private static final String PROPERTY_MOT_DE_PASSE    = ":colokar";

    private String              url;
    private String              nomUtilisateur;
    private String              motDePasse;

    DAOFactory( String url, String nomUtilisateur, String motDePasse ) {
        this.url = url;
        this.nomUtilisateur = nomUtilisateur;
        this.motDePasse = motDePasse;
    }

    /*
     * Méthode chargée de récupérer les informations de connexion à la base de
     * données, charger le driver JDBC et retourner une instance de la Factory
     */
    public static DAOFactory getInstance() throws DAOConfigurationException {
        String url = PROPERTY_URL;
        String driver = PROPERTY_DRIVER;
        String nomUtilisateur = PROPERTY_NOM_UTILISATEUR; 
        String motDePasse = PROPERTY_MOT_DE_PASSE;

        try {
            Class.forName( driver );
        } catch ( ClassNotFoundException e ) {
            throw new DAOConfigurationException( "Le driver est introuvable dans le classpath.", e );
        } 

        DAOFactory instance = new DAOFactory( url, nomUtilisateur, motDePasse );
        return instance;
    }

    /* Méthode chargée de fournir une connexion à la base de données */
    /* package */ 
    Connection getConnection() throws SQLException {
        return DriverManager.getConnection( url, nomUtilisateur, motDePasse );
    }

    /*
     * Méthodes de récupération de l'implémentation des différents DAO (un seul
     * pour le moment)
     */
    
    public UtilisateurDao getUtilisateurDao() {
        return new UtilisateurDaoImpl( this );
    }
    
    /*
     * Initialise la requête préparée basée sur la connexion passée en argument,
     * avec la requête SQL et les objets donnés.
     */
    public static PreparedStatement initialisationRequetePreparee( Connection connexion, String sql, boolean returnGeneratedKeys, Object... objets ) throws SQLException {
        PreparedStatement preparedStatement = connexion.prepareStatement( sql, returnGeneratedKeys ? Statement.RETURN_GENERATED_KEYS : Statement.NO_GENERATED_KEYS );
        for ( int i = 0; i < objets.length; i++ ) {
            preparedStatement.setObject( i + 1, objets[i] );
        }
        return preparedStatement;
    }
}