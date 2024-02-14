<%@page import="model.Studente"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="presentation.AddStudenteCtrl"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	AddStudenteCtrl controller = new AddStudenteCtrl();
	%>

	<h1>Ciao</h1>
	
	<form action="addStudente" method="post">
	
		<input type="text" name="username" placeholder="username"><br>
		<input type="password" name="password" placeholder="password"><br>
		<input type="text" name="nome" placeholder="nome"><br>
		<input type="text" name="cognome" placeholder="cognome"><br>
		<input type="submit" value="add">	
	
	</form>
	
	<table>
	<% for (model.Studente s : controller.mostraStudenti()) { %>
	<tr>
		<td><%= s.getNome() %></td>
		<td><form action="deleteStudente" method="post">
		<input type="hidden" name="matricola" value="<%= s.getMatricola() %>">
		<button type="submit">X</button>
	</form></td>
	</tr>
	<% } %>
	</table>

</body>
</html>