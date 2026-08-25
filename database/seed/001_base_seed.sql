-- =====================================================
-- Seeder determinista para Gigatec Nova
-- =====================================================

SET NAMES utf8mb4;

-- =====================================================
-- 1. MARCAS (5)
-- =====================================================
INSERT INTO brands (name, active) VALUES
    ('NovaTech', TRUE),
    ('QuantumCore', TRUE),
    ('ApexDigital', TRUE),
    ('ZenithWave', TRUE),
    ('PioneerEdge', TRUE);

-- =====================================================
-- 2. CATEGORÍAS (5)
-- =====================================================
INSERT INTO categories (name, description, active) VALUES
    ('Laptops', 'Computadoras portátiles', TRUE),
    ('Smartphones', 'Teléfonos móviles', TRUE),
    ('Tablets', 'Tabletas digitales', TRUE),
    ('Audio', 'Audífonos y altavoces', TRUE),
    ('Accesorios', 'Accesorios tecnológicos', TRUE);

-- =====================================================
-- 3. PRODUCTOS (20)
-- =====================================================
INSERT INTO products (category_id, brand_id, name, description, sku, price, active) VALUES
    -- Laptops (categoría 1)
    (1, 1, 'NovaBook Pro', 'Laptop ultradelgada con pantalla 4K', 'NB-PRO-001', 1299.99, TRUE),
    (1, 1, 'NovaBook Air', 'Laptop ligera para uso diario', 'NB-AIR-002', 899.99, TRUE),
    (1, 2, 'QuantumBook X', 'Laptop gaming de alto rendimiento', 'QB-X-003', 1599.99, TRUE),
    (1, 3, 'ApexBook 14', 'Laptop profesional 14 pulgadas', 'AP-14-004', 749.99, TRUE),
    (1, 4, 'ZenithBook Evo', 'Laptop convertible 2-en-1', 'ZB-EVO-005', 1099.99, TRUE),
    
    -- Smartphones (categoría 2)
    (2, 1, 'NovaPhone Pro', 'Smartphone premium 6.8"', 'NP-PRO-006', 899.99, TRUE),
    (2, 1, 'NovaPhone Lite', 'Smartphone económico 6.5"', 'NP-LITE-007', 399.99, TRUE),
    (2, 2, 'QuantumPhone S', 'Smartphone con IA avanzada', 'QP-S-008', 699.99, TRUE),
    (2, 3, 'ApexPhone Max', 'Smartphone con batería extrema', 'AP-MAX-009', 549.99, TRUE),
    (2, 5, 'PioneerPhone G', 'Smartphone gaming', 'PP-G-010', 649.99, TRUE),
    
    -- Tablets (categoría 3)
    (3, 1, 'NovaTab Pro', 'Tablet profesional con lápiz', 'NT-PRO-011', 649.99, TRUE),
    (3, 2, 'QuantumTab Air', 'Tablet ligera 10.9"', 'QT-AIR-012', 449.99, TRUE),
    (3, 3, 'ApexTab Mini', 'Tablet compacta 8"', 'AT-MINI-013', 299.99, TRUE),
    
    -- Audio (categoría 4)
    (4, 4, 'ZenithBuds Pro', 'Audífonos inalámbricos premium', 'ZB-PRO-014', 149.99, TRUE),
    (4, 4, 'ZenithBuds Lite', 'Audífonos inalámbricos básicos', 'ZB-LITE-015', 59.99, TRUE),
    (4, 3, 'ApexSound 360', 'Altavoz inteligente 360°', 'AS-360-016', 129.99, TRUE),
    (4, 2, 'QuantumCore Headset', 'Audífonos para gaming', 'QCH-017', 89.99, TRUE),
    
    -- Accesorios (categoría 5)
    (5, 1, 'NovaCharger Pro', 'Cargador rápido 65W', 'NC-PRO-018', 39.99, TRUE),
    (5, 2, 'QuantumCore SSD', 'SSD externo 1TB', 'QSSD-019', 119.99, TRUE),
    (5, 5, 'PioneerCase', 'Funda protectora universal', 'PCASE-020', 19.99, TRUE);

-- =====================================================
-- 4. INVENTARIO (20)
-- =====================================================
INSERT INTO inventory (product_id, quantity) VALUES
    (1, 5),    -- normal 
    (2, 0),    -- agotado 
    (3, 0),    -- agotado 
    (4, 0),    -- agotado 
    (5, 6),    -- crítico
    (6, 4),    -- crítico
    (7, 5),    -- crítico
    (8, 15),   -- normal
    (9, 20),   -- normal
    (10, 25),  -- normal
    (11, 30),  -- normal
    (12, 35),  -- normal
    (13, 40),  -- normal
    (14, 45),  -- normal
    (15, 50),  -- normal
    (16, 120), -- abundante
    (17, 150), -- abundante
    (18, 180), -- abundante
    (19, 200), -- abundante
    (20, 250); -- abundante

