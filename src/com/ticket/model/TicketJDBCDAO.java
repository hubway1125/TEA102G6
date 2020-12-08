package com.ticket.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import database.DatabaseConnection_interface;


public class TicketJDBCDAO implements TicketDAO_interface, DatabaseConnection_interface {

	private static final String INSERT_PSTMT = "INSERT INTO TICKET VALUES ('TICKET'||LPAD(TICKET_SEQ.NEXTVAL, 5, '0'), ?, ?, ?, ?, ?, ?,?,?)";
	private static final String UPDATE = "UPDATE TICKET SET EVENT_ID=?,TICKET_SORT=?,TICKET_NAME=?,TICKET_AMOUNT=?,TICKET_PRICE=?,TICKET_ENDSALE_TIME=?,TICKET_EDIT_TIME=?,TICKET_STATUS=? WHERE TICKET_ID=? ";
	private static final String DELETE = "DELETE FROM TICKET WHERE TICKET_ID = ?";
	private static final String GET_ONE_PSTMT = "SELECT * FROM  TICKET WHERE TICKET_ID= ?";
	private static final String GET_ALL_PSTMT = "SELECT * FROM TICKET ";

	@Override
	public void insert(TicketVO ticketVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = con.prepareStatement(INSERT_PSTMT);

			pstmt.setString(1, ticketVO.getEvent_id());
			pstmt.setInt(2, ticketVO.getTicket_sort());
			pstmt.setString(3, ticketVO.getTicket_name());
			pstmt.setInt(4, ticketVO.getTicket_amount());
			pstmt.setInt(5, ticketVO.getTicket_price());
			pstmt.setTimestamp(6, ticketVO.getTicket_endsale_time());
			pstmt.setTimestamp(7, ticketVO.getTicket_edit_time());
			pstmt.setInt(8, ticketVO.getTicket_status());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void update(TicketVO ticketVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, ticketVO.getEvent_id());
			pstmt.setInt(2, ticketVO.getTicket_sort());
			pstmt.setString(3, ticketVO.getTicket_name());
			pstmt.setInt(4, ticketVO.getTicket_amount());
			pstmt.setInt(5, ticketVO.getTicket_price());
			pstmt.setTimestamp(6, ticketVO.getTicket_endsale_time());
			pstmt.setTimestamp(7, ticketVO.getTicket_edit_time());
			pstmt.setInt(8, ticketVO.getTicket_status());
			pstmt.setString(9, ticketVO.getTicket_id());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void delete(String ticket_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, ticket_id);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public TicketVO findByPrimaryKey(String ticket_id) {
		TicketVO ticketVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_PSTMT);

			pstmt.setString(1, ticket_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ticketVO = new TicketVO();
				ticketVO.setTicket_id(rs.getString("ticket_id"));
				ticketVO.setEvent_id(rs.getString("event_id"));
				ticketVO.setTicket_sort(rs.getInt("ticket_sort"));
				ticketVO.setTicket_name(rs.getString("ticket_name"));
				ticketVO.setTicket_amount(rs.getInt("ticket_amount"));
				ticketVO.setTicket_price(rs.getInt("ticket_price"));
				ticketVO.setTicket_endsale_time(rs.getTimestamp("ticket_endsale_time"));
				ticketVO.setTicket_edit_time(rs.getTimestamp("ticket_edit_time"));
				ticketVO.setTicket_status(rs.getInt("ticket_status"));

			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return ticketVO;
	}

	@Override
	public List<TicketVO> getAll() {
		List<TicketVO> list = new ArrayList<TicketVO>();
		TicketVO ticketVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_PSTMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ticketVO = new TicketVO();
				ticketVO.setTicket_id(rs.getString("ticket_id"));
				ticketVO.setEvent_id(rs.getString("event_id"));
				ticketVO.setTicket_sort(rs.getInt("ticket_sort"));
				ticketVO.setTicket_name(rs.getString("ticket_name"));
				ticketVO.setTicket_amount(rs.getInt("ticket_amount"));
				ticketVO.setTicket_price(rs.getInt("ticket_price"));
				ticketVO.setTicket_endsale_time(rs.getTimestamp("ticket_endsale_time"));
				ticketVO.setTicket_edit_time(rs.getTimestamp("ticket_edit_time"));
				ticketVO.setTicket_status(rs.getInt("ticket_status"));
				list.add(ticketVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	public static void main(String[] args) {
//		Date date = new Date();
//		Timestamp timestamp = new Timestamp(date.getTime());
//		TicketJDBCDAO ticketJDBCDAO = new TicketJDBCDAO();

//		 // TEST INSERT
//		TicketVO ticketVO1 = new TicketVO();
//		ticketVO1.setEvent_id("EVENT00000");
//		ticketVO1.setTicket_sort(29);
//		ticketVO1.setTicket_name("票種insert");
//		ticketVO1.setTicket_amount(3000);
//		ticketVO1.setTicket_price(3000);
//		ticketVO1.setTicket_endsale_time(timestamp);
//		ticketVO1.setTicket_edit_time(timestamp);
//		ticketVO1.setTicket_status(1);
//
//		ticketJDBCDAO.insert(ticketVO1);

//		// TEST UPDATE
//		TicketVO ticketVO2 = new TicketVO();
//		ticketVO2.setTicket_id("TICKET00200");
//		ticketVO2.setEvent_id("EVENT00000");
//		ticketVO2.setTicket_sort(29);
//		ticketVO2.setTicket_name("票種update");
//		ticketVO2.setTicket_amount(3000);
//		ticketVO2.setTicket_price(3000);
//		ticketVO2.setTicket_endsale_time(timestamp);
//		ticketVO2.setTicket_edit_time(timestamp);
//		ticketVO2.setTicket_status(1);
//
//		ticketJDBCDAO.update(ticketVO2);

		// TEST DELETE
//		ticketJDBCDAO.delete("TICKET00200");

//		// GET ONE
//		TicketVO ticketVO3 = ticketJDBCDAO.findByPrimaryKey("TICKET00350");
//		System.out.println(ticketJDBCDAO.findByPrimaryKey("TICKET00350").toString());
//		
//		// GET ALL
//		List<TicketVO> allTickets = ticketJDBCDAO.getAll();
//		for(TicketVO ticketVO:allTickets) {
//			System.out.println(ticketVO.toString());
//		}
	}
}
