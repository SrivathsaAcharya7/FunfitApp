package com.funfit.dboperations;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.funfit.connection.DBConnection;
import com.funfit.models.Participant;

public class ParticipantOperations {
	private Connection connection = null;
	private PreparedStatement preparedStatement;

	public ParticipantOperations() throws Exception {
		connection = DBConnection.getConnection();
	}

	public String addNewParticipant(Participant participant) throws SQLException {
		String result = "Err";
		try {
			preparedStatement = connection
					.prepareStatement("INSERT INTO Participant(name, phone, email, bid) VALUES (?, ?, ?, ?)");
			preparedStatement.setString(1, participant.getName());
			preparedStatement.setString(2, participant.getPhone());
			preparedStatement.setString(3, participant.getEmail());
			preparedStatement.setInt(4, participant.getBid());

			int changes = preparedStatement.executeUpdate();
			if (changes >= 1)
				result = "Success";

		} catch (Exception e) {
			result = "Err";
			System.out.println(e);
		}
		return result;
	}

	public List<Participant> viewAllParticipants() {
		List<Participant> participantList = new ArrayList<>();
		Participant participant = null;
		try {
			preparedStatement = connection.prepareStatement("SELECT * FROM Participant");
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				participant = new Participant();
				participant.setPid(resultSet.getInt("pid"));
				participant.setName(resultSet.getString("name"));
				participant.setPhone(resultSet.getString("phone"));
				participant.setEmail(resultSet.getString("email"));
				participant.setBid(resultSet.getInt("bid"));
				participantList.add(participant);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return participantList;
	}

	public String updateParticipant(Participant participant) throws SQLException {
		String result = "Err";
		try {
			preparedStatement = connection.prepareStatement("UPDATE Participant SET name = ?, phone=?, email=?, bid=? WHERE pid = ?");
			preparedStatement.setString(1, participant.getName());
			preparedStatement.setString(2, participant.getPhone());
			preparedStatement.setString(3, participant.getEmail());
			preparedStatement.setInt(4, participant.getBid());
			preparedStatement.setInt(5, participant.getPid());
			int changes = preparedStatement.executeUpdate();
			if (changes >= 1)
				result = "Success";

		} catch (Exception e) {
			result = "Err";
			System.out.println(e);
		}
		return result;
	}

	public String deleteParticipant(int pid) throws SQLException {
		String result = "Err";
		try {
			preparedStatement = connection.prepareStatement("DELETE FROM Participant WHERE pid = ?");
			preparedStatement.setInt(1, pid);
			int changes = preparedStatement.executeUpdate();
			if (changes >= 1)
				result = "Success";

		} catch (Exception e) {
			result = "Err";
			System.out.println(e);
		}
		return result;
	}

	public List<Participant> getParticipantsByBatchName(String batchName) {
		List<Participant> participantList = new ArrayList<>();
		try {
			preparedStatement = connection
					.prepareStatement("SELECT p.* FROM Participant p JOIN Batch b ON p.bid = b.bid WHERE b.name = ?");
			preparedStatement.setString(1, batchName);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Participant participant = new Participant();
				participant.setPid(resultSet.getInt("pid"));
				participant.setName(resultSet.getString("name"));
				participant.setPhone(resultSet.getString("phone"));
				participant.setEmail(resultSet.getString("email"));
				participant.setBid(resultSet.getInt("bid"));
				participantList.add(participant);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return participantList;
	}

}
