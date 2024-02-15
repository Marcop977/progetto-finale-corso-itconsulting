<%@page import="model.Appello"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="presentation.AddStudenteCtrl" %>
<%@ page import="presentation.CorsoCtrl" %>
<%@ page import="model.Corso" %>
<%@page import="presentation.AppelloCtrl" %>
<%@page import="model.Studente" %>
<%@ page import="presentation.PrenotazioneCtrl" %>
<%@ page import="model.Prenotazione" %>
<%@page import="java.util.List" %>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Document</title>
  </head>
  <body>
  
  <% AddStudenteCtrl studCtrl = new AddStudenteCtrl();
  CorsoCtrl corsoCtrl = new CorsoCtrl();
  Studente s = (Studente) session.getAttribute("studente");
  System.out.println("Studente: " + s);
  AppelloCtrl controller = new AppelloCtrl();
  String prenExists = (String) request.getAttribute("errore");
  Integer tabellaAttiva = (Integer) request.getAttribute("tabellaAttiva");
  if (tabellaAttiva == null) {
	    tabellaAttiva = 1;
	}
  System.out.println(tabellaAttiva + " tabella attiva");%>
  
    <!-- navbar -->
    <div class="container mt-5">
      <div class="row align-items-center">
        <div class="col-6 pb-4">
          <a href="index.jsp"><img src="./img/logo.png" alt="" /></a>
        </div>
        <div class="col-6">
          <ul
            class="d-flex gap-5 d-flex align-items-center justify-content-end"
            style="list-style-type: none"
          >
            <li><a href="index.jsp" style="text-decoration: none">HOME</a></li>
            <li><a href="" style="text-decoration: none">ABOUT US</a></li>
            <li><a href="" style="text-decoration: none">SHORTCODE</a></li>
            <li><a href="" style="text-decoration: none">NEWS</a></li>
            <li>
              <a href="logout.jsp" style="text-decoration: none">Logout</a>
            </li>
          </ul>
        </div>
      </div>
    </div>

    <!-- benvenuto -->
    <div class="bg-primary p-5">
      <div class="container text-center">
        <h1 class="text-light">Area personale - Studente</h1>
      </div>
    </div>

   <!-- tabella corsi -->
   <div id="tabella1" <% if (tabellaAttiva != 1) out.print("style=\"display:none;\""); %>>
	    <div class="container my-5">
	      <h3 class="mb-3">Ciao <%= s.getNome() %> - qui i corsi:</h3>
	      <table class="table">
	        <thead>
	          <tr>
	            <th scope="col">ID corso</th>
	            <th scope="col">Materia</th>
	            <th scope="col">Nome docente</th>
	            <th scope="col">Cognome docente</th>
	          </tr>
	        </thead>
	        <tbody>
	          <% for (Corso c : corsoCtrl.mostraCorsi()) { 
	          %>
	          <tr>
	            <th scope="row"><%= c.getIdCorso() %></th>
	            <td><%= c.getMateria() %></td>
	            <td><%= c.getProfessore().getNome() %></td>
	            <td><%= c.getProfessore().getCognome() %></td>
	          </tr>
	          <% } %>
	        </tbody>
	      </table>
	    </div>
	

	<!-- prenotazione -->
	    <div class="container text-end">
	      <form action="appello" method="post">
	        <label for="" class="d-block"
	          >Inserisci l'appello che vuoi visualizzare:</label
	        >
	        <div class="d-flex justify-content-end mt-2">
	          <div class="input-group mb-3 w-25">
	            <input
	              type="number"
	              class="form-control"
	              placeholder="Inserisci appello"
	              name="materia"
	            />
	            <div class="input-group-append">
	              <button class="btn btn-outline-primary" type="submit">
	                Vai
	              </button>
	            </div>
	          </div>
	        </div>
	      </form>
	    </div>
	</div>
	
			  
		  
		  
		<!-- appelli disponibili -->
		<div id="tabella2" <% if (tabellaAttiva != 2) out.print("style=\"display:none;\""); %>>
		<% List<Appello> appelli = (List<Appello>) request.getAttribute("appelli"); %>
		<% if (appelli != null) { %>
		    <div class="container my-5">
				<% for (Appello a : appelli) { %>
		      <h3 class="mb-3">
		        Per l'esame di <span class="text-decoration-underline"><%= a.getCorsoId().getMateria()%></span> sono disponibili i seguenti appelli:
		      </h3>
		      <table class="table">
		        <thead>
		          <tr>
		            <th scope="col">ID Appello</th>
		            <th scope="col">Data</th>
		            <th scope="col">Materia</th>
		            <th scope="col">Docente</th>
		          </tr>
		        </thead>
		        <tbody>
		          <tr>
		            <th scope="row"><%= a.getIdAppello() %></th>
		            <td><%= a.getData() %></th>
		            <td><%= a.getCorsoId().getMateria() %></th>
		            <td><%= a.getCorsoId().getProfessore().getNome() + " " + a.getCorsoId().getProfessore().getCognome()%></td>
		          </tr>
				<% } %>
		        </tbody>
		      </table>
		    </div>
		    
			<!-- Prenota -->
		    <div class="container text-end">
		      <form action="prenota" method="post">
		        <label for="" class="d-block"
		          >Inserisci la prenotazione che vuoi effettuare:</label
		        >
		        <div class="d-flex justify-content-end mt-2">
		          <div class="input-group mb-3 w-25">
		            <input
		              type="number"
		              class="form-control"
		              placeholder="Inserisci prenotazione"
		              name="appello"
		            />
		            <div class="input-group-append">
		              <button id="btnPrenota" class="btn btn-outline-primary" type="submit">
		                Prenota
		              </button>
		            </div>
		          </div>
		        </div>
		      </form>
		    </div>
		<% } %>
		</div>
		
		
		<% PrenotazioneCtrl controllerPrenot = new PrenotazioneCtrl(); 
		Prenotazione p = (Prenotazione) request.getAttribute("prenotazione"); %>
		
		<div id="tabella3" <% if (tabellaAttiva != 3) out.print("style=\"display:none;\""); %>>
			<div class="container my-5">
		      <h3 class="mb-3">
				Prenotazione effettuata
		        
		      </h3>
		      <table class="table">
		        <thead>
		          <tr>
		            <th scope="col">Data</th>
		            <th scope="col">Materia</th>
		            <th scope="col">Studente</th>
		          </tr>
		        </thead>
		        <tbody>
		        <% if (p != null) {%>
		          <tr>
		            <td><%= p.getAppPrenotato().getData() %></th>
		            <td><%= p.getAppPrenotato().getCorsoId().getMateria() %></th>
		            <td><%= p.getStudPrenotato().getNome() + " " + p.getStudPrenotato().getCognome()%></td>
		          </tr>
				<% } %>
		        </tbody>
		      </table>
		      
		    <div class="d-flex justify-content-between">
			    <button type="button" class="btn btn-primary">Torna alla home</button>
			    <button type="button" class="btn btn-primary">Nuova prenotazione</button>
		    </div>
		    </div>
		</div>

		<% if (prenExists != null) {%>
			<div class="container">
				<h3 class="my-5">
					Prenotazione esistente. <a href="index.jsp">Torna alla home</a>
				</h3>
			</div>
			<div class="text-center">
				<i class="fa-solid fa-exclamation text-muted" style="font-size: 200px"></i>
			</div>
	
		<% } %>
	

	<!-- Footer -->
    <footer
      class="text-center text-lg-start bg-light text-muted fixed-bottom"
    >
      <section class="">
        <div class="container text-center text-md-start mt-5">
          <div class="row mt-3">
            <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
              <h6 class="text-uppercase fw-bold mb-4">
                <i class="fas fa-gem me-3"></i>Company name
              </h6>
              <p>
                Here you can use rows and columns to organize your footer
                content. Lorem ipsum dolor sit amet, consectetur adipisicing
                elit.
              </p>
            </div>

            <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
              <h6 class="text-uppercase fw-bold mb-4">Products</h6>
              <p>
                <a href="#!" class="text-reset">Angular</a>
              </p>
              <p>
                <a href="#!" class="text-reset">React</a>
              </p>
              <p>
                <a href="#!" class="text-reset">Vue</a>
              </p>
              <p>
                <a href="#!" class="text-reset">Laravel</a>
              </p>
            </div>

            <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
              <h6 class="text-uppercase fw-bold mb-4">Useful links</h6>
              <p>
                <a href="#!" class="text-reset">Pricing</a>
              </p>
              <p>
                <a href="#!" class="text-reset">Settings</a>
              </p>
              <p>
                <a href="#!" class="text-reset">Orders</a>
              </p>
              <p>
                <a href="#!" class="text-reset">Help</a>
              </p>
            </div>

            <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
              <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
              <p><i class="fas fa-home me-3"></i> New York, NY 10012, US</p>
              <p>
                <i class="fas fa-envelope me-3"></i>
                info@example.com
              </p>
              <p><i class="fas fa-phone me-3"></i> + 01 234 567 88</p>
              <p><i class="fas fa-print me-3"></i> + 01 234 567 89</p>
            </div>
          </div>
        </div>
      </section>
      <div
        class="text-center p-4"
        style="background-color: rgba(0, 0, 0, 0.05)"
      >
        © 2021 Copyright:
        <strong>Itconsulting</strong>
      </div>
    </footer>
    
    <script src="./js/script.js"></script>
</body>
</html>