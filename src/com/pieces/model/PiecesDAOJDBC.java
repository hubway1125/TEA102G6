package com.pieces.model;

import java.sql.*;
import java.util.*;

import database.DatabaseConnection_interface;

public class PiecesDAOJDBC implements PiecesDAO_interface, DatabaseConnection_interface {

	private static final String INSERT_PSTMT = "INSERT INTO PIECES VALUES ('PIECES'||LPAD(PIECES_SEQ.NEXTVAL, 5, '0'), ?, ?, ?, ?, ?, ?, ?)";
	private static final String UPDATE_PSTMT = "UPDATE PIECES SET ALBUM_ID = ?, PIECE = ?, PIECE_STATUS = ?, PIECE_PLAY_COUNT = ?, PIECE_ADD_TIME = ?, PIECE_LAST_EDIT_TIME = ?, PIECE_LAST_EDITOR = ? WHERE PIECE_ID = ?";
	private static final String DELETE_PSTMT = "DELETE FROM PIECES WHERE PIECE_ID = ?";
	private static final String GET_ONE_PSTMT = "SELECT * FROM PIECES WHERE PIECE_ID = ?";
	private static final String GET_ALL_PSTMT = "SELECT * FROM PIECES ORDER BY PIECE_ID";

	public static void main(String[] args) {

		PiecesDAOJDBC dao = new PiecesDAOJDBC();
//		
//		// 測試新增
//		dao.testInsert(dao);
//		// 測試修改
//		dao.testUpdate(dao);
//		// 測試刪除
//		dao.testDelete(dao);
//		// 測試查詢一筆
//		dao.testSelectOne(dao);
//		// 測試查詢多筆
//		dao.testSelectAll(dao);
	}

	public void testInsert(PiecesDAOJDBC dao) {
		// 測試新增
		PiecesVO insert = new PiecesVO();
		insert.setAlbum_id("ALBUM00000");
		insert.setPiece(new byte[1024]);
		insert.setPiece_status(0);
		insert.setPiece_play_count(1000);
		insert.setPiece_add_time(new Timestamp(Calendar.getInstance().getTimeInMillis()));
		insert.setPiece_last_edit_time(new Timestamp(Calendar.getInstance().getTimeInMillis()));
		insert.setPiece_last_editor("EMP00000");
		dao.insert(insert);
		System.out.println("===inserted===");
	}

	public void testUpdate(PiecesDAOJDBC dao) {
		// 測試修改
		PiecesVO update = new PiecesVO();
		update.setPiece_id("PIECES00250");
		update.setAlbum_id("ALBUM00200");
		update.setPiece(new byte[1024]);
		update.setPiece_status(1);
		update.setPiece_play_count(9999);
		update.setPiece_add_time(new Timestamp(Calendar.getInstance().getTimeInMillis()));
		update.setPiece_last_edit_time(new Timestamp(Calendar.getInstance().getTimeInMillis()));
		update.setPiece_last_editor("EMP00000");
		dao.update(update);
		System.out.println("===updated===");
	}

	public void testDelete(PiecesDAOJDBC dao) {
		// 測試刪除
		dao.delete("PIECES00250");
		System.out.println("===deleted===");
	}

	public void testSelectOne(PiecesDAOJDBC dao) {
		// 測試查詢一筆
		System.out.println("===============selectOne===============");
		PiecesVO selectOne = dao.findByPrimaryKey("PIECES00050");
		System.out.println(selectOne.toString());
		System.out.println("=======================================");
	}

	public void testSelectAll(PiecesDAOJDBC dao) {
		// 測試查詢多筆
		List<PiecesVO> list = dao.getAll();
		System.out.println("===============selectAll===============");
		int i = 0;
		for (PiecesVO VO : list) {
			System.out.println("=============selectAll:" + i + "==============");
			System.out.println(VO.toString());
			i++;
		}

	}

