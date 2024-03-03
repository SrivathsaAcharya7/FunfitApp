<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page
	import="com.funfit.connection.*, com.funfit.models.*, com.funfit.dboperations.*, java.util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View All Participants In a Batch</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(to right, #4facfe, #00f2fe);
	background-attachment: fixed;
	color: #000;
}

.container {
	margin-top: 70px;
}

.table {
	background: rgba(255, 255, 255, 0.1);
	color: #000;
	border-radius: 20px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
}

.table-bordered th, .table-bordered td {
	border: 1px solid rgba(255, 255, 255, 0.1);
}

.table-bordered th {
	background: rgba(255, 255, 255, 0.5);
	color: #000;
}

.table-bordered tbody tr:nth-of-type(odd) {
	background: rgba(255, 255, 255, 0.3);
}

.table-bordered tbody tr:nth-of-type(even) {
	background: rgba(255, 255, 255, 0.2);
}
</style>
</head>
<body>
	<jsp:include page="Navbar.jsp" />
	<div class="container">
		<h1 style="text-align: center;">Participants In ${batchname }</h1>
		<br /> <br />
		<table class="table table-bordered">
			<thead>
				<tr>
					<th scope="col">Participant ID</th>
					<th scope="col">Name</th>
					<th scope="col">Phone</th>
					<th scope="col">Email</th>
					<th scope="col">Batch ID</th>

				</tr>
			</thead>
			<tbody>

				<c:forEach var="participant" items="${participants}">
					<tr>
						<td>${participant.pid}</td>
						<td>${participant.name}</td>
						<td>${participant.phone}</td>
						<td>${participant.email}</td>
						<td>${participant.bid}</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>
