<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ page import="java.sql.*"%>
<%@page import="model.Professore" %>
<%@page import="model.Corso" %>
<%@page import="model.Appello" %>
<%@page import="presentation.AppelloCtrl" %>
<%@page import="presentation.CorsoCtrl" %>
<%@page import="model.Prenotazione"%>
<%@page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Comparator" %>

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
    <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/style.css">
    <title>Document</title>
  </head>
  <body class="bg-light">
    <% Professore p = (Professore) session.getAttribute("professore");
    CorsoCtrl corsoController = new CorsoCtrl();
    AppelloCtrl appelloController = new AppelloCtrl();
    int tabellaAttiva = (Integer) request.getAttribute("tabellaAttiva");
    System.out.println(tabellaAttiva);
    String tabellaNome = "";
    
    if (tabellaAttiva != 1)
    	tabellaNome = "Prenotazioni";
    else
    	tabellaNome = "Corsi";		
    %>

    <!-- navbar -->
    <nav class="navbar navbar-expand-lg navbar-scroll pb-4 pt-5">
      <div class="container">
        <img src="./img/logo.png" alt="" loading="lazy" />
        <button
          class="navbar-toggler ps-0"
          type="button"
          data-mdb-toggle="collapse"
          data-mdb-target="#navbarExample01"
          aria-controls="navbarExample01"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span
            class="navbar-toggler-icon d-flex justify-content-start align-items-center"
          >
            <i class="fas fa-bars"></i>
          </span>
        </button>
        <div class="collapse navbar-collapse" id="navbarExample01">
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0 gap-3">
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="#pets">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="#adoptions"
                >About Us</a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="#foundation"
                >Shortcode</a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="#help">News</a>
            </li>
            <li class="nav-item">
              <a href="logout" class="nav-link"><i class="bi bi-box-arrow-in-left text-danger"></i> Logout</a
              >
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- benvenuto -->
    <div class="bg-primary p-5">
      <div class="container text-center">
        <h1 class="text-light">Area personale - Docente - <%=tabellaNome %></h1>
      </div>
    </div>

    <!-- tabella corsi -->	
	 <div class="container my-5" <% if (tabellaAttiva != 1) out.print("style=\"display:none;\""); %>>
	    <% for (Appello a : appelloController.mostraAppelliByProf(p)) { %>
		<% if (a != null) { %>
	    <div class="container mt-4">
		    <h3 class="mb-3">
		        Per la sua materia: <%= a.getCorsoId().getMateria() %> sono disponibili i seguenti appelli:
		    </h3>
	      <table class="table shadow">
	        <thead>
	          <tr>
	            <th scope="col" class="th-corsi bg-primary text-light">ID Appello</th>
	            <th scope="col" class="th-corsi bg-primary text-light">Data</th>
	            <th scope="col" class="th-corsi bg-primary text-light">Materia</th>
	            <th scope="col" class="th-corsi bg-primary text-light"></th>
	          </tr>
	        </thead>
	        <tbody>
	          <tr>
	            <th scope="row"><%= a.getIdAppello() %></th>
                <td><%= a.getData() %></td>
                <td><%= a.getCorsoId().getMateria() %></td>
                <td>
	            	<form action="prenotazioni" method="post">
	                	<input type="hidden" name="ID_appello" value="<%=a.getIdAppello() %>">
	                	<button class="btn btn-outline-primary" type="submit"><i class="bi bi-eye"></i></button>
                	</form>
                </td>
	          </tr>
	        </tbody>
	      </table>
	    </div>
	    <div class="container pt-5 mt-5 text-end">
	    <a href="logout">Logout</a>
	    </div>
	    <% } else { %>
		<div class="container my-5">
        <h3 class="mb-3">
	        Per la sua materia: <%= a.getCorsoId().getMateria() %> non ci sono appelli disponibili.
	    	</h3>
 		</div>
	    
		<% } } %>
		</div>
	
	
	
	
	
	
	
	
	
	
	


		
	<div class="container my-5" <% if (tabellaAttiva != 2) out.print("style=\"display:none;\""); %>>
		<% List<Prenotazione> prenotazioni = (List<Prenotazione>) request.getAttribute("prenotazioni"); 
			if (prenotazioni != null) {%>
        <% for (Prenotazione p1 : prenotazioni) { %>
        <div class="container mt-4">
		    <h3 class="mb-3">Per il corso di
		        <span class="text-decoration-underline"><%= p1.getAppPrenotato().getCorsoId().getMateria() %></span> in
		        data <%=p1.getAppPrenotato().getData() %> si sono prenotati i seguenti studenti:
	      	</h3>
	      	<% break; } %>
		    <table class="table shadow">
		        <thead>
		            <tr>
		                <th scope="col" class="th-corsi bg-primary text-light">Matricola</th>
		                <th scope="col" class="th-corsi bg-primary text-light">Nome</th>
		                <th scope="col" class="th-corsi bg-primary text-light">Cognome</th>
		            </tr>
	        </thead>
	        <tbody>
	        <% List<Prenotazione> prenotazioni2 = (List<Prenotazione>) request.getAttribute("prenotazioni");%>
	        
	        <% Collections.sort(prenotazioni2, new Comparator<Prenotazione>() {
	            	@Override
		            public int compare(Prenotazione p2, Prenotazione p3) {
		            	String matricola1 = Integer.toString(p2.getStudPrenotato().getMatricola());
		                String matricola2 = Integer.toString(p3.getStudPrenotato().getMatricola());
		                return matricola1.compareTo(matricola2);
		            }
	       		}); %>
	      
				<% for (Prenotazione p4 : prenotazioni) { %>
	            <tr>
	                <th scope="row"><%= p4.getStudPrenotato().getMatricola()  %></th>
	                <td><%= p4.getStudPrenotato().getNome()%></td>
	                <td><%= p4.getStudPrenotato().getCognome() %></td>
	            </tr>
	            <% } %>
	        </tbody>
	    	</table>
    	</div>
	    <div class="container pt-5 mt-5 d-flex justify-content-between">
		    <a href="javascript:void(0);" class="btnBack">Torna indietro</a>
		    <a href="logout">Logout/Torna alla home</a>
		</div>
		<% } %>
	</div>




 <!-- Footer -->
    <footer class="text-start text-light" style="background-color: #002046">
      <div class="container p-5">
        <div class="row p-5">
          <div class="col-lg-3">
            <a href=""><img src="./img/logo-2.png" alt="" /></a>
            <small class="d-block mt-3 mb-2" style="line-height: 1.8">
              Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est,
              perferendis aperiam! Adipisci voluptatum similique corporis.
            </small>
            <a href=""><i class="bi bi-facebook fs-5"></i></a>
            <a href=""><i class="bi bi-twitter ms-3 fs-5"></i></a>
            <a href=""><i class="bi bi-instagram ms-3 fs-5"></i></a>
            <a href=""><i class="bi bi-whatsapp ms-3 fs-5"></i></a>
          </div>
          <div class="col-lg-2">
            <h5>Quick Links</h5>
            <ul class="p-0" style="line-height: 2">
              <li>
                <small><a href="">Home</a></small>
              </li>
              <li>
                <small><a href="">Opening Hours</a></small>
              </li>
              <li>
                <small><a href="">Opening Hours</a></small>
              </li>
              <li>
                <small><a href="">Opening Hours</a></small>
              </li>
              <li>
                <small><a href="">Opening Hours</a></small>
              </li>
            </ul>
          </div>
          <div class="col-lg-2">
            <h5>Pages</h5>
            <ul class="p-0" style="line-height: 2">
              <li>
              	<small><a href="">Home</a></small>
              <li>
              <li>
                <small><a href="">Opening Hours</a></small>
              </li>
              <li>
                <small><a href="">Opening Hours</a></small>
              </li>
              <li>
                <small><a href="">Opening Hours</a></small>
              </li>
              <li>
                <small><a href="">Opening Hours</a></small>
              </li>
            </ul>
          </div>
          <div class="col-lg-5">
            <h5>Contact Us</h5>
            <div class="d-flex gap-3 mb-2 mt-3">
              <input
                type="text"
                placeholder="Name*"
                class="custom-input py-2"
              />
              <input
                type="text"
                placeholder="Email*"
                class="custom-input py-2"
              />
            </div>
            <input
              type="text"
              placeholder="Message*"
              class="custom-input pb-4"
              style="width: 91.5%"
            />
            <button type="button" class="btn btn-primary d-block mt-4 px-4">
              SEND
            </button>
          </div>
        </div>
      </div>
      <div class="bg-light py-3">
        <div class="row">
          <div class="col-12 text-center">
            <p class="text-dark m-0">
              © 2024 Copyright: <strong>Itconsulting</strong>
            </p>
          </div>
        </div>
      </div>
    </footer>
	 <script>
	 document.addEventListener("DOMContentLoaded", function() {
	        let btnsBack = document.querySelectorAll(".btnBack");
	        btnsBack.forEach(function(btnBack) {
	            btnBack.addEventListener("click", function() {
	                console.log("ciao");
	                window.history.back();
	            });
	        });
	  });  	      
    </script>    
  </body>
</html>
