<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.funfit.connection.DBConnection"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Batch</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(to right, #4facfe, #00f2fe);
	background-attachment: fixed;
}

.container {
	margin-top: 50px;
}

.card-form {
	background-color: #ffffff;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
	border-radius: 10px;
	max-width: 600px;
	margin: 0 auto;
}

.form-control {
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<jsp:include page="Navbar.jsp" />
	<div class="container">
		<div class="card card-form">
			<h1 class="card-title text-center mb-4">Update Batch</h1>
			<form id="updateBatchForm" method="Post" action="BatchServlet">
				<input type="hidden" name="_method" value="PUT">
				<div class="mb-3">
					<label for="batchId" class="form-label">Batch ID</label> <select
						class="form-select" id="batchId" name="bid" required>
						<option value="">Select batch ID to update</option>
						<%
						try {
							Connection conn = DBConnection.getConnection();
							Statement stmt = conn.createStatement();
							ResultSet rs = stmt.executeQuery("SELECT bid,name FROM Batch");
							while (rs.next()) {
								int batchId = rs.getInt("bid");
								String batchName = rs.getString("name");
						%>
						<option value="<%=batchId%>"><%=batchName%></option>
						<%
						}
						conn.close();
						} catch (Exception e) {
						e.printStackTrace();
						}
						%>
					</select>
				</div>
				<div class="mb-3">
					<label for="batchName" class="form-label">New Batch Name</label> <input
						type="text" class="form-control" id="batchName" name="name"
						placeholder="Enter new batch name" required>
				</div>
				<div class="mb-3">
					<label for="batchTime" class="form-label">New Batch Time</label> <select
						class="form-select" id="batchTime" name="time" required>
						<option value="">Select new batch time</option>
						<option value="Morning">Morning</option>
						<option value="Evening">Evening</option>
					</select>
				</div>
				<div class="text-center">
					<button type="submit" class="btn btn-primary">Update Batch</button>
				</div>
			</form>
		</div>
	</div>

</body>
</html>
