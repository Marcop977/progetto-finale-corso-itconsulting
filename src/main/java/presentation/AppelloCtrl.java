package presentation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Appello;

import java.io.IOException;
import java.util.List;

import service.AppelloService;
import service.AppelloServiceImpl;

@WebServlet("/appello")
public class AppelloCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	AppelloService service = new AppelloServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("appello.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String materia = request.getParameter("materia");
		
		boolean trovato = false;
		
		if (materia != null) {
			for (Appello a : service.getAppelli()) {
				if (a.getIdAppello() == Integer.parseInt(materia)) {
					trovato = true;
					break;
				}
			}
		}
		
		if (trovato)
			doGet(request, response);
	}

	public List<Appello> mostraAppelli(){
		return service.getAppelli();
	}
}
