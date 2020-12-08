package com.album.model;

import java.util.List;

import database.DatabaseConnection_interface;

public interface AlbumDAO_interface  {
	
	public void insert(AlbumVO albumVO);
    public void update(AlbumVO albumVO);
    public void delete(String album_id);
    public AlbumVO findByPrimaryKey(String album_id);
    public List<AlbumVO> getAll();

}