-- =====================================================
-- 5. CLIENTES (10)
-- =====================================================
INSERT INTO customers (first_name, last_name, email, active) VALUES
    ('María', 'González', 'maria.gonzalez@email.com', TRUE),
    ('Carlos', 'López', 'carlos.lopez@email.com', TRUE),
    ('Ana', 'Martínez', 'ana.martinez@email.com', TRUE),
    ('Jorge', 'Rodríguez', 'jorge.rodriguez@email.com', TRUE),
    ('Laura', 'Fernández', 'laura.fernandez@email.com', TRUE),
    ('Miguel', 'Sánchez', 'miguel.sanchez@email.com', TRUE),
    ('Sofía', 'Ramírez', 'sofia.ramirez@email.com', TRUE),
    ('David', 'Torres', 'david.torres@email.com', TRUE),
    ('Elena', 'García', 'elena.garcia@email.com', TRUE),
    ('Pablo', 'Mendoza', 'pablo.mendoza@email.com', TRUE);

-- =====================================================
-- 6. DIRECCIONES (15)
-- =====================================================
INSERT INTO addresses (customer_id, address_line_1, address_line_2, city, region_or_state, postal_code, country, active) VALUES
    (1, 'Av. Principal 123', NULL, 'Ciudad de México', 'CDMX', '01000', 'México', TRUE),
    (1, 'Calle 5 de Mayo 45', 'Interior 3B', 'Guadalajara', 'JAL', '44100', 'México', TRUE),
    (2, 'Calle Reforma 789', NULL, 'Monterrey', 'NL', '64000', 'México', TRUE),
    (3, 'Av. Insurgentes 234', NULL, 'Ciudad de México', 'CDMX', '06700', 'México', TRUE),
    (3, 'Calle Hidalgo 567', 'Colonia Centro', 'Puebla', 'PUE', '72000', 'México', TRUE),
    (4, 'Boulevard Tecnológico 890', NULL, 'Querétaro', 'QRO', '76000', 'México', TRUE),
    (5, 'Calle Morelos 123', NULL, 'Mérida', 'YUC', '97000', 'México', TRUE),
    (5, 'Av. Universidad 456', 'Local 12', 'Cancún', 'QROO', '77500', 'México', TRUE),
    (6, 'Calle Juárez 789', NULL, 'Tijuana', 'BC', '22000', 'México', TRUE),
    (7, 'Av. Paseo 456', NULL, 'León', 'GTO', '37000', 'México', TRUE),
    (7, 'Calle Independencia 789', 'Colonia Moderna', 'San Luis Potosí', 'SLP', '78000', 'México', TRUE),
    (8, 'Calle Guerrero 234', NULL, 'Toluca', 'MEX', '50000', 'México', TRUE),
    (9, 'Av. Revolución 567', NULL, 'Morelia', 'MICH', '58000', 'México', TRUE),
    (9, 'Calle Zaragoza 890', 'Departamento 3A', 'Guadalajara', 'JAL', '44100', 'México', TRUE),
    (10, 'Boulevard Díaz Ordaz 123', NULL, 'Puebla', 'PUE', '72000', 'México', TRUE);

-- =====================================================
-- 7. PEDIDOS (28 total)
-- Distribución: pending(3), confirmed(4), shipped(5), delivered(12), cancelled(4)
-- NOTA: Solo se usan productos con stock (1, 5-20)
-- NO se usan productos agotados (2, 3, 4)
-- =====================================================

SET @igv_rate = 0.18;

START TRANSACTION;

-- Pedido 1: Cliente 1 (María) - DELIVERED
INSERT INTO orders (customer_id, shipping_address_line_1, shipping_address_line_2, shipping_city, shipping_region_or_state, shipping_postal_code, shipping_country, status, subtotal, tax_rate, tax_amount, total_amount, created_at, updated_at)
SELECT 1, 'Av. Principal 123', NULL, 'Ciudad de México', 'CDMX', '01000', 'México', 'delivered', 0, @igv_rate, 0, 0, DATE_SUB(NOW(), INTERVAL 150 DAY), DATE_SUB(NOW(), INTERVAL 150 DAY);
SET @order1 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
    (@order1, 8, 2, 699.99),
    (@order1, 14, 1, 149.99),
    (@order1, 19, 1, 119.99);
UPDATE orders SET subtotal = 699.99*2 + 149.99 + 119.99, tax_amount = ROUND((699.99*2 + 149.99 + 119.99) * 0.18, 2), total_amount = ROUND((699.99*2 + 149.99 + 119.99) * 1.18, 2) WHERE id = @order1;
UPDATE inventory SET quantity = quantity - 2 WHERE product_id = 8;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 14;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 19;

-- Pedido 2: Cliente 1 (María) - DELIVERED
INSERT INTO orders (customer_id, shipping_address_line_1, shipping_address_line_2, shipping_city, shipping_region_or_state, shipping_postal_code, shipping_country, status, subtotal, tax_rate, tax_amount, total_amount, created_at, updated_at)
SELECT 1, 'Calle 5 de Mayo 45', 'Interior 3B', 'Guadalajara', 'JAL', '44100', 'México', 'delivered', 0, @igv_rate, 0, 0, DATE_SUB(NOW(), INTERVAL 120 DAY), DATE_SUB(NOW(), INTERVAL 120 DAY);
SET @order2 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
    (@order2, 1, 1, 1299.99),
    (@order2, 16, 1, 129.99),
    (@order2, 20, 2, 19.99);
