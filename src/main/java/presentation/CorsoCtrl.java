package presentation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Corso;
import model.Professore;

import java.io.IOException;
import java.util.List;

import service.CorsoService;

import service.CorsoServiceImpl;

@WebServlet("/corsi")
public class CorsoCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	CorsoService service = new CorsoServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		Professore p = (Professore) request.getAttribute("professore");
//		
//		if (p != null) {
//			List<Corso> corsi = service.getCorsiByProf(p);
//			
//		}
		
		
		doGet(request, response);
	}
	
	public List<Corso> mostraCorsi() {  //mostraCorsi collegati ai prof
		return service.getCorsi();
	}

}
