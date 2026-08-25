package com.gigatecnova.config;

import io.github.cdimascio.dotenv.Dotenv;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConfig {

    private static final Dotenv DOTENV = Dotenv.load();

    private static final String HOST = DOTENV.get("MYSQL_HOST");
    private static final String PORT = DOTENV.get("MYSQL_PORT");
    private static final String DATABASE = DOTENV.get("MYSQL_DATABASE");
    private static final String USER = DOTENV.get("MYSQL_USER");
    private static final String PASSWORD = DOTENV.get("MYSQL_PASSWORD");

    private static final String URL =
            "jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE;

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}