package com.incapp.controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.incapp.model.DAO;

/**
 * Servlet implementation class SubmitFeedbackServlet
 */
@WebServlet("/SubmitFeedback")
public class SubmitFeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitFeedbackServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String orderId = request.getParameter("orderId");
        String feedbackContent = request.getParameter("feedback");

        // Create an instance of FeedbackDAO
        try {
			DAO feedbackDAO = new DAO();
			feedbackDAO.insertFeedback(orderId, feedbackContent);
		    response.setContentType("text/html");
            response.getWriter().println("<html><body><h1>Feedback Submitted Successfully</h1></body></html>");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.setContentType("text/html");
            response.getWriter().println("<html><body><h1>Error: Failed to submit feedback</h1></body></html>");
		}
	}

}
