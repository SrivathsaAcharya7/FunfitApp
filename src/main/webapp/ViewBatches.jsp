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
<title>View All Batches</title>

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
	margin-top: 50px;
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

	<%
	BatchOperations batch = new BatchOperations();
	List<Batch> batches = batch.viewAllBatches();
	pageContext.setAttribute("allbatches", batches);
	%>

	<div class="container">
		<h1 style="text-align: center;">View All Batches</h1>
		<br /> <br />
		<table class="table table-bordered">
			<thead>
				<tr>
					<th scope="col">Batch ID</th>
					<th scope="col">Batch Name</th>
					<th scope="col">Batch Time</th>
					<th scope="col">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="batch" items="${allbatches}">
					<tr>
						<td>${batch.bid}</td>
						<td>${batch.name}</td>
						<td>${batch.time}</td>
						<td>
							<form method="post" action="BatchServlet">
								<input type="hidden" name="_method" value="DELETE"> <input
									type="hidden" name="bid" value="${batch.bid}">
								<button type="submit" class="btn btn-danger" name="action"
									value="delete">Delete</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>
