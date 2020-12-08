package com.orders.model;

import java.util.*;

public interface OrdersDAO_interface {
	public void insert(OrdersVO ordersVO);

	public void update(OrdersVO ordersVO);

	public void delete(String order_id);

	public OrdersVO findByPrimaryKey(String order_id);

	public List<OrdersVO> getAll();
}
