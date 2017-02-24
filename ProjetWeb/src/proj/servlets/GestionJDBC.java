package proj.servlets;

import java.io.IOException;
import java.util.List; 

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import proj.bdd.testJDBC;


public class GestionJDBC extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String ATT_MESSAGES = "messages";
    public static final String VUE          = "/WEB-INF/test_jdbc.jsp";

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        /* Initialisation de l'objet Java et récupération des messages */
        testJDBC test = new testJDBC();
        List<String> messages = test.executerTests( request );
        

        /* Enregistrement de la liste des messages dans l'objet requête */
        request.setAttribute( ATT_MESSAGES, messages );

        /* Transmission vers la page en charge de l'affichage des résultats */
        this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
    }


}