UPDATE orders SET subtotal = 1299.99 + 129.99 + 19.99*2, tax_amount = ROUND((1299.99 + 129.99 + 19.99*2) * 0.18, 2), total_amount = ROUND((1299.99 + 129.99 + 19.99*2) * 1.18, 2) WHERE id = @order2;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 1;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 16;
UPDATE inventory SET quantity = quantity - 2 WHERE product_id = 20;

-- Pedido 3: Cliente 1 (María) - DELIVERED
INSERT INTO orders (customer_id, shipping_address_line_1, shipping_address_line_2, shipping_city, shipping_region_or_state, shipping_postal_code, shipping_country, status, subtotal, tax_rate, tax_amount, total_amount, created_at, updated_at)
SELECT 1, 'Av. Principal 123', NULL, 'Ciudad de México', 'CDMX', '01000', 'México', 'delivered', 0, @igv_rate, 0, 0, DATE_SUB(NOW(), INTERVAL 100 DAY), DATE_SUB(NOW(), INTERVAL 100 DAY);
SET @order3 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
    (@order3, 6, 1, 899.99),
    (@order3, 15, 1, 59.99),
    (@order3, 18, 1, 39.99);
UPDATE orders SET subtotal = 899.99 + 59.99 + 39.99, tax_amount = ROUND((899.99 + 59.99 + 39.99) * 0.18, 2), total_amount = ROUND((899.99 + 59.99 + 39.99) * 1.18, 2) WHERE id = @order3;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 6;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 15;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 18;

-- Pedido 4: Cliente 1 (María) - SHIPPED
INSERT INTO orders (customer_id, shipping_address_line_1, shipping_address_line_2, shipping_city, shipping_region_or_state, shipping_postal_code, shipping_country, status, subtotal, tax_rate, tax_amount, total_amount, created_at, updated_at)
SELECT 1, 'Calle 5 de Mayo 45', 'Interior 3B', 'Guadalajara', 'JAL', '44100', 'México', 'shipped', 0, @igv_rate, 0, 0, DATE_SUB(NOW(), INTERVAL 70 DAY), DATE_SUB(NOW(), INTERVAL 70 DAY);
SET @order4 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
    (@order4, 5, 2, 1099.99),
    (@order4, 17, 1, 89.99);
UPDATE orders SET subtotal = 1099.99*2 + 89.99, tax_amount = ROUND((1099.99*2 + 89.99) * 0.18, 2), total_amount = ROUND((1099.99*2 + 89.99) * 1.18, 2) WHERE id = @order4;
UPDATE inventory SET quantity = quantity - 2 WHERE product_id = 5;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 17;

-- Pedido 5: Cliente 2 (Carlos) - DELIVERED
INSERT INTO orders (customer_id, shipping_address_line_1, shipping_address_line_2, shipping_city, shipping_region_or_state, shipping_postal_code, shipping_country, status, subtotal, tax_rate, tax_amount, total_amount, created_at, updated_at)
SELECT 2, 'Calle Reforma 789', NULL, 'Monterrey', 'NL', '64000', 'México', 'delivered', 0, @igv_rate, 0, 0, DATE_SUB(NOW(), INTERVAL 130 DAY), DATE_SUB(NOW(), INTERVAL 130 DAY);
SET @order5 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
    (@order5, 11, 1, 649.99),
    (@order5, 14, 1, 149.99);
UPDATE orders SET subtotal = 649.99 + 149.99, tax_amount = ROUND((649.99 + 149.99) * 0.18, 2), total_amount = ROUND((649.99 + 149.99) * 1.18, 2) WHERE id = @order5;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 11;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 14;

-- Pedido 6: Cliente 3 (Ana) - DELIVERED
INSERT INTO orders (customer_id, shipping_address_line_1, shipping_address_line_2, shipping_city, shipping_region_or_state, shipping_postal_code, shipping_country, status, subtotal, tax_rate, tax_amount, total_amount, created_at, updated_at)
SELECT 3, 'Av. Insurgentes 234', NULL, 'Ciudad de México', 'CDMX', '06700', 'México', 'delivered', 0, @igv_rate, 0, 0, DATE_SUB(NOW(), INTERVAL 160 DAY), DATE_SUB(NOW(), INTERVAL 160 DAY);
SET @order6 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
    (@order6, 1, 1, 1299.99),
    (@order6, 7, 1, 399.99),
    (@order6, 15, 2, 59.99);
UPDATE orders SET subtotal = 1299.99 + 399.99 + 59.99*2, tax_amount = ROUND((1299.99 + 399.99 + 59.99*2) * 0.18, 2), total_amount = ROUND((1299.99 + 399.99 + 59.99*2) * 1.18, 2) WHERE id = @order6;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 1;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 7;
UPDATE inventory SET quantity = quantity - 2 WHERE product_id = 15;

