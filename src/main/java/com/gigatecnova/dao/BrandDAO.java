package com.gigatecnova.dao;

import com.gigatecnova.config.DatabaseConfig;
import com.gigatecnova.model.Brand;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BrandDAO {

    public List<Brand> findAllActive() throws SQLException {

        String sql = """
                SELECT
                    id,
                    name,
                    active
                FROM brands
                WHERE active = TRUE
                ORDER BY name
                """;

        List<Brand> brands = new ArrayList<>();

        try (
                Connection connection = DatabaseConfig.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery()
        ) {
            while (resultSet.next()) {
                Brand brand = new Brand();

                brand.setId(resultSet.getLong("id"));
                brand.setName(resultSet.getString("name"));
                brand.setActive(resultSet.getBoolean("active"));

                brands.add(brand);
            }
        }

        return brands;
    }
}