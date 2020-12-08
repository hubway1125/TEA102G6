package com.pieces.model;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;


public class PiecesService {
	private PiecesDAO_interface dao;

	public PiecesService() {
		dao = new PiecesDAOJDBC();
	}
	
	public static void main(String[] args) {
//		PiecesService service = new PiecesService();
//		service.insertPiece("ALBUM00000", new byte[1024], 0, 9999, new Timestamp(Calendar.getInstance().getTimeInMillis()), new Timestamp(Calendar.getInstance().getTimeInMillis()), "testServiceInsert");
//		service.updatePieces("PIECES00250", "ALBUM00000", new byte[1024], 0, 876, new Timestamp(Calendar.getInstance().getTimeInMillis()), new Timestamp(Calendar.getInstance().getTimeInMillis()), "testServiceUpdate");
//		service.deletePiece("PIECES00250");
//		System.out.println(service.getOnePiece("PIECES00000"));
//		System.out.println(service.getAllPieces());
	}
	
	public PiecesVO insertPiece(String album_id, byte[] piece, Integer piece_status, Integer piece_play_count, Timestamp piece_add_time, Timestamp piece_last_edit_time, String piece_last_editor) {
		
		PiecesVO piecesVO = new PiecesVO();
		
		piecesVO.setAlbum_id(album_id);
		piecesVO.setPiece(piece);
		piecesVO.setPiece_status(piece_status);
		piecesVO.setPiece_play_count(piece_play_count);
		piecesVO.setPiece_add_time(piece_add_time);
		piecesVO.setPiece_last_edit_time(piece_last_edit_time);
		piecesVO.setPiece_last_editor(piece_last_editor);
		
		dao.insert(piecesVO);
		
		return piecesVO;
	}
	
	public PiecesVO updatePieces(String piece_id, String album_id, byte[] piece, Integer piece_status, Integer piece_play_count, Timestamp piece_add_time, Timestamp piece_last_edit_time, String piece_last_editor) {
		
		PiecesVO piecesVO = new PiecesVO();
		
		piecesVO.setPiece_id(piece_id);
		piecesVO.setAlbum_id(album_id);
		piecesVO.setPiece(piece);
		piecesVO.setPiece_status(piece_status);
		piecesVO.setPiece_play_count(piece_play_count);
		piecesVO.setPiece_add_time(piece_add_time);
		piecesVO.setPiece_last_edit_time(piece_last_edit_time);
		piecesVO.setPiece_last_editor(piece_last_editor);
		
		dao.update(piecesVO);
		
		return piecesVO;
		
	}
	
	public void deletePiece(String piece_id) {
		dao.delete(piece_id);
	}
	
	public PiecesVO getOnePiece(String piece_id) {
		return dao.findByPrimaryKey(piece_id);
	}
	
	public List<PiecesVO> getAllPieces(){
		return dao.getAll();		
	}
	

}