-- Pedido 7: Cliente 3 (Ana) - SHIPPED
INSERT INTO orders (customer_id, shipping_address_line_1, shipping_address_line_2, shipping_city, shipping_region_or_state, shipping_postal_code, shipping_country, status, subtotal, tax_rate, tax_amount, total_amount, created_at, updated_at)
SELECT 3, 'Calle Hidalgo 567', 'Colonia Centro', 'Puebla', 'PUE', '72000', 'México', 'shipped', 0, @igv_rate, 0, 0, DATE_SUB(NOW(), INTERVAL 50 DAY), DATE_SUB(NOW(), INTERVAL 50 DAY);
SET @order7 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
    (@order7, 9, 1, 549.99),
    (@order7, 13, 1, 299.99),
    (@order7, 20, 3, 19.99);
UPDATE orders SET subtotal = 549.99 + 299.99 + 19.99*3, tax_amount = ROUND((549.99 + 299.99 + 19.99*3) * 0.18, 2), total_amount = ROUND((549.99 + 299.99 + 19.99*3) * 1.18, 2) WHERE id = @order7;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 9;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 13;
UPDATE inventory SET quantity = quantity - 3 WHERE product_id = 20;

-- Pedido 8: Cliente 4 (Jorge) - DELIVERED
INSERT INTO orders (customer_id, shipping_address_line_1, shipping_address_line_2, shipping_city, shipping_region_or_state, shipping_postal_code, shipping_country, status, subtotal, tax_rate, tax_amount, total_amount, created_at, updated_at)
SELECT 4, 'Boulevard Tecnológico 890', NULL, 'Querétaro', 'QRO', '76000', 'México', 'delivered', 0, @igv_rate, 0, 0, DATE_SUB(NOW(), INTERVAL 140 DAY), DATE_SUB(NOW(), INTERVAL 140 DAY);
SET @order8 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
    (@order8, 5, 1, 1099.99),
    (@order8, 12, 1, 449.99);
UPDATE orders SET subtotal = 1099.99 + 449.99, tax_amount = ROUND((1099.99 + 449.99) * 0.18, 2), total_amount = ROUND((1099.99 + 449.99) * 1.18, 2) WHERE id = @order8;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 5;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 12;

-- Pedido 9: Cliente 5 (Laura) - CONFIRMED
INSERT INTO orders (customer_id, shipping_address_line_1, shipping_address_line_2, shipping_city, shipping_region_or_state, shipping_postal_code, shipping_country, status, subtotal, tax_rate, tax_amount, total_amount, created_at, updated_at)
SELECT 5, 'Calle Morelos 123', NULL, 'Mérida', 'YUC', '97000', 'México', 'confirmed', 0, @igv_rate, 0, 0, DATE_SUB(NOW(), INTERVAL 30 DAY), DATE_SUB(NOW(), INTERVAL 30 DAY);
SET @order9 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
    (@order9, 10, 1, 649.99),
    (@order9, 18, 1, 39.99);
UPDATE orders SET subtotal = 649.99 + 39.99, tax_amount = ROUND((649.99 + 39.99) * 0.18, 2), total_amount = ROUND((649.99 + 39.99) * 1.18, 2) WHERE id = @order9;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 10;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 18;

-- Pedido 10: Cliente 7 (Sofía) - DELIVERED
INSERT INTO orders (customer_id, shipping_address_line_1, shipping_address_line_2, shipping_city, shipping_region_or_state, shipping_postal_code, shipping_country, status, subtotal, tax_rate, tax_amount, total_amount, created_at, updated_at)
SELECT 7, 'Av. Paseo 456', NULL, 'León', 'GTO', '37000', 'México', 'delivered', 0, @igv_rate, 0, 0, DATE_SUB(NOW(), INTERVAL 170 DAY), DATE_SUB(NOW(), INTERVAL 170 DAY);
SET @order10 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
    (@order10, 10, 1, 649.99),
    (@order10, 16, 2, 129.99),
    (@order10, 19, 1, 119.99);
UPDATE orders SET subtotal = 649.99 + 129.99*2 + 119.99, tax_amount = ROUND((649.99 + 129.99*2 + 119.99) * 0.18, 2), total_amount = ROUND((649.99 + 129.99*2 + 119.99) * 1.18, 2) WHERE id = @order10;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 10;
UPDATE inventory SET quantity = quantity - 2 WHERE product_id = 16;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 19;

-- Pedido 11: Cliente 7 (Sofía) - DELIVERED
INSERT INTO orders (customer_id, shipping_address_line_1, shipping_address_line_2, shipping_city, shipping_region_or_state, shipping_postal_code, shipping_country, status, subtotal, tax_rate, tax_amount, total_amount, created_at, updated_at)
SELECT 7, 'Calle Independencia 789', 'Colonia Moderna', 'San Luis Potosí', 'SLP', '78000', 'México', 'delivered', 0, @igv_rate, 0, 0, DATE_SUB(NOW(), INTERVAL 110 DAY), DATE_SUB(NOW(), INTERVAL 110 DAY);
SET @order11 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
    (@order11, 1, 1, 1299.99),
    (@order11, 8, 2, 699.99),
    (@order11, 14, 1, 149.99);
UPDATE orders SET subtotal = 1299.99 + 699.99*2 + 149.99, tax_amount = ROUND((1299.99 + 699.99*2 + 149.99) * 0.18, 2), total_amount = ROUND((1299.99 + 699.99*2 + 149.99) * 1.18, 2) WHERE id = @order11;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 1;
UPDATE inventory SET quantity = quantity - 2 WHERE product_id = 8;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 14;

