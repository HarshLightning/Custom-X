<%@ page import="java.sql.*" %>
<%@ page import="com.incapp.model.DAO" %> <!-- Import your DAO class package -->
<%
	String adminName=(String)session.getAttribute("adminName");
	if(adminName==null){
		session.setAttribute("msg", "Please Login First!");
		response.sendRedirect("index.jsp");
	}else{
%>
<!DOCTYPE html>
<html>
<head>
    <title>Krypturg</title>
  <link rel="icon" href="resources/Krypturg-logo.png" />

  <meta name="viewport" content="width=device-width, initial-scale=1">

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />

  <!-- font-awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/js/all.min.js" integrity="sha512-rpLlll167T5LJHwp0waJCh3ZRf7pO6IT1+LZOhAyP6phAirwchClbTZV3iqL3BMrVxIYRbzGTpli4rfxsCK6Vw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  
  <!-- AOS CSS & Script -->
  <script src="resources/aos/aos.js"></script>
  <link rel="stylesheet" href="resources/aos/aos.css"/>

  <!-- custom css -->
  <link rel="stylesheet" href="resources/custom.css">

  <meta name="author" content="Harsh Kumar" />
  <meta name="description" content="This is a website for Computers." />
  <meta name="keywords" content="" />
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 80%;
            margin: auto;
            padding: 20px;
        }
        .feedback {
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 20px;
        }
        .feedback h3 {
            margin-top: 0;
        }
        .feedback p {
            margin-bottom: 0;
        }
    </style>
</head>
<body>
<% 
		String msg=(String)session.getAttribute("msg");
	 	if(msg!=null){
	%>
			<p class="bg-warning p-2 text-center"> <%= msg %> </p>
	<%	
			session.setAttribute("msg", null);
	 	}
	%>
	
	
    <nav class="navbar navbar-expand-sm container my-3">
        <a href="AdminHome.jsp" class="navbar-brand">
          <img src="resources/icon.png" height="35px" alt="">
          <span>Kryp</span>turg
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#my-navbar">
          <i class="fa-solid fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="my-navbar">
            <ul class="navbar-nav mx-auto p-2">
              <li>
                <a href="AdminHome.jsp">Orders</a>
              </li>
              <li>
                <a href="Enquiries.jsp">Enquiries</a>
              </li>
              <li>
                <a href="Products.jsp">Products</a>
              </li>
              
				<li><a href="ViewProducts.jsp">View Products</a></li>
				<li>
                <a href="Feedback.jsp">Feedback</a>
              </li>
            </ul>
            <label id="call" href=""> 
            		Welcome: <b><%= adminName %></b>  
            		<a class="btn btn-sm btn-danger" href="Logout">Logout</a>
            </label>
        </div>
    </nav>

<div class="container">

<h1>Feedbacks</h1>

<%
    // Create an instance of DAO
    DAO dao = new DAO();

    try {
        // Retrieve all feedback from the feedback table
        ResultSet resultSet = dao.getAllFeedback();

        // Display feedbacks in an elegant way
        while (resultSet.next()) {
            String orderId = resultSet.getString("order_id");
            String feedbackContent = resultSet.getString("feedback_content");

            // Display each feedback as a card
%>
            <div class="feedback">
                <h3>Order ID: <%= orderId %></h3>
                <p><%= feedbackContent %></p>
            </div>
<%
        }

        // Close the result set
        resultSet.close();
    } catch (SQLException e) {
        e.printStackTrace();
        // Handle any errors that may occur while retrieving feedback
        out.println("<p>Error: Failed to retrieve feedback</p>");
    }
%>

</div>

</body>
</html>
<%
}
%>