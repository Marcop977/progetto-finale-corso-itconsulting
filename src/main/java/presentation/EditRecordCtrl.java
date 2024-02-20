package presentation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import service.StudenteService;

import service.StudenteServiceImpl;

import service.ProfessoreService;


import service.ProfessoreServiceImpl;

@WebServlet("/updateRecord")
public class EditRecordCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	StudenteService service = new StudenteServiceImpl();
	ProfessoreService service1 = new ProfessoreServiceImpl();
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idUtente = request.getParameter("idUtente");
		String username = request.getParameter("usernameModifica");
		String password = request.getParameter("passwordModifica");
		String nome = request.getParameter("nomeModifica");
		String cognome = request.getParameter("cognomeModifica");
		String tipoStringa = request.getParameter("tipo_utente");
		char tipo = tipoStringa.charAt(0);
		System.out.println("tipo: " + tipo);
		
		HttpSession session;
		if (username != "" && password != "" && nome != "" && cognome != "" && service.isStudente(tipo)) {
			System.out.println("è studente");
			session = request.getSession(true);
			session.setAttribute("tabellaAttiva", "studente");
			service.updateStudente(Integer.parseInt(idUtente), nome, cognome, username, password);
		}
		
		if (username != "" && password != "" && nome != "" && cognome != "" && service1.isProfessore(tipo)) {
			System.out.println("è professore");
			session = request.getSession(true);
			session.setAttribute("tabellaAttiva", "professore");
			service1.updateProfessore(Integer.parseInt(idUtente), username, password, nome, cognome);
		}
		
		request.getRequestDispatcher("segreteria.jsp").forward(request, response);		
	}

}
