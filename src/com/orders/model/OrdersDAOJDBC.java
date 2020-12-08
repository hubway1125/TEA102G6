package com.orders.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import database.DatabaseConnection_interface;

public class OrdersDAOJDBC implements OrdersDAO_interface, DatabaseConnection_interface {

	private static final String INSERT_PSTMT = "INSERT INTO ORDERS VALUES('ORDERS'||LPAD(ORDERS_SEQ.NEXTVAL, 5, '0'),?,?,?,?,?,?,?,?)";

	private static final String UPDATE = "UPDATE ORDERS SET MEMBER_ID=?, ORDER_STATUS=?, ORDER_PLACE_TIME=?, ORDER_NAME=?, ORDER_MAIL=?, ORDER_PHONE=?, ORDER_DELIVERY_TIME=?, ORDER_RECEIVED_TIME=? WHERE ORDER_ID=?";

	private static final String DELETE = "DELETE FROM ORDERS WHERE ORDER_ID = ?";

	private static final String GET_ONE_PSTMT = "SELECT * FROM ORDERS WHERE ORDER_ID=?";

	private static final String GET_ALL_PSTMT = "SELECT * FROM ORDERS ORDER BY ORDER_ID";

	@Override
	public void insert(OrdersVO ordersVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = con.prepareStatement(INSERT_PSTMT);

			pstmt.setString(1, ordersVO.getMember_id());
			pstmt.setInt(2, ordersVO.getOrder_status());
			pstmt.setTimestamp(3, ordersVO.getOrder_place_time());
			pstmt.setString(4, ordersVO.getOrder_name());
			pstmt.setString(5, ordersVO.getOrder_mail());
			pstmt.setString(6, ordersVO.getOrder_phone());
			pstmt.setTimestamp(7, ordersVO.getOrder_delivery_time());
			pstmt.setTimestamp(8, ordersVO.getOrder_received_time());

			pstmt.executeUpdate();

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
	public void update(OrdersVO ordersVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, ordersVO.getMember_id());
			pstmt.setInt(2, ordersVO.getOrder_status());
			pstmt.setTimestamp(3, ordersVO.getOrder_place_time());
			pstmt.setString(4, ordersVO.getOrder_name());
			pstmt.setString(5, ordersVO.getOrder_mail());
			pstmt.setString(6, ordersVO.getOrder_phone());
			pstmt.setTimestamp(7, ordersVO.getOrder_delivery_time());
			pstmt.setTimestamp(8, ordersVO.getOrder_received_time());
			pstmt.setString(9, ordersVO.getOrder_id());

			pstmt.executeUpdate();
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
	public void delete(String order_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, order_id);

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
	public OrdersVO findByPrimaryKey(String order_id) {

		OrdersVO ordersVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_PSTMT);

			pstmt.setString(1, order_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ordersVO = new OrdersVO();
				ordersVO.setOrder_id(rs.getString("order_id"));
				ordersVO.setMember_id(rs.getString("member_id"));
				ordersVO.setOrder_status(rs.getInt("order_status"));
				ordersVO.setOrder_place_time(rs.getTimestamp("order_place_time"));
				ordersVO.setOrder_name(rs.getString("order_name"));
				ordersVO.setOrder_mail(rs.getString("order_mail"));
				ordersVO.setOrder_phone(rs.getString("order_phone"));
				ordersVO.setOrder_delivery_time(rs.getTimestamp("order_delivery_time"));
				ordersVO.setOrder_received_time(rs.getTimestamp("order_received_time"));

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
		return ordersVO;
	}

	@Override
	public List<OrdersVO> getAll() {
		List<OrdersVO> list = new ArrayList();

		OrdersVO ordersVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_PSTMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ordersVO = new OrdersVO();
				ordersVO.setOrder_id(rs.getString("order_id"));
				ordersVO.setMember_id(rs.getString("member_id"));
				ordersVO.setOrder_status(rs.getInt("order_status"));
				ordersVO.setOrder_place_time(rs.getTimestamp("order_place_time"));
				ordersVO.setOrder_name(rs.getString("order_name"));
				ordersVO.setOrder_mail(rs.getString("order_mail"));
				ordersVO.setOrder_phone(rs.getString("order_phone"));
				ordersVO.setOrder_delivery_time(rs.getTimestamp("order_delivery_time"));
				ordersVO.setOrder_received_time(rs.getTimestamp("order_received_time"));
				list.add(ordersVO);
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
//		OrdersDAOJDBC dao = new OrdersDAOJDBC();
//		GregorianCalendar gc = new GregorianCalendar(2020, 12, 7, 12, 07, 30);
//		Timestamp timestamp = new Timestamp(gc.getTimeInMillis());

//		// insert
//		OrdersVO ordersVO = new OrdersVO();
//		ordersVO.setMember_id("MEMBERS00050");
//		ordersVO.setOrder_status(0);
//		ordersVO.setOrder_place_time(timestamp);
//		ordersVO.setOrder_name("insert");
//		ordersVO.setOrder_mail("aa@gmail.com");
//		ordersVO.setOrder_phone("0989232637");
//		ordersVO.setOrder_delivery_time(timestamp);
//		ordersVO.setOrder_received_time(new Timestamp(new Date().getTime()));
//		dao.insert(ordersVO);

//		// update
//		OrdersVO ordersVO2 = new OrdersVO();
//		
//		ordersVO2.setMember_id("MEMBERS00050");
//		ordersVO2.setOrder_status(1);
//		ordersVO2.setOrder_place_time(timestamp);
//		ordersVO2.setOrder_name("udpate");
//		ordersVO2.setOrder_mail("bb@gmail.com");
//		ordersVO2.setOrder_phone("0911111111");
//		ordersVO2.setOrder_delivery_time(timestamp);
//		ordersVO2.setOrder_received_time(new Timestamp(new Date().getTime()));
//		ordersVO2.setOrder_id("ORDERS00300");
//		dao.update(ordersVO2);

		// delete
//		dao.delete("ORDERS00300");

		// get one
//		OrdersVO ordersVO3 = dao.findByPrimaryKey("ORDERS00200");
//		System.out.print(ordersVO3.toString());

		// get all
//		List<OrdersVO> list = dao.getAll();
//		for (OrdersVO orders : list) {
//			System.out.print(orders.toString());
//			System.out.println();
//		}

	}

}
