package com.gigatecnova;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class Main extends Application {

    @Override
    public void start(Stage stage) throws Exception {

        FXMLLoader loader = new FXMLLoader(
                Main.class.getResource("/com/gigatecnova/view/product-view.fxml")
        );

        Scene scene = new Scene(loader.load(), 1200, 650);
        stage.setMinWidth(900);
        stage.setMinHeight(500);
        stage.setTitle("Gigatec Nova");
        stage.setScene(scene);
        stage.show();
    }

    public static void main(String[] args) {
        launch();
    }
}