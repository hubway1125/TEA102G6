package com.event.model;

import java.sql.*;
import java.util.*;

import database.DatabaseConnection_interface;

public class EventDAOJDBC implements EventDAO_interface, DatabaseConnection_interface {

	private static final String INSERT_PSTMT = "INSERT INTO EVENT VALUES ('EVENT'||LPAD(EVENT_SEQ.NEXTVAL, 5, '0'),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String UPDATE_PSTMT = "UPDATE EVENT SET BAND_ID=?," 
																 + "EVENT_TYPE=?," 
																 + "EVENT_SORT=?,"
																 + "EVENT_TITLE=?," 
																 + "EVENT_DETAIL=?," 
																 + "EVENT_POSTER=?,"
																 + "EVENT_AREA=?," 
																 + "EVENT_PLACE=?,"
																 + "EVENT_CITY=?," 
																 + "EVENT_CITYAREA=?," 
																 + "EVENT_ADDRESS=?," 
																 + "EVENT_START_TIME=?," 
																 + "EVENT_ON_TIME=?,"
																 + "EVENT_LAST_EDIT_TIME=?," 
																 + "EVENT_LAST_EDITOR=?," 
																 + "EVENT_STATUS=?,"
																 + "EVENT_SEAT=? WHERE EVENT_ID = ?";
	private static final String DELETE_PSTMT = "DELETE FROM EVENT WHERE EVENT_ID = ?";
	private static final String GET_ONE_PSTMT = "SELECT * FROM EVENT WHERE EVENT_ID = ?";
	private static final String GET_ALL_PSTMT = "SELECT * FROM EVENT";