-- Pedido 12: Cliente 7 (Sofía) - SHIPPED
INSERT INTO orders (customer_id, shipping_address_line_1, shipping_address_line_2, shipping_city, shipping_region_or_state, shipping_postal_code, shipping_country, status, subtotal, tax_rate, tax_amount, total_amount, created_at, updated_at)
SELECT 7, 'Av. Paseo 456', NULL, 'León', 'GTO', '37000', 'México', 'shipped', 0, @igv_rate, 0, 0, DATE_SUB(NOW(), INTERVAL 60 DAY), DATE_SUB(NOW(), INTERVAL 60 DAY);
SET @order12 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
    (@order12, 11, 1, 649.99),
    (@order12, 17, 1, 89.99),
    (@order12, 20, 2, 19.99);
UPDATE orders SET subtotal = 649.99 + 89.99 + 19.99*2, tax_amount = ROUND((649.99 + 89.99 + 19.99*2) * 0.18, 2), total_amount = ROUND((649.99 + 89.99 + 19.99*2) * 1.18, 2) WHERE id = @order12;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 11;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 17;
UPDATE inventory SET quantity = quantity - 2 WHERE product_id = 20;

-- Pedido 13: Cliente 7 (Sofía) - CONFIRMED
INSERT INTO orders (customer_id, shipping_address_line_1, shipping_address_line_2, shipping_city, shipping_region_or_state, shipping_postal_code, shipping_country, status, subtotal, tax_rate, tax_amount, total_amount, created_at, updated_at)
SELECT 7, 'Calle Independencia 789', 'Colonia Moderna', 'San Luis Potosí', 'SLP', '78000', 'México', 'confirmed', 0, @igv_rate, 0, 0, DATE_SUB(NOW(), INTERVAL 20 DAY), DATE_SUB(NOW(), INTERVAL 20 DAY);
SET @order13 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
    (@order13, 6, 1, 899.99),
    (@order13, 13, 1, 299.99),
    (@order13, 18, 2, 39.99);
UPDATE orders SET subtotal = 899.99 + 299.99 + 39.99*2, tax_amount = ROUND((899.99 + 299.99 + 39.99*2) * 0.18, 2), total_amount = ROUND((899.99 + 299.99 + 39.99*2) * 1.18, 2) WHERE id = @order13;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 6;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 13;
UPDATE inventory SET quantity = quantity - 2 WHERE product_id = 18;

-- Pedido 14: Cliente 7 (Sofía) - PENDING
INSERT INTO orders (customer_id, shipping_address_line_1, shipping_address_line_2, shipping_city, shipping_region_or_state, shipping_postal_code, shipping_country, status, subtotal, tax_rate, tax_amount, total_amount, created_at, updated_at)
SELECT 7, 'Av. Paseo 456', NULL, 'León', 'GTO', '37000', 'México', 'pending', 0, @igv_rate, 0, 0, DATE_SUB(NOW(), INTERVAL 5 DAY), DATE_SUB(NOW(), INTERVAL 5 DAY);
SET @order14 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
    (@order14, 5, 1, 1099.99),
    (@order14, 15, 2, 59.99);
UPDATE orders SET subtotal = 1099.99 + 59.99*2, tax_amount = ROUND((1099.99 + 59.99*2) * 0.18, 2), total_amount = ROUND((1099.99 + 59.99*2) * 1.18, 2) WHERE id = @order14;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 5;
UPDATE inventory SET quantity = quantity - 2 WHERE product_id = 15;

-- Pedido 15: Cliente 7 (Sofía) - PENDING
INSERT INTO orders (customer_id, shipping_address_line_1, shipping_address_line_2, shipping_city, shipping_region_or_state, shipping_postal_code, shipping_country, status, subtotal, tax_rate, tax_amount, total_amount, created_at, updated_at)
SELECT 7, 'Calle Independencia 789', 'Colonia Moderna', 'San Luis Potosí', 'SLP', '78000', 'México', 'pending', 0, @igv_rate, 0, 0, DATE_SUB(NOW(), INTERVAL 2 DAY), DATE_SUB(NOW(), INTERVAL 2 DAY);
SET @order15 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
    (@order15, 10, 1, 649.99),
    (@order15, 19, 1, 119.99);
UPDATE orders SET subtotal = 649.99 + 119.99, tax_amount = ROUND((649.99 + 119.99) * 0.18, 2), total_amount = ROUND((649.99 + 119.99) * 1.18, 2) WHERE id = @order15;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 10;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 19;

-- Pedido 16: Cliente 8 (David) - CANCELLED
INSERT INTO orders (customer_id, shipping_address_line_1, shipping_address_line_2, shipping_city, shipping_region_or_state, shipping_postal_code, shipping_country, status, subtotal, tax_rate, tax_amount, total_amount, created_at, updated_at)
SELECT 8, 'Calle Guerrero 234', NULL, 'Toluca', 'MEX', '50000', 'México', 'cancelled', 0, @igv_rate, 0, 0, DATE_SUB(NOW(), INTERVAL 45 DAY), DATE_SUB(NOW(), INTERVAL 45 DAY);
SET @order16 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
    (@order16, 12, 1, 449.99),
    (@order16, 16, 1, 129.99);
