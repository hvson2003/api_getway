package com.example.order.repository;

import com.example.order.model.Order;
import com.example.order.model.OrderStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findByStatus(OrderStatus status);

    List<Order> findByCustomerEmail(String email);

    @Query("SELECT o FROM Order o WHERE o.createdAt BETWEEN :startDate AND :endDate")
    List<Order> findOrdersInDateRange(Date startDate, Date endDate);

    @Query("SELECT o FROM Order o WHERE o.totalAmount > :amount")
    List<Order> findHighValueOrders(BigDecimal amount);
}
