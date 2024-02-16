package presentation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Appello;
import model.Professore;

import java.io.IOException;
import java.util.List;

import service.AppelloService;
import service.AppelloServiceImpl;

@WebServlet("/appello")
public class AppelloCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	AppelloService service = new AppelloServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("tabellaAttiva", 2);
		request.getRequestDispatcher("studente.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String materia = request.getParameter("materia"); //appello

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
