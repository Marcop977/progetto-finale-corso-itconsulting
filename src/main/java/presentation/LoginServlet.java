package presentation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Admin;
import model.Professore;
import model.Studente;
import service.ProfessoreServiceImpl;
import service.StudenteService;
import service.StudenteServiceImpl;

import java.io.IOException;

import service.ProfessoreService;

import service.CorsoService;

import service.CorsoServiceImpl;

import service.AdminService;

import service.AdminServiceImpl;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	StudenteService service = new StudenteServiceImpl();
	ProfessoreService service2 = new ProfessoreServiceImpl();
	CorsoService service3 = new CorsoServiceImpl();
	AdminService service4 = new AdminServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		request.setAttribute("tabellaAttiva", 1);
//		request.getRequestDispatcher("studente.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// spostare tutta questa logica nella jsp

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		HttpSession session = request.getSession(true);

		boolean studenteTrovato = false;
		boolean profTrovato = false;

		for (Studente s : service.getStudenti()) {
			if (s.getUsername().equals(username) && s.getPassword().equals(password)) {
				session.setAttribute("studente", s);
				studenteTrovato = true;
				break;
			}
		}

		for (Professore p : service2.getProfessori()) {
			if (p.getUsername().equals(username) && p.getPassword().equals(password)) {
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

		// rifare query per trovare studente e prof. Farli come ho fatto con admin

		Admin a = service4.getAdminByUsern(username, password);
		if (a != null) {
			request.setAttribute("tabellaAttiva", 1);
			session.setAttribute("admin", a);
			request.getRequestDispatcher("segreteria.jsp").forward(request, response);
			return;
		}
	}

}