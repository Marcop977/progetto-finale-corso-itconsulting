package presentation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Professore;
import model.Studente;
import service.ProfessoreServiceImpl;
import service.StudenteService;
import service.StudenteServiceImpl;

import java.io.IOException;

import service.ProfessoreService;

import service.CorsoService;

import service.CorsoServiceImpl;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	StudenteService service = new StudenteServiceImpl();
	ProfessoreService service2 = new ProfessoreServiceImpl();
	CorsoService service3 = new CorsoServiceImpl();


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setAttribute("tabellaAttiva", 1);
//		request.getRequestDispatcher("studente.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//spostare tutta questa logica nella jsp
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		HttpSession session;
		
		boolean studenteTrovato = false;
		boolean profTrovato = false;
		
		for (Studente s : service.getStudenti()) {
			if (s.getUsername().equals(username) && s.getPassword().equals(password)) {
				session = request.getSession(true);
				session.setAttribute("studente", s);
				studenteTrovato = true;
				break;
			}
		}
		
		for (Professore p : service2.getProfessori()) {
			if (p.getUsername().equals(username) && p.getPassword().equals(password)) {
				session = request.getSession(true);
				session.setAttribute("professore", p);
				profTrovato = true;
				break;
			}
		}
		
		if (studenteTrovato) {
			request.setAttribute("tabellaAttiva", 1);
			request.getRequestDispatcher("studente.jsp").forward(request, response);
		}
		
		if (profTrovato) {
			request.setAttribute("tabellaAttiva", 1);
			request.getRequestDispatcher("professore.jsp").forward(request, response);
		}
		
	}

}
