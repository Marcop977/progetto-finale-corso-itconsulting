package presentation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Studente;
import service.StudenteService;
import service.StudenteServiceImpl;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	StudenteService service = new StudenteServiceImpl();


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("studente.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		HttpSession session;
		
		boolean trovato = false;
		
		for (Studente s : service.getStudenti()) {
			if (s.getUsername().equals(username) && s.getPassword().equals(password)) {
				session = request.getSession(true);
				session.setAttribute("studente", s);
				trovato = true;
				break;
			}
		}
		
		if (trovato)
			doGet(request, response);
		
	}

}
