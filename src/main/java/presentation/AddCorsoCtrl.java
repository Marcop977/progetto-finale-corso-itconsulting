package presentation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Corso;

import java.io.IOException;
import java.util.List;

import service.CorsoService;
import service.CorsoServiceImpl;
import service.ProfessoreService;
import service.ProfessoreServiceImpl;

@WebServlet("/addCorso")
public class AddCorsoCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	CorsoService service = new CorsoServiceImpl();
	ProfessoreService service1 = new ProfessoreServiceImpl();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String corsoNome = request.getParameter("corso");
		
		String idProfessore = request.getParameter("idProfessore");
		
		HttpSession session;
		
		if (corsoNome != "" && idProfessore != null) {
			if (!service.isCPresente(corsoNome)) {
				session = request.getSession(true);
				session.setAttribute("tabellaAttiva", "corso");
				service.addCorso(corsoNome, Integer.parseInt(idProfessore));
			}
		}
		
//		if (corsoNome != "" && profNome != "" && profCognome != "") {
//			//se il corso non esiste già, e se il professore esiste, allora creami un corso collegato a quel prof
//			if(!service.isCPresente(corsoNome) && service1.isProfPresenteNome(profNome, profCognome)) {
//				session = request.getSession(true);
//				session.setAttribute("tabellaAttiva", "corso");
//				int idProfessore = service1.getIdByNameSur(profNome, profCognome);
//				service.addCorso(corsoNome, idProfessore);
//			}
//		}
		
		request.getRequestDispatcher("segreteria.jsp").forward(request, response);
	}

	public List<Corso> mostraCorsi(){
		return service.getCorsi();
	}
}
