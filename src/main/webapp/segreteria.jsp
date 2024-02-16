<%@page import="model.Studente"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="presentation.AddStudenteCtrl"%>
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="./css/style.css">
    <title>Document</title>
  </head>
  <body>
  
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
              <a href="logout" style="text-decoration: none;">Logout</a>
            </li>
          </ul>
        </div>
      </div>
    </div>

    <!-- benvenuto -->
    <div class="bg-primary p-5">
      <div class="container text-center">
        <h1 class="text-light">Segreteria</h1>
      </div>
    </div>
    
    <!-- scelta azione -->
	<div class="container">
	<button>Aggiungi Studente</button>
	<button id="btnProf">Aggiungi Professore</button>
	<button>Aggiungi Corso</button>
	<button>Aggiungi Studente</button>
	</div>
	
	<!-- anziché usare javascript, provare a nascondere/mostrare le tabelle con post per ciascun bottone, andando a settare tabellaAttiva -->
	<script>
		document.getElementById("btnProf").addEventListener("click", function(){
			document.querySelector(".studente").style.display = "none";
			document.querySelector(".corso").style.display = "none";
			document.querySelector(".appello").style.display = "none";
			document.querySelector(".professore").style.display = "block";
		});
	</script>

	<!-- aggiungi studente -->
	<div class="container my-5 studente">
		<div class="row">
		
		<div class="col-md-4 d-flex flex-column">
			<div class="bg-light p-5 rounded-3">
				<h3 class="mb-4">Aggiungi studente</h3>
				<form action="addStudente" method="post">
					<div class="w-100">
						<label>Nome:</label>
						<input type="text" name="nome" placeholder="" class="form-control"><br>
						<label>Cognome:</label>
						<input type="text" name="cognome" placeholder="" class="form-control"><br>
						<label>Username:</label>
						<input type="text" name="username" placeholder="" class="form-control"><br>
						<label>Password:</label>
						<input type="password" name="password" placeholder="" class="form-control"><br>
						<input type="submit" value="add" class="btn btn-success w-100">	
					</div>
				</form>
			</div>
			<a href="index.jsp" class="btn btn-primary mt-auto mb-3 w-50">Torna alla home</a>
		</div>
		
		<div class="col-md-1"></div>
		
		<% AddStudenteCtrl controller = new AddStudenteCtrl();%>	
		<div class="col-md-7">
		<table class="table">
			<thead>
				<tr>
					<th>Matricola</th>
					<th>Studente</th>
					<th>Username</th>
					<th>Password</th>
				</tr>
			</thead>
			<tbody>
				<% for (Studente s : controller.mostraStudenti()) { %>
				<tr>
					<th><%= s.getMatricola() %></th>
					<td><%= s.getNome() + " " + s.getCognome() %></td>
					<td><%= s.getUsername() %></td>
					<td><%= s.getPassword() %></td>
					<td>
					<form action="deleteStudente" method="post">
						<input type="hidden" name="matricola" value="<%= s.getMatricola() %>">
						<button type="submit" class="btn btn-danger"><i class="bi bi-trash3 fs-5"></i></button>
					</form>
					</td>
				</tr>
				<% } %>
			</tbody>
		</table>
		</div>
		</div>
	</div>
	
	<!-- aggiungi professore -->
	<div class="container my-5 professore">
		<div class="row">
		
		<div class="col-md-4 d-flex flex-column">
			<div class="bg-light p-5 rounded-3">
				<h3 class="mb-4">Aggiungi docente</h3>
				<form action="addStudente" method="post">
					<div class="w-100">
						<label>Nome:</label>
						<input type="text" name="nome" placeholder="" class="form-control"><br>
						<label>Cognome:</label>
						<input type="text" name="cognome" placeholder="" class="form-control"><br>
						<label>Username:</label>
						<input type="text" name="username" placeholder="" class="form-control"><br>
						<label>Password:</label>
						<input type="password" name="password" placeholder="" class="form-control"><br>
						<input type="submit" value="add" class="btn btn-success w-100">	
					</div>
				</form>
			</div>
			<a href="index.jsp" class="btn btn-primary mt-auto mb-3 w-50">Torna alla home</a>
		</div>
		
		<div class="col-md-1"></div>
		
		<!--  -->	
		<div class="col-md-7">
		<table class="table">
			<thead>
				<tr>
					<th>Matricola</th>
					<th>Studente</th>
					<th>Username</th>
					<th>Password</th>
				</tr>
			</thead>
			<tbody>

				<tr>
					<th></th>
					<td></td>
					<td></td>
					<td></td>
					<td>
					<form action="deleteStudente" method="post">
						<input type="hidden" name="matricola" value="">
						<button type="submit" class="btn btn-danger"><i class="bi bi-trash3 fs-5"></i></button>
					</form>
					</td>
				</tr>
			</tbody>
		</table>
		</div>
		</div>
	</div>
	
	
	
	<!-- Footer -->
    <footer
      class="text-center text-lg-start bg-light text-muted"
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
</body>
</html>