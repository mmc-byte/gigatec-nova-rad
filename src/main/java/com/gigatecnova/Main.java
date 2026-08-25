package com.gigatecnova;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.stage.Stage;

public class Main extends Application {

    @Override
    public void start(Stage stage) {
        Label label = new Label("¡Gigatec Nova RAD funciona!");
        Scene scene = new Scene(label, 500, 300);

        stage.setTitle("Gigatec Nova RAD");
        stage.setScene(scene);
        stage.show();
    }

    public static void main(String[] args) {
        launch();
    }
}