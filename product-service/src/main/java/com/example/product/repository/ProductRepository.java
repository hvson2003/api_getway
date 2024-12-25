package com.example.product.repository;

import com.example.product.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.math.BigDecimal;
import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {
    List<Product> findByCategory(String category);

    @Query("SELECT p FROM Product p WHERE p.stockQuantity < :minStock")
    List<Product> findLowStockProducts(int minStock);

    List<Product> findByPriceBetween(BigDecimal minPrice, BigDecimal maxPrice);
}
