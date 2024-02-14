package presentation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Prenotazione;

import java.io.IOException;
import java.util.List;

import service.PrenotazioneService;
import service.PrenotazioneServiceImpl;

@WebServlet("/prenota")
public class PrenotazioneCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	PrenotazioneService service = new PrenotazioneServiceImpl();
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("prenotazione.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idAppello = request.getParameter("appello");
		
		boolean trovato = false;
		
		if (idAppello != null) {
			for (Prenotazione p : service.getPrenotazioni()) {
				if (p.getIdPrenotazione() == Integer.parseInt(idAppello)) {
					trovato = true;
					break;
				}
			}
		}
		
		if (trovato)		
			doGet(request, response);
	}
	
	public List<Prenotazione> mostraPrenotazioni(){
		return service.getPrenotazioni();
	}

}
