package com.gigatecnova.dao;

import com.gigatecnova.config.DatabaseConfig;
import com.gigatecnova.model.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {

    public List<Category> findAllActive() throws SQLException {

        String sql = """
                SELECT
                    id,
                    name,
                    description,
                    active
                FROM categories
                WHERE active = TRUE
                ORDER BY name
                """;

        List<Category> categories = new ArrayList<>();

        try (
                Connection connection = DatabaseConfig.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery()
        ) {
            while (resultSet.next()) {
                Category category = new Category();

                category.setId(resultSet.getLong("id"));
                category.setName(resultSet.getString("name"));
                category.setDescription(resultSet.getString("description"));
                category.setActive(resultSet.getBoolean("active"));

                categories.add(category);
            }
        }

        return categories;
    }
}