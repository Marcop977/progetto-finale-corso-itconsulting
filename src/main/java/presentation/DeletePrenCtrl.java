package presentation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import service.PrenotazioneService;

import service.PrenotazioneServiceImpl;

@WebServlet("/deletePrenotazione")
public class DeletePrenCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	PrenotazioneService service = new PrenotazioneServiceImpl();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idPren = request.getParameter("idpren");
		
		if (idPren != "") {
			HttpSession session = request.getSession(true);
			session.setAttribute("tabellaAttiva", "prenotazione");
			service.deletePrenotazione(Integer.parseInt(idPren));
		}
		
		request.getRequestDispatcher("segreteria.jsp").forward(request, response);
		
	}

}