	@Override
	public void insert(EventVO eventVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = con.prepareStatement(INSERT_PSTMT);

			pstmt.setString(1, eventVO.getBand_id());
			pstmt.setInt(2, eventVO.getEvent_type());
			pstmt.setInt(3, eventVO.getEvent_sort());
			pstmt.setString(4, eventVO.getEvent_title());
			pstmt.setString(5, eventVO.getEvent_detail());
			pstmt.setBytes(6, eventVO.getEvent_poster());
			pstmt.setInt(7, eventVO.getEvent_area());
			pstmt.setString(8, eventVO.getEvent_place());
			pstmt.setString(9, eventVO.getEvent_city());
			pstmt.setString(10, eventVO.getEvent_cityarea());
			pstmt.setString(11, eventVO.getEvent_address());
			pstmt.setTimestamp(12, eventVO.getEvent_start_time());
			pstmt.setTimestamp(13, eventVO.getEvent_on_time());
			pstmt.setTimestamp(14, eventVO.getEvent_last_edit_time());
			pstmt.setString(15, eventVO.getEvent_last_editor());
			pstmt.setInt(16, eventVO.getEvent_status());
			pstmt.setBytes(17, eventVO.getEvent_seat());

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
	public void update(EventVO eventVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = con.prepareStatement(UPDATE_PSTMT);

			pstmt.setString(1, eventVO.getBand_id());
			pstmt.setInt(2, eventVO.getEvent_type());
			pstmt.setInt(3, eventVO.getEvent_sort());
			pstmt.setString(4, eventVO.getEvent_title());
			pstmt.setString(5, eventVO.getEvent_detail());
			pstmt.setBytes(6, eventVO.getEvent_poster());
			pstmt.setInt(7, eventVO.getEvent_area());
			pstmt.setString(8, eventVO.getEvent_place());
			pstmt.setString(9, eventVO.getEvent_city());
			pstmt.setString(10, eventVO.getEvent_cityarea());
			pstmt.setString(11, eventVO.getEvent_address());
			pstmt.setTimestamp(12, eventVO.getEvent_start_time());
			pstmt.setTimestamp(13, eventVO.getEvent_on_time());
			pstmt.setTimestamp(14, eventVO.getEvent_last_edit_time());
			pstmt.setString(15, eventVO.getEvent_last_editor());
			pstmt.setInt(16, eventVO.getEvent_status());
			pstmt.setBytes(17, eventVO.getEvent_seat());
			pstmt.setString(18, eventVO.getEvent_id());

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
	public void delete(String event_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = con.prepareStatement(DELETE_PSTMT);

			pstmt.setString(1, event_id);

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
	public EventVO findByPrimaryKey(String event_id) {
		EventVO eventVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_PSTMT);

			pstmt.setString(1, event_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				eventVO = new EventVO();

				eventVO.setEvent_id(rs.getString("event_id"));
				eventVO.setBand_id(rs.getString("band_id"));
				eventVO.setEvent_type(rs.getInt("event_type"));
				eventVO.setEvent_sort(rs.getInt("event_sort"));
				eventVO.setEvent_title(rs.getString("event_title"));
				eventVO.setEvent_detail(rs.getString("event_detail"));
				eventVO.setEvent_poster(rs.getBytes("event_poster"));
				eventVO.setEvent_area(rs.getInt("event_area"));
				eventVO.setEvent_place(rs.getString("event_place"));
				eventVO.setEvent_city(rs.getString("event_city"));
				eventVO.setEvent_cityarea(rs.getString("event_cityarea"));
				eventVO.setEvent_address(rs.getString("event_address"));
				eventVO.setEvent_start_time(rs.getTimestamp("event_start_time"));
				eventVO.setEvent_on_time(rs.getTimestamp("event_on_time"));
				eventVO.setEvent_last_edit_time(rs.getTimestamp("event_last_edit_time"));
				eventVO.setEvent_last_editor(rs.getString("event_last_editor"));
				eventVO.setEvent_status(rs.getInt("event_status"));
				eventVO.setEvent_seat(rs.getBytes("event_seat"));
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
		return eventVO;
	}

	@Override
	public List<EventVO> getAll() {
		List<EventVO> list = new ArrayList();
		EventVO eventVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_PSTMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				eventVO = new EventVO();
				eventVO.setEvent_id(rs.getString("event_id"));
				eventVO.setBand_id(rs.getString("band_id"));
				eventVO.setEvent_type(rs.getInt("event_type"));
				eventVO.setEvent_sort(rs.getInt("event_sort"));
				eventVO.setEvent_title(rs.getString("event_title"));
				eventVO.setEvent_detail(rs.getString("event_detail"));
				eventVO.setEvent_poster(rs.getBytes("event_poster"));
				eventVO.setEvent_area(rs.getInt("event_area"));
				eventVO.setEvent_place(rs.getString("event_place"));
				eventVO.setEvent_city(rs.getString("event_city"));
				eventVO.setEvent_cityarea(rs.getString("event_cityarea"));
				eventVO.setEvent_address(rs.getString("event_address"));
				eventVO.setEvent_start_time(rs.getTimestamp("event_start_time"));
				eventVO.setEvent_on_time(rs.getTimestamp("event_on_time"));
				eventVO.setEvent_last_edit_time(rs.getTimestamp("event_last_edit_time"));
				eventVO.setEvent_last_editor(rs.getString("event_last_editor"));
				eventVO.setEvent_status(rs.getInt("event_status"));
				eventVO.setEvent_seat(rs.getBytes("event_seat"));

				list.add(eventVO); // Store the row in the list
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
		java.util.Date date = new java.util.Date();
		Timestamp timestamp = new Timestamp(date.getTime());
		EventDAOJDBC eventJDBCDAO = new EventDAOJDBC();
//		// 測試insert
//		EventVO eventVO1 = new EventVO();
//		eventVO1.setBand_id("BAND00000");
//		eventVO1.setEvent_type(3);
//		eventVO1.setEvent_sort(39);
//		eventVO1.setEvent_title("插入一個活動");
//		eventVO1.setEvent_detail("試著插入活動詳情");
//		eventVO1.setEvent_poster(null);
//		eventVO1.setEvent_area(3);
//		eventVO1.setEvent_place("大巨蛋");
//		eventVO1.setEvent_city("台北市");
//		eventVO1.setEvent_cityarea("信義區");
//		eventVO1.setEvent_address("忠孝東路四段501號");
//		eventVO1.setEvent_start_time(timestamp);
//		eventVO1.setEvent_on_time(timestamp);
//		eventVO1.setEvent_last_edit_time(timestamp);
//		eventVO1.setEvent_last_editor("band00001");
//		eventVO1.setEvent_status(0);
//		eventVO1.setEvent_seat(null);
//
//		eventJDBCDAO.insert(eventVO1);

//		// 測試更新、刪除
//		EventVO eventVO2 = new EventVO();
//		eventVO2.setEvent_id("EVENT00250");
//		eventVO2.setBand_id("BAND00000");
//		eventVO2.setEvent_type(3);
//		eventVO2.setEvent_sort(39);
//		eventVO2.setEvent_title("更新一個活動");
//		eventVO2.setEvent_detail("試著更新活動詳情");
//		eventVO2.setEvent_poster(null);
//		eventVO2.setEvent_area(3);
//		eventVO2.setEvent_place("大巨蛋");
//		eventVO2.setEvent_city("台北市");
//		eventVO2.setEvent_cityarea("信義");
//		eventVO2.setEvent_address("忠孝東路四段501號");
//		eventVO2.setEvent_start_time(timestamp);
//		eventVO2.setEvent_on_time(timestamp);
//		eventVO2.setEvent_last_edit_time(timestamp);
//		eventVO2.setEvent_last_editor("band00001");
//		eventVO2.setEvent_status(0);
//		eventVO2.setEvent_seat(null);
//		//測試更新
//		eventJDBCDAO.update(eventVO2);
//
//		//測試刪除
//		eventJDBCDAO.delete("EVENT00250");
//		//測試找單筆資料
//		EventVO eventVO3 = eventJDBCDAO.findByPrimaryKey("EVENT00000");
//		System.out.println(eventVO3.toString());
//
//		List<EventVO> rs = eventJDBCDAO.getAll();
//
//		for (EventVO i : rs) {
//			System.out.println(i.toString());
//		}
	}
}
