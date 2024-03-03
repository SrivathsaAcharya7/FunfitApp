<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome Page</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(to right, #4facfe, #00f2fe);
	/* Gradient background */
	background-attachment: fixed;
}

.welcome-text {
	text-align: center;
	color: white;
	margin-top: 50px;
}
</style>
</head>
<body>

	<jsp:include page="Navbar.jsp" />

	<div class="container welcome-text">
		<h1>Welcome to Funfit</h1>
	</div>
</body>
</html>


