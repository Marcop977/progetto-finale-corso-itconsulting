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

@WebServlet("/prenotazioni")
public class PrenAppelloCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	PrenotazioneService service = new PrenotazioneServiceImpl();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idAppello = request.getParameter("ID_appello");
		if (idAppello != null) {
			List<Prenotazione> prenotazioni = service.getPrenByAppId(Integer.parseInt(idAppello));
			request.setAttribute("prenotazioni", prenotazioni);
			request.setAttribute("tabellaAttiva", 3);
		}
		request.getRequestDispatcher("professore.jsp").forward(request, response);
	}

}
