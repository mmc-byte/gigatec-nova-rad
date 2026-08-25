package com.gigatecnova.dao;

import com.gigatecnova.config.DatabaseConfig;
import com.gigatecnova.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    public List<Product> findAll() throws SQLException {

        String sql = """
                SELECT
                    p.id,
                    p.category_id,
                    p.brand_id,
                    p.name,
                    p.description,
                    p.sku,
                    p.price,
                    p.active,
                    p.created_at,
                    p.updated_at,
                    b.name AS brand_name,
                    c.name AS category_name,
                    i.quantity AS stock
                FROM products p
                JOIN brands b ON p.brand_id = b.id
                JOIN categories c ON p.category_id = c.id
                JOIN inventory i ON p.id = i.product_id
                ORDER BY p.id
                """;

        List<Product> products = new ArrayList<>();

        try (
                Connection connection = DatabaseConfig.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery()
        ) {
            while (resultSet.next()) {
                products.add(mapProduct(resultSet));
            }
        }

        return products;
    }

    public Product findById(Long id) throws SQLException {

        String sql = """
                SELECT
                    id,
                    category_id,
                    brand_id,
                    name,
                    description,
                    sku,
                    price,
                    active,
                    created_at,
                    updated_at
                FROM products
                WHERE id = ?
                """;

        try (
                Connection connection = DatabaseConfig.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setLong(1, id);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return mapProduct(resultSet);
                }
            }
        }

        return null;
    }

    private Product mapProduct(ResultSet resultSet) throws SQLException {

        Product product = new Product();

        product.setId(resultSet.getLong("id"));
        product.setCategoryId(resultSet.getLong("category_id"));
        product.setBrandId(resultSet.getLong("brand_id"));
        product.setBrandName(resultSet.getString("brand_name"));
        product.setCategoryName(resultSet.getString("category_name"));
        product.setStock(resultSet.getInt("stock"));
        product.setName(resultSet.getString("name"));
        product.setDescription(resultSet.getString("description"));
        product.setSku(resultSet.getString("sku"));
        product.setPrice(resultSet.getBigDecimal("price"));
        product.setActive(resultSet.getBoolean("active"));

        if (resultSet.getTimestamp("created_at") != null) {
            product.setCreatedAt(
                    resultSet.getTimestamp("created_at").toLocalDateTime()
            );
        }

        if (resultSet.getTimestamp("updated_at") != null) {
            product.setUpdatedAt(
                    resultSet.getTimestamp("updated_at").toLocalDateTime()
            );
        }

        return product;
    }
}