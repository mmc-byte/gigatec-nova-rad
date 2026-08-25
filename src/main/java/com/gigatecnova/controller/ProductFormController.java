package com.gigatecnova.controller;

import com.gigatecnova.model.Brand;
import com.gigatecnova.model.Category;
import com.gigatecnova.model.Product;
import com.gigatecnova.service.BrandService;
import com.gigatecnova.service.CategoryService;
import com.gigatecnova.service.ProductService;
import com.gigatecnova.controller.ProductController;

import javafx.collections.FXCollections;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.stage.Stage;
import javafx.scene.control.Label;

import java.math.BigDecimal;
import java.sql.SQLException;


public class ProductFormController {
    private ProductController productController;
    private Product product;
    @FXML
    private Label titleLabel;

    @FXML
    private TextField nameField;

    @FXML
    private TextField skuField;

    @FXML
    private TextArea descriptionField;

    @FXML
    private ComboBox<Brand> brandComboBox;

    @FXML
    private ComboBox<Category> categoryComboBox;

    @FXML
    private TextField priceField;

    @FXML
    private TextField stockField;

    private final ProductService productService = new ProductService();
    private final BrandService brandService = new BrandService();
    private final CategoryService categoryService = new CategoryService();

    @FXML
    public void initialize() {
        configureBrandComboBox();
        configureCategoryComboBox();

        loadBrands();
        loadCategories();
    }
    private void showSuccessMessage() {
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Producto creado");
        alert.setHeaderText(null);
        alert.setContentText("¡Producto agregado correctamente! :)");
        alert.showAndWait();
    }

    private void configureBrandComboBox() {
        brandComboBox.setCellFactory(listView ->
                new javafx.scene.control.ListCell<>() {
                    @Override
                    protected void updateItem(Brand brand, boolean empty) {
                        super.updateItem(brand, empty);

                        setText(empty || brand == null ? null : brand.getName());
                    }
                }
        );

        brandComboBox.setButtonCell(
                new javafx.scene.control.ListCell<>() {
                    @Override
                    protected void updateItem(Brand brand, boolean empty) {
                        super.updateItem(brand, empty);

                        setText(empty || brand == null ? null : brand.getName());
                    }
                }
        );
    }

    private void configureCategoryComboBox() {
        categoryComboBox.setCellFactory(listView ->
                new javafx.scene.control.ListCell<>() {
                    @Override
                    protected void updateItem(Category category, boolean empty) {
                        super.updateItem(category, empty);

                        setText(empty || category == null ? null : category.getName());
                    }
                }
        );

        categoryComboBox.setButtonCell(
                new javafx.scene.control.ListCell<>() {
                    @Override
                    protected void updateItem(Category category, boolean empty) {
                        super.updateItem(category, empty);

                        setText(empty || category == null ? null : category.getName());
                    }
                }
        );
    }

    private void loadBrands() {
        try {
            brandComboBox.setItems(
                    FXCollections.observableArrayList(
                            brandService.getAllActiveBrands()
                    )
            );
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void loadCategories() {
        try {
            categoryComboBox.setItems(
                    FXCollections.observableArrayList(
                            categoryService.getAllActiveCategories()
                    )
            );
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @FXML
    private void handleSave() {

        try {
            if (product == null) {
                product = new Product();
            }

            product.setName(nameField.getText());
            product.setSku(skuField.getText());
            product.setDescription(descriptionField.getText());

            Brand selectedBrand = brandComboBox.getValue();
            Category selectedCategory = categoryComboBox.getValue();

            product.setBrandId(
                    selectedBrand != null ? selectedBrand.getId() : null
            );

            product.setCategoryId(
                    selectedCategory != null ? selectedCategory.getId() : null
            );

            product.setPrice(
                    new BigDecimal(priceField.getText())
            );

            product.setStock(
                    Integer.parseInt(stockField.getText())
            );

            if (product.getId() == null) {
                productService.createProduct(product);
            } else {
                productService.updateProduct(product);
            }

            if (productController != null) {
                productController.refreshProducts();
            }
            showSuccessMessage();
            closeWindow();

        } catch (NumberFormatException e) {
            System.err.println("Price and stock must contain valid numbers.");

        } catch (IllegalArgumentException e) {
            System.err.println(e.getMessage());

        } catch (SQLException e) {
            e.printStackTrace();
        }
    } /*termina Handle Save*/

    private void closeWindow() {
        Stage stage = (Stage) nameField.getScene().getWindow();
        stage.close();
    }


    public void setProductController(ProductController productController) {
        this.productController = productController;
    }
    public void setProduct(Product product) {

        this.product = product;

        titleLabel.setText("Editar producto");

        nameField.setText(product.getName());
        skuField.setText(product.getSku());
        descriptionField.setText(product.getDescription());

        priceField.setText(product.getPrice().toString());
        stockField.setText(product.getStock().toString());

        brandComboBox.getSelectionModel().select(
                brandComboBox.getItems().stream()
                        .filter(brand -> brand.getId().equals(product.getBrandId()))
                        .findFirst()
                        .orElse(null)
        );

        categoryComboBox.getSelectionModel().select(
                categoryComboBox.getItems().stream()
                        .filter(category -> category.getId().equals(product.getCategoryId()))
                        .findFirst()
                        .orElse(null)
        );
    }

}