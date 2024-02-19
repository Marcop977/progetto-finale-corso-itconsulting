package presentation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Appello;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import service.AppelloService;


import service.AppelloServiceImpl;

@WebServlet("/addAppello")
public class AddAppelloCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	AppelloService service = new AppelloServiceImpl();

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idCorso = request.getParameter("idCorso");
		String data = request.getParameter("data");

		//trasformo la stringa data in java.util.date e poi in java.sql.date
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date utilDate;
		java.sql.Date sqlDate = null;
		try {
		    utilDate = dateFormat.parse(data);
		    sqlDate = new java.sql.Date(utilDate.getTime());
		} catch (ParseException e) {
		    e.printStackTrace();
		}
		
		HttpSession session;
		
		//oltre a controllare che i parametri non siano vuoti, controllo anche che l'appello con la stessa materia e stessa data non sia stato già aggiunto
		if (data != "" && idCorso != "" && !service.isAppPresente(Integer.parseInt(idCorso), sqlDate)) {
			session = request.getSession(true);
			session.setAttribute("tabellaAttiva", "appello");
			service.addAppello(data, Integer.parseInt(idCorso));
		}

		request.getRequestDispatcher("segreteria.jsp").forward(request, response);
		
	}
	
	public List<Appello> mostraAppelli(){
		return service.getAppelli();
	}

}
