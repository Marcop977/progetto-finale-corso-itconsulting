package presentation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Appello;
import model.Professore;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import service.AppelloService;
import service.AppelloServiceImpl;

@WebServlet("/appello")
public class AppelloCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	AppelloService service = new AppelloServiceImpl();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idCorso = request.getParameter("idCorso");
		String materia = request.getParameter("materia"); //appello
		String dataAppello = request.getParameter("dataAppello");
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date utilDate;
		java.sql.Date sqlDate = null;
		if (dataAppello != null && !dataAppello.isEmpty()) {
			try {
				utilDate = dateFormat.parse(dataAppello);
				sqlDate = new java.sql.Date(utilDate.getTime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		if (request.getParameter("add") != null) {
			if (idCorso != null && dataAppello != null && !service.isAppPresente(Integer.parseInt(idCorso), sqlDate)) {
				service.addAppello(dataAppello, Integer.parseInt(idCorso));
				request.setAttribute("tabellaAttiva", 1);
				request.setAttribute("appelloAggiunto", "Appello aggiunto");
				request.getRequestDispatcher("professore.jsp").forward(request, response);
			} else {
				request.setAttribute("tabellaAttiva", 1);
				request.setAttribute("appelloAggiunto", "C'è stato un errore. Appello già esistente");
				request.getRequestDispatcher("professore.jsp").forward(request, response);
			}
		}
		
		if (request.getParameter("view") != null) {
			if (idCorso != null) {
				List<Appello> appelli = service.getAppelliByIdCorso(Integer.parseInt(idCorso));
				request.setAttribute("appelli", appelli);
				request.setAttribute("tabellaAttiva", 2);
				request.getRequestDispatcher("professore.jsp").forward(request, response);
			}
		}
		
		if (materia != null) {
			List<Appello> appelli = service.getAppelliByIdCorso(Integer.parseInt(materia));
			request.setAttribute("appelli", appelli);
			request.setAttribute("tabellaAttiva", 2);
			request.getRequestDispatcher("studente.jsp").forward(request, response);
		}
	}

	public List<Appello> mostraAppelliByProf(Professore p){
		return service.getAppelliByProf(p);
	}
}
