package presentation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Prenotazione;

import java.io.IOException;
import java.util.List;

import service.PrenotazioneService;

import service.PrenotazioneServiceImpl;

@WebServlet("/addPrenotazione")
public class AddPrenotazioneCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	PrenotazioneService service = new PrenotazioneServiceImpl();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String matricola = request.getParameter("matricola");
		String idAppello = request.getParameter("idAppello");
		
		if (matricola != "" && idAppello != "" && !service.isPrenExists(Integer.parseInt(matricola), Integer.parseInt(idAppello))) {
			HttpSession session = request.getSession(true);
			session.setAttribute("tabellaAttiva", "prenotazione");
			service.addPrenotazione(Integer.parseInt(matricola), Integer.parseInt(idAppello));
		}
		
		request.getRequestDispatcher("segreteria.jsp").forward(request, response);
	}
	
	public List<Prenotazione> mostraPrenotazioni(){
		return service.getPrenotazioni();
	}

}