UPDATE orders SET subtotal = 449.99 + 129.99, tax_amount = ROUND((449.99 + 129.99) * 0.18, 2), total_amount = ROUND((449.99 + 129.99) * 1.18, 2) WHERE id = @order16;
-- NOTA: No se reduce inventario para pedidos cancelados

-- Pedido 17: Cliente 9 (Elena) - DELIVERED
INSERT INTO orders (customer_id, shipping_address_line_1, shipping_address_line_2, shipping_city, shipping_region_or_state, shipping_postal_code, shipping_country, status, subtotal, tax_rate, tax_amount, total_amount, created_at, updated_at)
SELECT 9, 'Av. Revolución 567', NULL, 'Morelia', 'MICH', '58000', 'México', 'delivered', 0, @igv_rate, 0, 0, DATE_SUB(NOW(), INTERVAL 145 DAY), DATE_SUB(NOW(), INTERVAL 145 DAY);
SET @order17 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
    (@order17, 7, 2, 399.99),
    (@order17, 17, 1, 89.99),
    (@order17, 20, 2, 19.99);
UPDATE orders SET subtotal = 399.99*2 + 89.99 + 19.99*2, tax_amount = ROUND((399.99*2 + 89.99 + 19.99*2) * 0.18, 2), total_amount = ROUND((399.99*2 + 89.99 + 19.99*2) * 1.18, 2) WHERE id = @order17;
UPDATE inventory SET quantity = quantity - 2 WHERE product_id = 7;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 17;
UPDATE inventory SET quantity = quantity - 2 WHERE product_id = 20;

-- Pedido 18: Cliente 9 (Elena) - SHIPPED
INSERT INTO orders (customer_id, shipping_address_line_1, shipping_address_line_2, shipping_city, shipping_region_or_state, shipping_postal_code, shipping_country, status, subtotal, tax_rate, tax_amount, total_amount, created_at, updated_at)
SELECT 9, 'Calle Zaragoza 890', 'Departamento 3A', 'Guadalajara', 'JAL', '44100', 'México', 'shipped', 0, @igv_rate, 0, 0, DATE_SUB(NOW(), INTERVAL 80 DAY), DATE_SUB(NOW(), INTERVAL 80 DAY);
SET @order18 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
    (@order18, 1, 1, 1299.99),
    (@order18, 14, 2, 149.99);
UPDATE orders SET subtotal = 1299.99 + 149.99*2, tax_amount = ROUND((1299.99 + 149.99*2) * 0.18, 2), total_amount = ROUND((1299.99 + 149.99*2) * 1.18, 2) WHERE id = @order18;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 1;
UPDATE inventory SET quantity = quantity - 2 WHERE product_id = 14;

-- Pedido 19: Cliente 9 (Elena) - CONFIRMED
INSERT INTO orders (customer_id, shipping_address_line_1, shipping_address_line_2, shipping_city, shipping_region_or_state, shipping_postal_code, shipping_country, status, subtotal, tax_rate, tax_amount, total_amount, created_at, updated_at)
SELECT 9, 'Av. Revolución 567', NULL, 'Morelia', 'MICH', '58000', 'México', 'confirmed', 0, @igv_rate, 0, 0, DATE_SUB(NOW(), INTERVAL 35 DAY), DATE_SUB(NOW(), INTERVAL 35 DAY);
SET @order19 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
    (@order19, 9, 1, 549.99),
    (@order19, 18, 1, 39.99),
    (@order19, 19, 1, 119.99);
UPDATE orders SET subtotal = 549.99 + 39.99 + 119.99, tax_amount = ROUND((549.99 + 39.99 + 119.99) * 0.18, 2), total_amount = ROUND((549.99 + 39.99 + 119.99) * 1.18, 2) WHERE id = @order19;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 9;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 18;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 19;

-- Pedido 20: Cliente 9 (Elena) - CANCELLED
INSERT INTO orders (customer_id, shipping_address_line_1, shipping_address_line_2, shipping_city, shipping_region_or_state, shipping_postal_code, shipping_country, status, subtotal, tax_rate, tax_amount, total_amount, created_at, updated_at)
SELECT 9, 'Calle Zaragoza 890', 'Departamento 3A', 'Guadalajara', 'JAL', '44100', 'México', 'cancelled', 0, @igv_rate, 0, 0, DATE_SUB(NOW(), INTERVAL 40 DAY), DATE_SUB(NOW(), INTERVAL 40 DAY);
SET @order20 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
    (@order20, 8, 1, 699.99),
    (@order20, 13, 2, 299.99);
UPDATE orders SET subtotal = 699.99 + 299.99*2, tax_amount = ROUND((699.99 + 299.99*2) * 0.18, 2), total_amount = ROUND((699.99 + 299.99*2) * 1.18, 2) WHERE id = @order20;
-- NOTA: No se reduce inventario para pedidos cancelados

