<%@page import="model.Prenotazione"%>
<%@page import="model.Appello"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="presentation.PrenotazioneCtrl" %>


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
    <title>Document</title>
  </head>
  <body>

<% PrenotazioneCtrl controller = new PrenotazioneCtrl(); %>

			<div class="container my-5">
				<% for (Prenotazione p : controller.mostraPrenotazioni()) { %>
		      <h3 class="mb-3">
		        
		      </h3>
		      <table class="table">
		        <thead>
		          <tr>
		            <th scope="col">ID Prenotazione</th>
		            <th scope="col">Data</th>
		            <th scope="col">Materia</th>
		            <th scope="col">Studente</th>
		          </tr>
		        </thead>
		        <tbody>
		          <tr>
		            <th scope="row"><%= p.getIdPrenotazione() %></th>
		            <td><%= p.getAppPrenotato().getData() %></th>
		            <td><%= p.getAppPrenotato().getCorsoId().getMateria() %></th>
		            <td><%= p.getStudPrenotato().getNome() + " " + p.getStudPrenotato().getCognome()%></td>
		          </tr>
				<% } %>
		        </tbody>
		      </table>
		    </div>

</body>
</html>