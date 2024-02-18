package presentation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Appello;

import java.io.IOException;
import java.util.List;

import service.AppelloService;


import service.AppelloServiceImpl;

@WebServlet("/addAppello")
public class AddAppelloCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	AppelloService service = new AppelloServiceImpl();

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String data = request.getParameter("data");
		String idCorso = request.getParameter("idCorso");
		
		HttpSession session;
		
		if (data != "" && idCorso != "") {
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
