package presentation;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Prenotazione;
import model.Studente;

import java.io.IOException;

import service.AppelloServiceImpl;
import service.PrenotazioneService;
import service.PrenotazioneServiceImpl;
import service.AppelloService;

@WebServlet("/prenota")
public class PrenotazioneCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	PrenotazioneService service = new PrenotazioneServiceImpl();
	AppelloService service2 = new AppelloServiceImpl();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session;
		
		if (request.getParameter("appello") != null) {
			int idAppello = Integer.parseInt(request.getParameter("appello"));
			session = request.getSession(true);
			Studente s = (Studente) session.getAttribute("studente");
			boolean esiste = service.isPrenExists(s.getMatricola(), idAppello);
			
			if (!esiste) {
				service.addPrenotazione(s.getMatricola(), idAppello);;
				Prenotazione p = service.getPrenByAppStud(idAppello, s); //dato l'appello prenotato e lo studente in sessione, dammi la prenotazione
				request.setAttribute("prenotazione", p);
				request.setAttribute("tabellaAttiva", 3);
			} else {
				request.setAttribute("tabellaAttiva", 3);
				request.setAttribute("errore", "a");
			}
			request.getRequestDispatcher("studente.jsp").forward(request, response);
		}
	}
}