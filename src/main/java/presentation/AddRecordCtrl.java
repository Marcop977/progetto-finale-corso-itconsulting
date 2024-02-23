package presentation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Professore;
import model.Studente;
import service.AppelloService;
import service.AppelloServiceImpl;
import service.CorsoService;
import service.CorsoServiceImpl;
import service.PrenotazioneService;
import service.PrenotazioneServiceImpl;
import service.ProfessoreService;
import service.ProfessoreServiceImpl;
import service.StudenteService;
import service.StudenteServiceImpl;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet("/addRecord")
public class AddRecordCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	StudenteService serviceStud = new StudenteServiceImpl();
	ProfessoreService serviceProf = new ProfessoreServiceImpl();
	CorsoService serviceCorso = new CorsoServiceImpl();
	AppelloService serviceApp = new AppelloServiceImpl();
	PrenotazioneService servicePren = new PrenotazioneServiceImpl();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session;
		
		String usernameStudente = request.getParameter("usernameStudente");
		String passwordStudente = request.getParameter("passwordStudente");
		String nomeStudente = request.getParameter("nomeStudente");
		String cognomeStudente = request.getParameter("cognomeStudente");
		
		String usernameProf = request.getParameter("usernameProf");
		String passwordProf = request.getParameter("passwordProf");
		String nomeProf = request.getParameter("nomeProf");
		String cognomeProf = request.getParameter("cognomeProf");
		
		String corsoNome = request.getParameter("corso");
		String idProfessore = request.getParameter("idProfessore");
		
		String idCorso = request.getParameter("idCorso");
		String data = request.getParameter("data");
		
		String matricola = request.getParameter("matricola");
		String idAppello = request.getParameter("idAppello");

		//trasformo la stringa data in java.util.date e poi in java.sql.date
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date utilDate;
		java.sql.Date sqlDate = null;
		try {
		    if (data != null) { // Controlla se data è null prima di analizzarlo
		        utilDate = dateFormat.parse(data);
		        sqlDate = new java.sql.Date(utilDate.getTime());
		    }
		} catch (ParseException e) {
		    e.printStackTrace();
		}
		
		if(usernameStudente != "" && usernameStudente != null && passwordStudente != "" && passwordStudente != null && nomeStudente != "" && nomeStudente != null && cognomeStudente != "" && cognomeStudente != null) {
			if (!serviceStud.isStudentePresente(usernameStudente, passwordStudente)) {
				session = request.getSession(true);
				Studente s = new Studente();
				s.setUsername(usernameStudente);
				s.setPassword(passwordStudente);
				s.setNome(nomeStudente);
				s.setCognome(cognomeStudente);
				serviceStud.addStudente(s);
				session.setAttribute("tabellaAttiva", "studente");
				
			}
		}
		
		if(usernameProf != "" && usernameProf != null && passwordProf != "" && passwordProf != null && nomeProf != "" && nomeProf != null && cognomeProf != "" && cognomeProf != null) {
			if (!serviceProf.isProfPresente(usernameProf, passwordProf)) {
				session = request.getSession(true);
				Professore p = new Professore();
				p.setUsername(usernameProf);
				p.setPassword(passwordProf);
				p.setNome(nomeProf);
				p.setCognome(cognomeProf);
				serviceProf.addProfessore(p);
				session.setAttribute("tabellaAttiva", "professore");
				
			}
		}
		
		if (corsoNome != "" && corsoNome != null && idProfessore != "" && idProfessore != null) {
			if (!serviceCorso.isCPresente(corsoNome)) {
				session = request.getSession(true);
				session.setAttribute("tabellaAttiva", "corso");
				serviceCorso.addCorso(corsoNome, Integer.parseInt(idProfessore));
			}
		}
		
		//oltre a controllare che i parametri non siano vuoti, controllo anche che l'appello con la stessa materia e stessa data non sia stato già aggiunto
		if (data != "" && data != null && idCorso != "" && idCorso != null && !serviceApp.isAppPresente(Integer.parseInt(idCorso), sqlDate)) {
			session = request.getSession(true);
			session.setAttribute("tabellaAttiva", "appello");
			serviceApp.addAppello(data, Integer.parseInt(idCorso));
		}
		
		if (matricola != "" && matricola != null && idAppello != "" && idAppello != null && !servicePren.isPrenExists(Integer.parseInt(matricola), Integer.parseInt(idAppello))) {
			session = request.getSession(true);
			session.setAttribute("tabellaAttiva", "prenotazione");
			servicePren.addPrenotazione(Integer.parseInt(matricola), Integer.parseInt(idAppello));
		}
		
		request.getRequestDispatcher("segreteria.jsp").forward(request, response);
	}
	
}
