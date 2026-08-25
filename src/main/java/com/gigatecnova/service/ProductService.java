package com.gigatecnova.service;

import com.gigatecnova.dao.ProductDAO;
import com.gigatecnova.model.Product;

import java.sql.SQLException;
import java.util.List;

public class ProductService {

    private final ProductDAO productDAO;

    public ProductService() {
        this.productDAO = new ProductDAO();
    }

    public List<Product> getAllProducts() throws SQLException {
        return productDAO.findAll();
    }

    public Product getProductById(Long id) throws SQLException {
        return productDAO.findById(id);
    }
}