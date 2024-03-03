<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.funfit.connection.DBConnection"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Participants by Batch Name</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(to right, #4facfe, #00f2fe);
	background-attachment: fixed;
	color: #ffffff;
}

.card-form {
	background-color: rgba(255, 255, 255, 0.9);
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
	padding: 20px;
	border-radius: 10px;
	margin-bottom: 10px;
	max-width: 600px;
	margin: 0 auto;
}

.container {
	margin-top: 70px;
}
</style>
</head>
<body>
	<jsp:include page="Navbar.jsp" />
	<div class="container">
		<div class="card card-form">
			<h1 class="text-center mb-4">View Participants by Batch Name</h1>
			<form method="get" action="ParticipantServlet">
				<div class="mb-3">
					<label for="batchName" class="form-label">Select Batch
						Name:</label> <select class="form-select" id="batchName" name="batchName"
						required>
						<option value="">Select batch name</option>

						<%
						try {
							Connection conn = DBConnection.getConnection();
							Statement stmt = conn.createStatement();
							ResultSet rs = stmt.executeQuery("SELECT name FROM Batch");
							while (rs.next()) {
								String batchName = rs.getString("name");
						%>
						<option value="<%=batchName%>"><%=batchName%></option>
						<%
						}
						conn.close();
						} catch (Exception e) {
						e.printStackTrace();
						}
						%>
					</select>
				</div>
				<div style="text-align: center;">
					<button type="submit" class="btn btn-primary">View
						Participants</button>
				</div>

			</form>
		</div>
	</div>

</body>
</html>
