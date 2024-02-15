package presentation;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Appello;
import model.Prenotazione;
import model.Studente;

import java.io.IOException;
import java.util.List;

import service.AppelloServiceImpl;
import service.PrenotazioneService;
import service.PrenotazioneServiceImpl;
import service.AppelloService;

@WebServlet("/prenota")
public class PrenotazioneCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	PrenotazioneService service = new PrenotazioneServiceImpl();
	AppelloService service2 = new AppelloServiceImpl();
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.getRequestDispatcher("prenotazione.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session;
		
		if (request.getParameter("appello") != null) {
			int idAppello = Integer.parseInt(request.getParameter("appello"));
			session = request.getSession(true);
			Studente s = (Studente) session.getAttribute("studente");
			
			boolean esiste = service.isPrenExists(s, idAppello);
			
			if (!esiste) {
				request.setAttribute("tabellaAttiva", 3);
				service.addPrenByApp(s, idAppello);;
			} else {
				request.setAttribute("tabellaAttiva", 2);
				request.setAttribute("errore", "a");
			}
			request.getRequestDispatcher("studente.jsp").forward(request, response);
			
//			for (Appello a : service2.getAppelli()) {
//				if (Integer.parseInt(idAppello) == a.getIdAppello()) {
//					Prenotazione p = new Prenotazione();
//					session = request.getSession(true);
//					Studente s = (Studente) session.getAttribute("studente");
//					
//					p.setAppPrenotato(a);
//					p.setStudPrenotato(s);
//					request.setAttribute("prenotazione", p);
//					service.addPrenotazione(p);
//					
//					request.setAttribute("tabellaAttiva", 3);
//					request.getRequestDispatcher("studente.jsp").forward(request, response);
//					return;
//				}
//			}
		}
	}
	
//	public List<Prenotazione> mostraPrenotazioni(){
//		return service.getPrenotazioni();
//	}

}