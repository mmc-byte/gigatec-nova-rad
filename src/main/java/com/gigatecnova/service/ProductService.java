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

    /*CREATE!!*/
    public void createProduct(Product product) throws SQLException {
        validateProduct(product);
        productDAO.create(product);
    }

    /*UPDATE!!!*/
    public void updateProduct(Product product) throws SQLException {
        validateProduct(product);

        if (product.getId() == null) {
            throw new IllegalArgumentException("Product ID is required.");
        }

        productDAO.update(product);
    }

    /*Validaciones*/
    private void validateProduct(Product product) {

        if (product.getName() == null || product.getName().isBlank()) {
            throw new IllegalArgumentException("Product name is required.");
        }

        if (product.getSku() == null || product.getSku().isBlank()) {
            throw new IllegalArgumentException("SKU is required.");
        }

        if (product.getCategoryId() == null) {
            throw new IllegalArgumentException("Category is required.");
        }

        if (product.getBrandId() == null) {
            throw new IllegalArgumentException("Brand is required.");
        }

        if (product.getPrice() == null || product.getPrice().signum() < 0) {
            throw new IllegalArgumentException("Price must be zero or greater.");
        }

        if (product.getStock() == null || product.getStock() < 0) {
            throw new IllegalArgumentException("Stock must be zero or greater.");
        }
    }
}