-- Pedido 21: Cliente 10 (Pablo) - DELIVERED
INSERT INTO orders (customer_id, shipping_address_line_1, shipping_address_line_2, shipping_city, shipping_region_or_state, shipping_postal_code, shipping_country, status, subtotal, tax_rate, tax_amount, total_amount, created_at, updated_at)
SELECT 10, 'Boulevard Díaz Ordaz 123', NULL, 'Puebla', 'PUE', '72000', 'México', 'delivered', 0, @igv_rate, 0, 0, DATE_SUB(NOW(), INTERVAL 135 DAY), DATE_SUB(NOW(), INTERVAL 135 DAY);
SET @order21 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
    (@order21, 10, 1, 649.99),
    (@order21, 15, 1, 59.99);
UPDATE orders SET subtotal = 649.99 + 59.99, tax_amount = ROUND((649.99 + 59.99) * 0.18, 2), total_amount = ROUND((649.99 + 59.99) * 1.18, 2) WHERE id = @order21;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 10;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 15;

-- Pedido 22: Cliente 10 (Pablo) - SHIPPED
INSERT INTO orders (customer_id, shipping_address_line_1, shipping_address_line_2, shipping_city, shipping_region_or_state, shipping_postal_code, shipping_country, status, subtotal, tax_rate, tax_amount, total_amount, created_at, updated_at)
SELECT 10, 'Boulevard Díaz Ordaz 123', NULL, 'Puebla', 'PUE', '72000', 'México', 'shipped', 0, @igv_rate, 0, 0, DATE_SUB(NOW(), INTERVAL 55 DAY), DATE_SUB(NOW(), INTERVAL 55 DAY);
SET @order22 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
    (@order22, 6, 2, 899.99),
    (@order22, 12, 1, 449.99),
    (@order22, 16, 1, 129.99);
UPDATE orders SET subtotal = 899.99*2 + 449.99 + 129.99, tax_amount = ROUND((899.99*2 + 449.99 + 129.99) * 0.18, 2), total_amount = ROUND((899.99*2 + 449.99 + 129.99) * 1.18, 2) WHERE id = @order22;
UPDATE inventory SET quantity = quantity - 2 WHERE product_id = 6;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 12;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 16;

-- Pedido 23: Cliente 10 (Pablo) - CANCELLED
INSERT INTO orders (customer_id, shipping_address_line_1, shipping_address_line_2, shipping_city, shipping_region_or_state, shipping_postal_code, shipping_country, status, subtotal, tax_rate, tax_amount, total_amount, created_at, updated_at)
SELECT 10, 'Boulevard Díaz Ordaz 123', NULL, 'Puebla', 'PUE', '72000', 'México', 'cancelled', 0, @igv_rate, 0, 0, DATE_SUB(NOW(), INTERVAL 35 DAY), DATE_SUB(NOW(), INTERVAL 35 DAY);
SET @order23 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
    (@order23, 11, 1, 649.99),
    (@order23, 17, 2, 89.99);
UPDATE orders SET subtotal = 649.99 + 89.99*2, tax_amount = ROUND((649.99 + 89.99*2) * 0.18, 2), total_amount = ROUND((649.99 + 89.99*2) * 1.18, 2) WHERE id = @order23;
-- NOTA: No se reduce inventario para pedidos cancelados

-- Pedido 24: Cliente 6 (Miguel) - DELIVERED
INSERT INTO orders (customer_id, shipping_address_line_1, shipping_address_line_2, shipping_city, shipping_region_or_state, shipping_postal_code, shipping_country, status, subtotal, tax_rate, tax_amount, total_amount, created_at, updated_at)
SELECT 6, 'Calle Juárez 789', NULL, 'Tijuana', 'BC', '22000', 'México', 'delivered', 0, @igv_rate, 0, 0, DATE_SUB(NOW(), INTERVAL 90 DAY), DATE_SUB(NOW(), INTERVAL 90 DAY);
SET @order24 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
    (@order24, 5, 1, 1099.99),
    (@order24, 18, 2, 39.99);
UPDATE orders SET subtotal = 1099.99 + 39.99*2, tax_amount = ROUND((1099.99 + 39.99*2) * 0.18, 2), total_amount = ROUND((1099.99 + 39.99*2) * 1.18, 2) WHERE id = @order24;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 5;
UPDATE inventory SET quantity = quantity - 2 WHERE product_id = 18;

-- Pedido 25: Cliente 5 (Laura) - DELIVERED
INSERT INTO orders (customer_id, shipping_address_line_1, shipping_address_line_2, shipping_city, shipping_region_or_state, shipping_postal_code, shipping_country, status, subtotal, tax_rate, tax_amount, total_amount, created_at, updated_at)
SELECT 5, 'Av. Universidad 456', 'Local 12', 'Cancún', 'QROO', '77500', 'México', 'delivered', 0, @igv_rate, 0, 0, DATE_SUB(NOW(), INTERVAL 105 DAY), DATE_SUB(NOW(), INTERVAL 105 DAY);
SET @order25 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
    (@order25, 9, 1, 549.99),
    (@order25, 14, 1, 149.99),
    (@order25, 20, 2, 19.99);
UPDATE orders SET subtotal = 549.99 + 149.99 + 19.99*2, tax_amount = ROUND((549.99 + 149.99 + 19.99*2) * 0.18, 2), total_amount = ROUND((549.99 + 149.99 + 19.99*2) * 1.18, 2) WHERE id = @order25;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 9;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 14;
UPDATE inventory SET quantity = quantity - 2 WHERE product_id = 20;

