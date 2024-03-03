<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Batch</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(to right, #4facfe, #00f2fe);
	/* Gradient background */
	background-attachment: fixed;
}

.container {
	margin-top: 50px;
}

.card-form {
	background-color: #ffffff; /* White background for the card */
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* Card shadow */
	padding: 20px;
	border-radius: 10px;
}

.form-control {
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<jsp:include page="Navbar.jsp" />
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card card-form">
					<h1 class="card-title text-center mb-4">Add Batch</h1>
					<form id="addBatchForm" method="post" action="BatchServlet">
						<div class="mb-3">
							<label for="batchName" class="form-label">Batch Name</label> <input
								type="text" class="form-control" id="batchName" name="name"
								placeholder="Enter batch name" required>
						</div>
						<div class="mb-3">
							<label for="batchTime" class="form-label">Batch Time</label> <select
								class="form-select" id="batchTime" name="time" required>
								<option value="">Select batch time</option>
								<option value="Morning">Morning</option>
								<option value="Evening">Evening</option>
							</select>
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-primary">Add Batch</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