	@Override
	public void insert(PiecesVO piecesVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = conn.prepareStatement(INSERT_PSTMT);

			pstmt.setString(1, piecesVO.getAlbum_id());
			pstmt.setBytes(2, piecesVO.getPiece());
			pstmt.setInt(3, piecesVO.getPiece_status());
			pstmt.setInt(4, piecesVO.getPiece_play_count());
			pstmt.setTimestamp(5, piecesVO.getPiece_add_time());
			pstmt.setTimestamp(6, piecesVO.getPiece_last_edit_time());
			pstmt.setString(7, piecesVO.getPiece_last_editor());

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			e.printStackTrace(System.err);
		} catch (SQLException e) {
			e.printStackTrace(System.err);
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void update(PiecesVO piecesVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = conn.prepareStatement(UPDATE_PSTMT);

			pstmt.setString(1, piecesVO.getAlbum_id());
			pstmt.setBytes(2, piecesVO.getPiece());
			pstmt.setInt(3, piecesVO.getPiece_status());
			pstmt.setInt(4, piecesVO.getPiece_play_count());
			pstmt.setTimestamp(5, piecesVO.getPiece_add_time());
			pstmt.setTimestamp(6, piecesVO.getPiece_last_edit_time());
			pstmt.setString(7, piecesVO.getPiece_last_editor());
			pstmt.setString(8, piecesVO.getPiece_id());
			
			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			e.printStackTrace(System.err);
		} catch (SQLException e) {
			e.printStackTrace(System.err);
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void delete(String piece_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = conn.prepareStatement(DELETE_PSTMT);

			pstmt.setString(1, piece_id);

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			e.printStackTrace(System.err);
		} catch (SQLException e) {
			e.printStackTrace(System.err);
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public PiecesVO findByPrimaryKey(String piece_id) {
		PiecesVO piecesVO = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = conn.prepareStatement(GET_ONE_PSTMT);

			pstmt.setString(1, piece_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				piecesVO = new PiecesVO();
				piecesVO.setPiece_id(rs.getString("PIECE_ID"));
				piecesVO.setAlbum_id(rs.getString("ALBUM_ID"));
				piecesVO.setPiece(rs.getBytes("PIECE"));
				piecesVO.setPiece_status(rs.getInt("PIECE_STATUS"));
				piecesVO.setPiece_play_count(rs.getInt("PIECE_PLAY_COUNT"));
				piecesVO.setPiece_add_time(rs.getTimestamp("PIECE_ADD_TIME"));
				piecesVO.setPiece_last_edit_time(rs.getTimestamp("PIECE_LAST_EDIT_TIME"));
				piecesVO.setPiece_last_editor(rs.getString("PIECE_LAST_EDITOR"));

			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace(System.err);
		} catch (SQLException e) {
			e.printStackTrace(System.err);
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}

		}

		return piecesVO;
	}

	@Override
	public List<PiecesVO> getAll() {

		List<PiecesVO> list = new ArrayList();
		PiecesVO piecesVO = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = conn.prepareStatement(GET_ALL_PSTMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				piecesVO = new PiecesVO();
				piecesVO.setPiece_id(rs.getString("PIECE_ID"));
				piecesVO.setAlbum_id(rs.getString("ALBUM_ID"));
				piecesVO.setPiece(rs.getBytes("PIECE"));
				piecesVO.setPiece_status(rs.getInt("PIECE_STATUS"));
				piecesVO.setPiece_play_count(rs.getInt("PIECE_PLAY_COUNT"));
				piecesVO.setPiece_add_time(rs.getTimestamp("PIECE_ADD_TIME"));
				piecesVO.setPiece_last_edit_time(rs.getTimestamp("PIECE_LAST_EDIT_TIME"));
				piecesVO.setPiece_last_editor(rs.getString("PIECE_LAST_EDITOR"));
				list.add(piecesVO);

			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace(System.err);
		} catch (SQLException e) {
			e.printStackTrace(System.err);
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}

		}

		return list;
	}

}
