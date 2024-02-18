package presentation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Professore;

import java.io.IOException;
import java.util.List;

import service.ProfessoreService;

import service.ProfessoreServiceImpl;

@WebServlet("/addProfessore")
public class AddProfessoreCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ProfessoreService service = new ProfessoreServiceImpl();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		
		HttpSession session;
		
		if(username != "" && password != "" && nome != "" && cognome != "") {
			if (!service.isProfPresente(username, password)) {
				session = request.getSession(true);
				Professore p = new Professore();
				p.setUsername(username);
				p.setPassword(password);
				p.setNome(nome);
				p.setCognome(cognome);
				service.addProfessore(p);
				session.setAttribute("tabellaAttiva", "professore");
				
			}
		}
		
		request.getRequestDispatcher("segreteria.jsp").forward(request, response);
	}
	
	public List<Professore> mostraProfessori(){
		return service.getProfessori();
	}
}