-- Pedido 26: Cliente 2 (Carlos) - SHIPPED
INSERT INTO orders (customer_id, shipping_address_line_1, shipping_address_line_2, shipping_city, shipping_region_or_state, shipping_postal_code, shipping_country, status, subtotal, tax_rate, tax_amount, total_amount, created_at, updated_at)
SELECT 2, 'Calle Reforma 789', NULL, 'Monterrey', 'NL', '64000', 'México', 'shipped', 0, @igv_rate, 0, 0, DATE_SUB(NOW(), INTERVAL 65 DAY), DATE_SUB(NOW(), INTERVAL 65 DAY);
SET @order26 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
    (@order26, 13, 1, 299.99),
    (@order26, 15, 2, 59.99);
UPDATE orders SET subtotal = 299.99 + 59.99*2, tax_amount = ROUND((299.99 + 59.99*2) * 0.18, 2), total_amount = ROUND((299.99 + 59.99*2) * 1.18, 2) WHERE id = @order26;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 13;
UPDATE inventory SET quantity = quantity - 2 WHERE product_id = 15;

-- Pedido 27: Cliente 4 (Jorge) - CONFIRMED
INSERT INTO orders (customer_id, shipping_address_line_1, shipping_address_line_2, shipping_city, shipping_region_or_state, shipping_postal_code, shipping_country, status, subtotal, tax_rate, tax_amount, total_amount, created_at, updated_at)
SELECT 4, 'Boulevard Tecnológico 890', NULL, 'Querétaro', 'QRO', '76000', 'México', 'confirmed', 0, @igv_rate, 0, 0, DATE_SUB(NOW(), INTERVAL 25 DAY), DATE_SUB(NOW(), INTERVAL 25 DAY);
SET @order27 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
    (@order27, 1, 1, 1299.99),
    (@order27, 19, 1, 119.99);
UPDATE orders SET subtotal = 1299.99 + 119.99, tax_amount = ROUND((1299.99 + 119.99) * 0.18, 2), total_amount = ROUND((1299.99 + 119.99) * 1.18, 2) WHERE id = @order27;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 1;
UPDATE inventory SET quantity = quantity - 1 WHERE product_id = 19;

-- Pedido 28: Cliente 8 (David) - CANCELLED
INSERT INTO orders (customer_id, shipping_address_line_1, shipping_address_line_2, shipping_city, shipping_region_or_state, shipping_postal_code, shipping_country, status, subtotal, tax_rate, tax_amount, total_amount, created_at, updated_at)
SELECT 8, 'Calle Guerrero 234', NULL, 'Toluca', 'MEX', '50000', 'México', 'cancelled', 0, @igv_rate, 0, 0, DATE_SUB(NOW(), INTERVAL 30 DAY), DATE_SUB(NOW(), INTERVAL 30 DAY);
SET @order28 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
    (@order28, 7, 1, 399.99),
    (@order28, 16, 1, 129.99);
UPDATE orders SET subtotal = 399.99 + 129.99, tax_amount = ROUND((399.99 + 129.99) * 0.18, 2), total_amount = ROUND((399.99 + 129.99) * 1.18, 2) WHERE id = @order28;
-- NOTA: No se reduce inventario para pedidos cancelados

COMMIT;

-- =====================================================
-- 8. PAGOS (28)
-- =====================================================
INSERT INTO payments (order_id, status, amount, payment_method, transaction_reference, created_at, updated_at)
SELECT 
    id,
    CASE 
        WHEN status = 'cancelled' THEN 'failed'
        WHEN status = 'pending' THEN 'pending'
        ELSE 'completed'
    END,
    total_amount,
    CASE 
        WHEN RAND() < 0.55 THEN 'card'
        WHEN RAND() < 0.85 THEN 'paypal'
        ELSE 'bank_transfer'
    END,
    CONCAT('TXN-', LPAD(id, 4, '0'), '-', FLOOR(1000 + RAND() * 9000)),
    created_at,
    updated_at
FROM orders;

-- =====================================================
-- 9. ENVÍOS (17: 5 shipped + 12 delivered)
-- =====================================================
INSERT INTO shipments (order_id, status, tracking_number, shipped_at, delivered_at, created_at, updated_at)
SELECT 
    id,
    status,
    CONCAT(
        CASE 
            WHEN status = 'shipped' THEN 'TRK-SHIP-'
            WHEN status = 'delivered' THEN 'TRK-DEL-'
        END,
        LPAD(id, 4, '0'),
        '-',
        FLOOR(100 + RAND() * 899)
    ),
    DATE_ADD(created_at, INTERVAL FLOOR(1 + RAND() * 3) DAY),
    CASE 
        WHEN status = 'delivered' THEN DATE_ADD(DATE_ADD(created_at, INTERVAL FLOOR(1 + RAND() * 3) DAY), INTERVAL FLOOR(2 + RAND() * 4) DAY)
        ELSE NULL
    END,
    created_at,
    updated_at
FROM orders
WHERE status IN ('shipped', 'delivered');

-- =====================================================
-- Fin del archivo
-- =====================================================