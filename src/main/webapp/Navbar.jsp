<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<style>
.navbar {
	background-color: black;
}

.navbar-brand {
	font-weight: bold;
	color: white;
	transition: transform 0.3s, background-color 0.3s;
}

.navbar-brand:hover {
	transform: scale(1.1);
	color: goldenrod;
}

.nav-link {
	font-size: 18px;
	color: white !important;
}

.dropdown-menu {
	background-color: #343a40;
	margin-right: 20px;
}

.dropdown-menu a {
	color: white !important;
}

.dropdown-menu a:hover {
	background-color: #212529 !important;
}
</style>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light">
		<div class="container-fluid">
			<div class="d-flex justify-content-between align-items-center w-100">
				<a class="navbar-brand" href="index.jsp">FunFit :)</a>
				<div>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarNav"
						aria-controls="navbarNav" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarNav">
						<ul class="navbar-nav">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" id="navbarDropdownBatch"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
									Batch </a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdownBatch">
									<li><a class="dropdown-item" href="AddBatch.jsp">Add
											Batch</a></li>
									<li><a class="dropdown-item" href="UpdateBatch.jsp">Update
											Batch</a></li>
								</ul></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" id="navbarDropdownParticipant"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
									Participant </a>
								<ul class="dropdown-menu"
									aria-labelledby="navbarDropdownParticipant">
									<li><a class="dropdown-item" href="AddParticipant.jsp">Add
											Participant</a></li>
									<li><a class="dropdown-item" href="UpdateParticipant.jsp">Update
											Participant</a></li>
								</ul></li>

							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" id="navbarDropdownView"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
									View </a>
								<ul class="dropdown-menu dropdown-menu-end"
									aria-labelledby="navbarDropdownView">
									<li><a class="dropdown-item" href="ViewParticipants.jsp">View
											Participants</a></li>
									<li><a class="dropdown-item" href="ViewBatches.jsp">View
											Batches</a></li>
									<li><a class="dropdown-item" href="ViewpInBatch.jsp">View
											Participants in batch</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</nav>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>