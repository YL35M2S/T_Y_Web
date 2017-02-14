package conn;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class utilisateurDAO extends DAO<utilisateur>{
	
	
	String url = "jdbc:mysql://mysql.istic.univ-rennes1.fr:3306/base_17012949";
    String user = "user_17012949";
    String passwd = ":colokar";
    
	private Connection conn = DriverManager.getConnection(url, user, passwd);
	
	
	
	// update du profil utilisateur 
	public boolean update(utilisateur obj, String nom, String value){
		return false; 
			
	}; 
	
	public boolean update(utilisateur obj){
		
		 /*On crée l'objet avec la requête en paramètre. 
		  * L'utilisation de prepareStatement nous permet de créer une requête préalable avec les anciennes valeurs
		  * 
		  * 
		  * @return un booleen
		  * */
		 java.sql.PreparedStatement stmt = conn.prepareStatement(
				"UPDATE repertoire SET (login, mdp, nom, prenom) values (?,?,?,?)"
		 );
		//On remplace le premier trou par le Login
		 stmt.setString(1, "obj.getLogin()");
		//On remplace le 2e trou par le Mdp
		 stmt.setString(2, "obj.getMdp()");
		//On remplace le 3e trou par le getNom
		 stmt.setString(3, "obj.getNom()");
		//On remplace le 4e trou par le Prenom
		 stmt.setString(4, "obj.getPrenom()");
		 
		 
		 
		 stmt.executeUpdate();
		 conn.close();
	}; 
	
	public boolean delete(utilisateur obj){
		
		
		
		
	};  
	
}

