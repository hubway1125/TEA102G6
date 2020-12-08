package com.pieces.model;

import java.util.List;

import database.DatabaseConnection_interface;


public interface PiecesDAO_interface  {
	
	public void insert(PiecesVO piecesVO);
    public void update(PiecesVO piecesVO);
    public void delete(String piece_id);
    public PiecesVO findByPrimaryKey(String piece_id);
    public List<PiecesVO> getAll();
	
}
