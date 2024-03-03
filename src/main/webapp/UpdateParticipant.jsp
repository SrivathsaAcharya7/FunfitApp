<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.funfit.connection.DBConnection"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Participant</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(to right, #4facfe, #00f2fe);
	background-attachment: fixed;
}

.container {
	margin-top: 45px;
}

.card-form {
	background-color: #ffffff;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	padding: 10px;
	border-radius: 10px;
	max-width: 600px;
	margin: 0 auto;
}

.form-control {
	margin-bottom: 20px;
}

.form-select {
	margin-bottom: 20px;
}

.dropdown-menu {
	background-color: #ffffff;
	border: none; /* Remove border */
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

.dropdown-item {
	color: #212529;
}

.dropdown-item:hover {
	background-color: #f8f9fa;
}
</style>
</head>
<body>
	<jsp:include page="Navbar.jsp" />
	<div class="container">
		<div class="card card-form">
			<h1 class="card-title text-center mb-4">Update Participant</h1>
			<form id="updateParticipantForm" method="Post"
				action="ParticipantServlet">
				<input type="hidden" name="_method" value="PUT">
				<div class="mb-3">
					<label for="participantId" class="form-label">Participant
						ID</label> <select class="form-select" id="participantId" name="pid"
						required>
						<option value="">Select participant ID</option>

						<%
						try {
							Connection conn = DBConnection.getConnection();
							Statement stmt = conn.createStatement();
							ResultSet rs = stmt.executeQuery("SELECT pid,name FROM Participant ORDER BY pid ASC");
							while (rs.next()) {
								int participantId = rs.getInt("pid");
								String pname = rs.getString("name");
						%>
						<option value="<%=participantId%>"><%=pname%></option>
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
					<label for="participantName" class="form-label">New
						Participant Name</label> <input type="text" class="form-control"
						id="participantName" name="name"
						placeholder="Enter new participant name" required>
				</div>
				<div class="mb-3">
					<label for="participantPhone" class="form-label">New
						Participant Phone</label> <input type="text" class="form-control"
						id="participantPhone" name="phone"
						placeholder="Enter new participant phone number" required>
				</div>
				<div class="mb-3">
					<label for="participantEmail" class="form-label">New
						Participant Email</label> <input type="email" class="form-control"
						id="participantEmail" name="email"
						placeholder="Enter new participant email address" required>
				</div>
				<div class="mb-3">
					<label for="batchId" class="form-label">New Batch ID</label> <select
						class="form-select" id="batchId" name="bid" required>
						<option value="">Select batch ID</option>

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
				<div class="text-center">
					<button type="submit" class="btn btn-primary">Update
						Participant</button>
				</div>
			</form>
		</div>
	</div>

</body>
</html>
