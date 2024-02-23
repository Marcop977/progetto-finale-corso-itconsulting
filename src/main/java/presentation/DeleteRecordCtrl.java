package presentation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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

@WebServlet("/deleteRecord")
public class DeleteRecordCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	StudenteService serviceStud = new StudenteServiceImpl();
	ProfessoreService serviceProf = new ProfessoreServiceImpl();
	CorsoService serviceCorso = new CorsoServiceImpl();
	AppelloService serviceApp = new AppelloServiceImpl();
	PrenotazioneService servicePren = new PrenotazioneServiceImpl();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String matricolaParametro = request.getParameter("matricola");
		String idProfessoreStr = request.getParameter("idProfessore");
		String idCorso = request.getParameter("idCorso");
		String idAppello = request.getParameter("idAppello");
		String idPren = request.getParameter("idpren");
		HttpSession session;
		
		if (matricolaParametro != null && matricolaParametro != "") {
			int matricola = Integer.parseInt(matricolaParametro);
			session = request.getSession(true);
			session.setAttribute("tabellaAttiva", "studente");
			serviceStud.deleteStudenteById(matricola);
		}
		
		if (idProfessoreStr != null && idProfessoreStr != "") {
			session = request.getSession(true);
			session.setAttribute("tabellaAttiva", "professore");
			serviceProf.deleteProfById(Integer.parseInt(idProfessoreStr));
		}
		
		if (idCorso != null && idCorso != "") {
			session = request.getSession(true);
			session.setAttribute("tabellaAttiva", "corso");
			serviceCorso.deleteCorsoById(Integer.parseInt(idCorso));
		}
		
		if (idAppello != null && idAppello != "") {
			session = request.getSession(true);
			session.setAttribute("tabellaAttiva", "appello");
			serviceApp.deleteAppelloById(Integer.parseInt(idAppello));
		}
		
		if (idPren != null && idPren != "") {
			session = request.getSession(true);
			session.setAttribute("tabellaAttiva", "prenotazione");
			servicePren.deletePrenotazione(Integer.parseInt(idPren));
		}
		
		request.getRequestDispatcher("segreteria.jsp").forward(request, response);
	}

}
