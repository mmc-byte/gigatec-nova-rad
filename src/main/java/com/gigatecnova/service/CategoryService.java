package com.gigatecnova.service;

import com.gigatecnova.dao.CategoryDAO;
import com.gigatecnova.model.Category;

import java.sql.SQLException;
import java.util.List;

public class CategoryService {

    private final CategoryDAO categoryDAO;

    public CategoryService() {
        this.categoryDAO = new CategoryDAO();
    }

    public List<Category> getAllActiveCategories() throws SQLException {
        return categoryDAO.findAllActive();
    }
}