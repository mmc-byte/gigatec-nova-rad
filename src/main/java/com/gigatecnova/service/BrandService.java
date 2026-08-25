package com.gigatecnova.service;

import com.gigatecnova.dao.BrandDAO;
import com.gigatecnova.model.Brand;

import java.sql.SQLException;
import java.util.List;

public class BrandService {

    private final BrandDAO brandDAO;

    public BrandService() {
        this.brandDAO = new BrandDAO();
    }

    public List<Brand> getAllActiveBrands() throws SQLException {
        return brandDAO.findAllActive();
    }
}