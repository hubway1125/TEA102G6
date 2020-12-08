package com.ticket.model;

import java.util.List;

public interface TicketDAO_interface {
	public void insert(TicketVO ticketVO);

	public void update(TicketVO ticketVO);

	public void delete(String ticket_id);

	public TicketVO findByPrimaryKey(String ticket_id);

	public List<TicketVO> getAll();
}
