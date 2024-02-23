package presentation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import service.StudenteService;
import service.StudenteServiceImpl;
import service.ProfessoreService;
import service.ProfessoreServiceImpl;
import service.CorsoService;
import service.CorsoServiceImpl;
import service.AppelloService;
import service.AppelloServiceImpl;
import service.PrenotazioneService;
import service.PrenotazioneServiceImpl;

@WebServlet("/updateRecord")
public class UpdateRecordCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	StudenteService service = new StudenteServiceImpl();
	ProfessoreService service1 = new ProfessoreServiceImpl();
	CorsoService service2 = new CorsoServiceImpl();
	AppelloService service3 = new AppelloServiceImpl();
	PrenotazioneService service4 = new PrenotazioneServiceImpl();
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//form studente e professore
		String idUtente = request.getParameter("idUtente");
		String username = request.getParameter("usernameModifica");
		String password = request.getParameter("passwordModifica");
		String nome = request.getParameter("nomeModifica");
		String cognome = request.getParameter("cognomeModifica");
		String tipoStringa = request.getParameter("tipo_utente");
		char tipo = 'z';
		if (tipoStringa != null) {
			tipo = tipoStringa.charAt(0);
		}
		//form corso
		String idCorso = request.getParameter("idCorso");
		String corsoNome = request.getParameter("corsoNome");
		String idProfessore = request.getParameter("idProfessore");
		
		//form appello
		String idAppello = request.getParameter("idAppello");
		String data = request.getParameter("data");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String idCorsoAppello = request.getParameter("idCorsoAppello");
		java.util.Date utilDate;
		java.sql.Date sqlDate = null;
		if (data != null) {
		    try {
		        utilDate = dateFormat.parse(data);
		        sqlDate = new java.sql.Date(utilDate.getTime());
		    } catch (ParseException e) {
		        e.printStackTrace();
		    }
		}
		
		
		//form prenotazione
		String idPrenotazione = request.getParameter("idPrenotazione");
		String matricolaPren = request.getParameter("matricolaPren");
		String idAppelloPren = request.getParameter("idAppelloPren");
		
		HttpSession session;
		if (username != "" && username != null && password != "" && password != null && nome != "" && nome != null && cognome != "" && cognome != null && tipoStringa != null && service.isStudente(tipo)) {
			session = request.getSession(true);
			session.setAttribute("tabellaAttiva", "studente");
			service.updateStudente(Integer.parseInt(idUtente), nome, cognome, username, password);
			request.getRequestDispatcher("segreteria.jsp").forward(request, response);		
			return;
		}
		
		if (username != "" && username != null && password != "" && password != null && nome != "" && nome != null && cognome != "" && cognome != null && service1.isProfessore(tipo)) {
			session = request.getSession(true);
			session.setAttribute("tabellaAttiva", "professore");
			service1.updateProfessore(Integer.parseInt(idUtente), username, password, nome, cognome);
			request.getRequestDispatcher("segreteria.jsp").forward(request, response);		
			return;
		}
		
		if (idCorso != "" && idCorso != null && corsoNome != "" && corsoNome != null && idProfessore != "" && idProfessore != null) {
			session = request.getSession(true);
			session.setAttribute("tabellaAttiva", "corso");
			service2.updateCorso(Integer.parseInt(idCorso), corsoNome, Integer.parseInt(idProfessore));
			request.getRequestDispatcher("segreteria.jsp").forward(request, response);		
			return;
		}
		
		if (data != "" && data != null && idCorsoAppello != "" && idCorsoAppello != null) {
			session = request.getSession(true);
			session.setAttribute("tabellaAttiva", "appello");
			service3.updateAppello(Integer.parseInt(idAppello), sqlDate, idCorsoAppello);
			request.getRequestDispatcher("segreteria.jsp").forward(request, response);		
			return;
		}
		
		if (idPrenotazione != "" && idPrenotazione != null && matricolaPren != "" && matricolaPren != null && idAppelloPren != "" && idAppelloPren != null) {
			session = request.getSession(true);
			session.setAttribute("tabellaAttiva", "prenotazione");
			service4.updatePrenotazione(Integer.parseInt(idPrenotazione), Integer.parseInt(matricolaPren), Integer.parseInt(idAppelloPren));
			request.getRequestDispatcher("segreteria.jsp").forward(request, response);		
			return;			
		}
	}

}
