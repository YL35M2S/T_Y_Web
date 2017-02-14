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

/**
 * Servlet implementation class connect
 */
@WebServlet("/connect")
public class connect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public connect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	
		response.setContentType("text/html");
		
		String utilisateur=request.getParameter("pseudo");
		String mdp=request.getParameter("pass");
		
		
		
		try {
		    Class.forName("com.mysql.jdbc.Driver");
		    System.out.println("Driver O.K.");

		    String url = "jdbc:mysql://mysql.istic.univ-rennes1.fr:3306/base_17012949";
		    String user = "user_17012949";
		    String passwd = ":colokar";

		    Connection conn = DriverManager.getConnection(url, user, passwd);

		    System.out.println("Connexion effective !");   
		    java.sql.Statement stmt = conn.createStatement();		         
		   ResultSet rst= stmt.executeQuery("SELECT * FROM repertoire Where Login='"+utilisateur+"' and MDP='"+mdp+"'");
		   
		   boolean resultatOK=false;
		   HttpSession session = request.getSession(true); 
		   

		    while(rst.next()){
		    
		    	session.setAttribute("login",rst.getString("Login"));
		    	session.setAttribute("mdp",rst.getString("MDP"));
		    	session.setAttribute("email",rst.getString("Email"));
		    	session.setAttribute("ad",rst.getString("Adresse"));
		    	session.setAttribute("cp",rst.getString("Cp"));
		    	session.setAttribute("ville",rst.getString("Ville"));
		    	
		    	resultatOK=true;
		    	
			}
		    
		    if (resultatOK==true){
		    	
			
		    	RequestDispatcher requestDispatcher = request.getRequestDispatcher("bonjour.jsp") ;

				requestDispatcher.forward(request, response);
		    }
		    else {response.sendRedirect("http://localhost:8080/ProjetWeb/accueil.jsp");}
		   
		conn.close();
	    
	    } 
		catch (Exception e) {e.printStackTrace();}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
