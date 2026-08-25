package com.gigatecnova.controller;

import com.gigatecnova.model.Product;
import com.gigatecnova.service.ProductService;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;

import java.sql.SQLException;

public class ProductController {

    @FXML
    private TableView<Product> productTable;

    @FXML
    private TableColumn<Product, String> skuColumn;

    @FXML
    private TableColumn<Product, String> nameColumn;

    @FXML
    private TableColumn<Product, String> brandColumn;

    @FXML
    private TableColumn<Product, String> categoryColumn;

    @FXML
    private TableColumn<Product, String> descriptionColumn;

    @FXML
    private TableColumn<Product, String> priceColumn;

    @FXML
    private TableColumn<Product, Integer> stockColumn;

    private final ProductService productService = new ProductService();

    @FXML
    public void initialize() {
        configureColumns();
        loadProducts();
    }

    private void configureColumns() {
        skuColumn.setCellValueFactory(
                new PropertyValueFactory<>("sku")
        );

        nameColumn.setCellValueFactory(
                new PropertyValueFactory<>("name")
        );

        brandColumn.setCellValueFactory(
                new PropertyValueFactory<>("brandName")
        );

        categoryColumn.setCellValueFactory(
                new PropertyValueFactory<>("categoryName")
        );

        descriptionColumn.setCellValueFactory(
                new PropertyValueFactory<>("description")
        );

        priceColumn.setCellValueFactory(
                new PropertyValueFactory<>("price")
        );

        stockColumn.setCellValueFactory(
                new PropertyValueFactory<>("stock")
        );
    }

    private void loadProducts() {
        try {
            ObservableList<Product> products =
                    FXCollections.observableArrayList(
                            productService.getAllProducts()
                    );

            productTable.setItems(products);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}