package proj.dao;

import proj.beans.Utilisateur;

public interface UtilisateurDao {
	 	void creer( Utilisateur utilisateur ) throws DAOException;

	    Utilisateur trouver( String login ) throws DAOException;
	    
	    boolean existe (String login) throws DAOException;
}
