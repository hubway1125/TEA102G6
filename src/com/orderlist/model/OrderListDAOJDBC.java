package com.orderlist.model;

import java.sql.*;
import java.util.*;

import database.DatabaseConnection_interface;

public class OrderListDAOJDBC implements OrderListDAO_interface, DatabaseConnection_interface {

	private static final String INSERT_PSTMT = "INSERT INTO ORDERLIST VALUES('ORDERLIST'||LPAD(ORDERLIST_SEQ.NEXTVAL, 5, '0'),?,?,?,?,?,?,?,?)";

	private static final String UPDATE = "UPDATE ORDERLIST SET ORDER_ID=?, PRODUCT_ID=?, ORDERLIST_GOODS_AMOUNT=?, ORDERLIST_REMARKS=?, REVIEW_SCORE=?, REVIEW_MSG=?, REVIEW_TIME=?, REVIEW_HIDDEN=? WHERE ORDERLIST_ID=?";

	private static final String DELETE = "DELETE FROM ORDERLIST WHERE ORDERLIST_ID = ?";

	private static final String GET_ONE_PSTMT = "SELECT * FROM ORDERLIST WHERE ORDERLIST_ID=?";

	private static final String GET_ALL_PSTMT = "SELECT * FROM ORDERLIST ORDER BY ORDERLIST_ID";

	@Override
	public void insert(OrderListVO orderListVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = con.prepareStatement(INSERT_PSTMT);

			pstmt.setString(1, orderListVO.getOrder_id());
			pstmt.setString(2, orderListVO.getProduct_id());
			pstmt.setInt(3, orderListVO.getOrderlist_goods_amount());
			pstmt.setString(4, orderListVO.getOrderlist_remarks());
			pstmt.setInt(5, orderListVO.getReview_score());
			pstmt.setString(6, orderListVO.getReview_msg());
			pstmt.setTimestamp(7, orderListVO.getReview_time());
			pstmt.setInt(8, orderListVO.getReview_hidden());

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
	public void update(OrderListVO orderListVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, orderListVO.getOrder_id());
			pstmt.setString(2, orderListVO.getProduct_id());
			pstmt.setInt(3, orderListVO.getOrderlist_goods_amount());
			pstmt.setString(4, orderListVO.getOrderlist_remarks());
			pstmt.setInt(5, orderListVO.getReview_score());
			pstmt.setString(6, orderListVO.getReview_msg());
			pstmt.setTimestamp(7, orderListVO.getReview_time());
			pstmt.setInt(8, orderListVO.getReview_hidden());
			pstmt.setString(9, orderListVO.getOrderlist_id());
			
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
	public void delete(String orderlist_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, orderlist_id);

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
	public OrderListVO findByPrimaryKey(String orderlist_id) {
		OrderListVO orderListVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = con.prepareStatement(GET_ONE_PSTMT);

			pstmt.setString(1, orderlist_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				orderListVO = new OrderListVO();
				orderListVO.setOrderlist_id(rs.getString("orderlist_id"));
				orderListVO.setOrder_id(rs.getString("order_id"));
				orderListVO.setProduct_id(rs.getString("product_id"));
				orderListVO.setOrderlist_goods_amount(rs.getInt("orderlist_goods_amount"));
				orderListVO.setOrderlist_remarks(rs.getString("orderlist_remarks"));
				orderListVO.setReview_score(rs.getInt("review_score"));
				orderListVO.setReview_msg(rs.getString("review_msg"));
				orderListVO.setReview_time(rs.getTimestamp("review_time"));
				orderListVO.setReview_hidden(rs.getInt("review_hidden"));

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
		return orderListVO;
	}

	@Override
	public List<OrderListVO> getAll() {
		List<OrderListVO> list = new ArrayList();
		OrderListVO orderListVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = con.prepareStatement(GET_ALL_PSTMT);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				orderListVO = new OrderListVO();
				orderListVO.setOrderlist_id(rs.getString("orderlist_id"));
				orderListVO.setOrder_id(rs.getString("order_id"));
				orderListVO.setProduct_id(rs.getString("product_id"));
				orderListVO.setOrderlist_goods_amount(rs.getInt("orderlist_goods_amount"));
				orderListVO.setOrderlist_remarks(rs.getString("orderlist_remarks"));
				orderListVO.setReview_score(rs.getInt("review_score"));
				orderListVO.setReview_msg(rs.getString("review_msg"));
				orderListVO.setReview_time(rs.getTimestamp("review_time"));
				orderListVO.setReview_hidden(rs.getInt("review_hidden"));
				list.add(orderListVO);
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
//		OrderListJDBCDAO dao = new OrderListJDBCDAO();
//		Timestamp timestamp = new Timestamp(new java.util.Date().getTime());

		// insert
//		OrderListVO orderListVO = new OrderListVO();
//		orderListVO.setOrder_id("ORDERS00000");
//		orderListVO.setProduct_id("PRODUCT00000");
//		orderListVO.setOrderlist_goods_amount(50);
//		orderListVO.setOrderlist_remarks("這是備註insert");
//		orderListVO.setReview_score(4);
//		orderListVO.setReview_msg("這是訊息insert");
//		orderListVO.setReview_time(timestamp);
//		orderListVO.setReview_hidden(0);
//		dao.insert(orderListVO);

		// update
//		OrderListVO orderListVO2 = new OrderListVO();
//
//		orderListVO2.setOrderlist_id("ORDERLIST00300");
//		orderListVO2.setOrder_id("ORDERS00000");
//		orderListVO2.setProduct_id("PRODUCT00000");
//		orderListVO2.setOrderlist_goods_amount(30);
//		orderListVO2.setOrderlist_remarks("這是備註update");
//		orderListVO2.setReview_score(4);
//		orderListVO2.setReview_msg("這是訊息update");
//		orderListVO2.setReview_time(timestamp);
//		orderListVO2.setReview_hidden(0);
//		
//		dao.update(orderListVO2);

		// delete
//		dao.delete("ORDERLIST00300");

		// get one
//		OrderListVO orderListVO3 =dao.findByPrimaryKey("ORDERLIST00200");
//		System.out.print(orderListVO3.toString());
//		
		// get all
//		List<OrderListVO> list = dao.getAll();
//		for (OrderListVO orderList : list) {
//			System.out.print(orderList.toString());
//		}
	}
}
