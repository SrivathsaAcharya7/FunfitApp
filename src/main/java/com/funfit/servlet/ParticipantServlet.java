package com.funfit.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.funfit.dboperations.ParticipantOperations;
import com.funfit.models.Participant;
import java.util.List;

@WebServlet("/ParticipantServlet")
public class ParticipantServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ParticipantServlet() {
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
		String batchName = request.getParameter("batchName");
		if (batchName != null) {

			ParticipantOperations participantOperations = null;
			try {
				participantOperations = new ParticipantOperations();
				List<Participant> participants = participantOperations.getParticipantsByBatchName(batchName);

				request.setAttribute("participants", participants);
				request.setAttribute("batchname", batchName);

				request.getRequestDispatcher("ViewParticipantsInBatch.jsp").forward(request, response);
			} catch (Exception e) {
				response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				e.printStackTrace();
			}
		} else {

			ParticipantOperations participantOperations = null;
			try {
				participantOperations = new ParticipantOperations();
				List<Participant> participants = participantOperations.viewAllParticipants();
				request.setAttribute("participants", participants);

				request.getRequestDispatcher("ViewParticipants.jsp").forward(request, response);
			} catch (Exception e) {
				response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				e.printStackTrace();
			}
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
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			String bidStr = request.getParameter("bid");
			if (name != null && phone != null && email != null && bidStr != null) {
				Participant participant = new Participant();
				participant.setName(name);
				participant.setPhone(phone);
				participant.setEmail(email);
				participant.setBid(Integer.parseInt(bidStr));

				ParticipantOperations participantOperations = null;
				try {
					participantOperations = new ParticipantOperations();
					String result = participantOperations.addNewParticipant(participant);
					if (result.equals("Success")) {
						response.sendRedirect("ViewParticipants.jsp");
						System.out.println("Forwarded to ViewParticipants.jsp");
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
		String pidStr = request.getParameter("pid");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String bidStr = request.getParameter("bid");
		if (pidStr != null && name != null && phone != null && email != null && bidStr != null) {
			int pid = Integer.parseInt(pidStr);
			Participant participant = new Participant();
			participant.setPid(pid);
			participant.setName(name);
			participant.setPhone(phone);
			participant.setEmail(email);
			participant.setBid(Integer.parseInt(bidStr));

			ParticipantOperations participantOperations = null;
			try {
				participantOperations = new ParticipantOperations();
				String result = participantOperations.updateParticipant(participant);
				if (result.equals("Success")) {
					response.sendRedirect("ViewParticipants.jsp");
					System.out.println("Forwarded to ViewParticipants.jsp");
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
		String pidStr = request.getParameter("pid");
		if (pidStr != null) {
			int pid = Integer.parseInt(pidStr);
			ParticipantOperations participantOperations = null;
			try {
				participantOperations = new ParticipantOperations();
				String result = participantOperations.deleteParticipant(pid);
				if (result.equals("Success")) {
					response.sendRedirect("ViewParticipants.jsp");
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
