package com.event.model;

import java.util.List;

public interface EventDAO_interface {

	public void insert(EventVO eventVO);

	public void update(EventVO eventVO);

	public void delete(String event_id);

	public EventVO findByPrimaryKey(String event_id);

	public List<EventVO> getAll();
	
}
