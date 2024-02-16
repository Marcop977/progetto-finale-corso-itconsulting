package presentation;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Studente;
import service.StudenteService;
import service.StudenteServiceImpl;

@WebServlet("/addStudente")
public class AddStudenteCtrl extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	StudenteService service = new StudenteServiceImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.getRequestDispatcher("segreteria.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("username") != null && request.getParameter("password") != null && request.getParameter("nome") != null && request.getParameter("cognome") != null) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String nome = request.getParameter("nome");
			String cognome = request.getParameter("cognome");
			System.out.println(username + password);
			
			if (!service.isStudentePresente(username, password)) {
				Studente s = new Studente();
				s.setUsername(username);
				s.setPassword(password);
				s.setNome(nome);
				s.setCognome(cognome);
				service.addStudente(s);
			}
		}
		
		request.getRequestDispatcher("segreteria.jsp").forward(request, response);
	}

	public List<Studente> mostraStudenti(){
		return service.getStudenti();
	}	
}
