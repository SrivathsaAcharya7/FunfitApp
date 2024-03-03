package com.funfit.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.funfit.dboperations.BatchOperations;
import com.funfit.models.Batch;
import java.util.List;

@WebServlet("/BatchServlet")
public class BatchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BatchServlet() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getMethod();
		switch (method) {
		case "GET":
			handleGet(request, response);
			break;
		case "POST":
			handlePost(request, response);
			break;
		case "PUT":
			handlePut(request, response);
			break;
		case "DELETE":
			handleDelete(request, response);
			break;
		default:
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			break;
		}
	}

	private void handleGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		BatchOperations batchOperations = null;
		try {
			batchOperations = new BatchOperations();
			List<Batch> batches = batchOperations.viewAllBatches();
			request.setAttribute("batches", batches);

			request.getRequestDispatcher("ViewBatches.jsp").forward(request, response);
		} catch (Exception e) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
	}

	private void handlePost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("_method");
		if (method != null && method.equalsIgnoreCase("DELETE")) {
			handleDelete(request, response);
		} else if (method != null && method.equalsIgnoreCase("PUT")) {
			handlePut(request, response);
		} else {

			String name = request.getParameter("name");
			String time = request.getParameter("time");
			if (name != null && time != null) {
				Batch batch = new Batch();
				batch.setName(name);
				batch.setTime(time);

				BatchOperations batchOperations = null;
				try {
					batchOperations = new BatchOperations();
					String result = batchOperations.addNewBatch(batch);
					if (result.equals("Success")) {
						response.sendRedirect("ViewBatches.jsp");
						System.out.println("Forwarded to ViewBatches.jsp");
					} else {
						response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
					}
				} catch (Exception e) {
					response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
					e.printStackTrace();
				}
			} else {
				response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			}
		}
	}

	private void handlePut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String bidStr = request.getParameter("bid");
		String name = request.getParameter("name");
		String time = request.getParameter("time");
		if (bidStr != null && name != null && time != null) {
			int bid = Integer.parseInt(bidStr);
			Batch batch = new Batch();
			batch.setBid(bid);
			batch.setName(name);
			batch.setTime(time);

			BatchOperations batchOperations = null;
			try {
				batchOperations = new BatchOperations();
				String result = batchOperations.updateBatchNameAndTime(batch);
				if (result.equals("Success")) {
					response.sendRedirect("ViewBatches.jsp");
					System.out.println("Forwarded to ViewBatches.jsp");
				} else {
					response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				}
			} catch (Exception e) {
				response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				e.printStackTrace();
			}
		} else {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		}
	}

	private void handleDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String bidStr = request.getParameter("bid");
		if (bidStr != null) {
			int bid = Integer.parseInt(bidStr);
			BatchOperations batchOperations = null;
			try {
				batchOperations = new BatchOperations();
				String result = batchOperations.deleteBatch(bid);
				if (result.equals("Success")) {
					response.sendRedirect("ViewBatches.jsp");
				} else {
					response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				}
			} catch (Exception e) {
				response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				e.printStackTrace();
			}
		} else {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		}
	}
}
