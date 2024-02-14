<%@page import="model.Appello"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="presentation.AppelloCtrl" %>
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
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/@icon/icofont@1.0.1-alpha.1/icofont.min.css"
    />
    <title>Document</title>
  </head>
  <body>
  
  <% AppelloCtrl controller = new AppelloCtrl(); %>
  
  
  	<!-- appelli disponibili -->
    <div class="container my-5">
		<% for (Appello a : controller.mostraAppelli()) { %>
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

</body>
</html>