package com.gigatecnova.controller;

import com.gigatecnova.model.Product;
import com.gigatecnova.service.ProductService;
import com.gigatecnova.controller.ProductFormController;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.scene.layout.HBox;

import javafx.scene.control.cell.PropertyValueFactory;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.scene.paint.Color;
import javafx.scene.control.Alert;
import javafx.scene.control.ButtonType;

import org.kordamp.ikonli.javafx.FontIcon;
import org.kordamp.ikonli.fontawesome5.FontAwesomeSolid;

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

    @FXML
    private TableColumn<Product, Void> actionsColumn;

    /*fin de las columnas */


    /* Botón de nuevo producto----*/
    @FXML
    private void handleNewProduct() {

        try {
            FXMLLoader loader = new FXMLLoader(
                    getClass().getResource("/com/gigatecnova/view/product-form.fxml")
            );

            Parent root = loader.load();
            ProductFormController formController = loader.getController();
            formController.setProductController(this);

            Stage stage = new Stage();
            stage.setTitle("Nuevo producto");
            stage.setScene(new Scene(root, 500, 550));

            stage.initModality(Modality.APPLICATION_MODAL);

            stage.showAndWait();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /*Botón de editar producto ----- */
    @FXML
    private void handleEditProduct(Product product) {

        try {
            FXMLLoader loader = new FXMLLoader(
                    getClass().getResource(
                            "/com/gigatecnova/view/product-form.fxml"
                    )
            );

            Parent root = loader.load();

            ProductFormController formController = loader.getController();

            formController.setProductController(this);
            formController.setProduct(product);

            Stage stage = new Stage();
            stage.setTitle("Editar producto");
            stage.setScene(new Scene(root, 500, 550));

            stage.initModality(Modality.APPLICATION_MODAL);
            stage.showAndWait();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /*Botón de borrar producto : este es codigo temporal*/
    @FXML
    private void handleDeleteProduct(Product product) {

        Alert confirmation = new Alert(
                Alert.AlertType.CONFIRMATION,
                "¿Seguro que deseas eliminar el producto \""
                        + product.getName()
                        + "\"?",
                ButtonType.CANCEL,
                ButtonType.OK
        );

        confirmation.setTitle("Eliminar producto");
        confirmation.setHeaderText("Confirmar eliminación");

        confirmation.showAndWait().ifPresent(response -> {

            if (response == ButtonType.OK) {

                try {
                    productService.deleteProduct(product.getId());

                    refreshProducts();

                    showSuccessMessage(
                            "Producto eliminado correctamente."
                    );

                } catch (SQLException e) {

                    showErrorMessage(
                            "No se pudo eliminar el producto."
                    );

                    e.printStackTrace();
                }
            }
        });
    }

    /*----*/

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

        actionsColumn.setCellFactory(column -> new TableCell<>() {

            private final Button editButton = new Button();
            private final Button deleteButton = new Button();
            private final HBox container = new HBox(5, editButton, deleteButton);

            {
                FontIcon editIcon = new FontIcon(FontAwesomeSolid.EDIT);
                FontIcon deleteIcon = new FontIcon(FontAwesomeSolid.TRASH);

                editIcon.setIconSize(14);
                deleteIcon.setIconSize(14);

                editIcon.setIconColor(Color.web("#E69A00"));
                deleteIcon.setIconColor(Color.web("#FF055B"));

                editButton.setGraphic(editIcon);
                deleteButton.setGraphic(deleteIcon);

                editButton.setTooltip(
                        new Tooltip("Editar producto")
                );

                deleteButton.setTooltip(
                        new Tooltip("Eliminar producto")
                );

                editButton.setOnAction(event -> {
                    Product product = getTableView()
                            .getItems()
                            .get(getIndex());

                    handleEditProduct(product);
                });

                deleteButton.setOnAction(event -> {
                    Product product = getTableView()
                            .getItems()
                            .get(getIndex());

                    handleDeleteProduct(product);
                });
            }

            @Override
            protected void updateItem(Void item, boolean empty) {
                super.updateItem(item, empty);

                setGraphic(empty ? null : container);
            }
        });

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

    /*actualización automática*/
    public void refreshProducts() {
        loadProducts();
    }

    /*metodos auxiliares para las alertas de eliminar*/
    private void showSuccessMessage(String message) {
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Operación completada");
        alert.setHeaderText(null);
        alert.setContentText(message);
        alert.showAndWait();
    }
    private void showErrorMessage(String message) {
        Alert alert = new Alert(Alert.AlertType.ERROR);
        alert.setTitle("Error");
        alert.setHeaderText(null);
        alert.setContentText(message);
        alert.showAndWait();
    }

    /*-- fin de la clase-----------*/
}