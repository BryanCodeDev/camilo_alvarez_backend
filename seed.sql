SET NAMES utf8mb4;
USE `techstore`;

START TRANSACTION;

INSERT IGNORE INTO `roles` (`id`, `name`, `description`, `permissions`) VALUES
(1, 'admin', 'Administrador completo', JSON_OBJECT('all', TRUE)),
(2, 'user', 'Usuario registrado', JSON_OBJECT('orders', JSON_ARRAY('read', 'create'), 'profile', JSON_ARRAY('read', 'update'), 'cart', JSON_ARRAY('read', 'create', 'update', 'delete'))),
(3, 'guest', 'Usuario invitado', JSON_OBJECT('cart', JSON_ARRAY('read', 'create', 'update', 'delete')));

INSERT IGNORE INTO `categories` (`id`, `name`, `slug`, `description`, `seo_title`, `seo_description`, `is_active`, `sort_order`) VALUES
(1, 'Audio', 'audio', 'Auriculares, parlantes y accesorios de audio', 'Audio', 'Descubrí auriculares, parlantes y accesorios de audio.', TRUE, 1),
(2, 'Smartphones', 'smartphones', 'Teléfonos inteligentes y accesorios', 'Smartphones', 'Explorá smartphones y accesorios seleccionados.', TRUE, 2),
(3, 'Computadores', 'computadores', 'Laptops, desktops y accesorios', 'Computadores', 'Encontrá computadores para trabajar, estudiar y crear.', TRUE, 3),
(4, 'Gaming', 'gaming', 'Consolas, periféricos y accesorios gaming', 'Gaming', 'Equipamiento gaming para jugar al máximo nivel.', TRUE, 4),
(5, 'Smartwatch', 'smartwatch', 'Relojes inteligentes y wearables', 'Smartwatch', 'Relojes inteligentes y wearables para tu día a día.', TRUE, 5),
(6, 'Accesorios', 'accesorios', 'Cables, fundas, soportes y más', 'Accesorios', 'Accesorios tecnológicos esenciales.', TRUE, 6),
(7, 'Cargadores', 'cargadores', 'Cargadores, power banks y adaptadores', 'Cargadores', 'Mantené tus dispositivos siempre cargados.', TRUE, 7),
(8, 'Periféricos', 'periféricos', 'Teclados, mouse, webcams y más', 'Periféricos', 'Periféricos para mejorar tu experiencia.', TRUE, 8),
(9, 'Gadgets', 'gadgets', 'Dispositivos innovadores y tecnología', 'Gadgets', 'Tecnología innovadora para cada necesidad.', TRUE, 9);

INSERT IGNORE INTO `brands` (`id`, `name`, `slug`, `description`, `is_active`) VALUES
(1, 'Apple', 'apple', 'Tecnología y dispositivos premium', TRUE),
(2, 'Samsung', 'samsung', 'Dispositivos y soluciones tecnológicas', TRUE),
(3, 'Sony', 'sony', 'Audio y entretenimiento', TRUE),
(4, 'Logitech', 'logitech', 'Periféricos y accesorios', TRUE),
(5, 'Xiaomi', 'xiaomi', 'Tecnología accesible e innovadora', TRUE),
(6, 'Microsoft', 'microsoft', 'Computación y productividad', TRUE),
(7, 'Razer', 'razer', 'Equipamiento gaming', TRUE),
(8, 'ASUS', 'asus', 'Computación y gaming', TRUE),
(9, 'TP-Link', 'tp-link', 'Conectividad y redes', TRUE),
(10, 'Anker', 'anker', 'Carga y accesorios', TRUE);

INSERT IGNORE INTO `settings` (`key`, `value`, `description`) VALUES
('site_name', '"TechStore"', 'Nombre del sitio'),
('site_url', '"http://localhost:5173"', 'URL del sitio'),
('whatsapp_number', '"5491100000000"', 'Número de WhatsApp para pedidos'),
('free_shipping_threshold', '100000', 'Monto mínimo para envío gratis'),
('default_currency', '"ARS"', 'Moneda por defecto'),
('tax_rate', '0.21', 'Tasa de impuesto'),
('mercadopago_enabled', 'true', 'Habilitar Mercado Pago'),
('maintenance_mode', 'false', 'Modo mantenimiento');

INSERT IGNORE INTO `users` (`id`, `role_id`, `first_name`, `last_name`, `email`, `password_hash`, `phone`, `address`, `city`, `province`, `is_active`, `email_verified`) VALUES
(1, 1, 'Admin', 'TechStore', 'admin@techstore.com', '$2a$12$LhbaxsqJe4XunElhWLIjce/K3RrYeKEI3hBQsGYj67Od16OIe1keO', NULL, NULL, NULL, NULL, TRUE, TRUE),
(2, 2, 'Usuario', 'Demo', 'usuario@techstore.com', '$2a$12$it56YhlHBB72dfQ2BfXtA.91Nab8Omkl/IdQYsEwuNqlLnZlu/t52', '5491112345678', 'Av. Demo 123', 'Buenos Aires', 'Buenos Aires', TRUE, TRUE);

INSERT IGNORE INTO `products` (
  `id`, `category_id`, `brand_id`, `name`, `slug`, `sku`, `short_description`, `description`,
  `specifications`, `features`, `warranty`, `price`, `original_price`, `discount_percent`,
  `cost_price`, `stock`, `min_stock`, `weight`, `dimensions`, `is_active`, `is_featured`,
  `is_new`, `is_on_sale`, `sale_starts_at`, `sale_ends_at`, `meta_title`, `meta_description`
) VALUES
(1, 1, 1, 'AirPods Pro 2da Generación', 'airpods-pro-2', 'AUD-APP-001', 'Auriculares inalámbricos con cancelación de ruido activa y audio espacial', '<p>Auriculares inalámbricos con cancelación de ruido activa, audio espacial y estuche de carga.</p>', JSON_OBJECT('Chip', 'H2', 'Bluetooth', '5.3', 'Resistencia', 'IPX4', 'Autonomía', 'Hasta 30 horas con estuche'), JSON_ARRAY('Cancelación de ruido activa', 'Audio espacial', 'Modo transparencia', 'Estuche de carga'), '12 meses', 89900, 119900, 25, 65000, 15, 3, 0.056, '2 x 2 cm', TRUE, TRUE, FALSE, TRUE, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 30 DAY), 'AirPods Pro 2', 'AirPods Pro 2 con cancelación de ruido activa y audio espacial.'),
(2, 2, 1, 'iPhone 15 Pro Max 256GB', 'iphone-15-pro-max-256gb', 'SPH-APP-002', 'Smartphone flagship con chip A17 Pro, cámara de 48MP y diseño en titanio', '<p>Smartphone flagship con chip A17 Pro, sistema de cámaras profesional y diseño en titanio.</p>', JSON_OBJECT('Pantalla', '6.7 pulgadas', 'Chip', 'A17 Pro', 'Almacenamiento', '256GB', 'Cámara principal', '48MP'), JSON_ARRAY('Dynamic Island', 'Face ID', '5G', 'Resistencia IP68'), '12 meses', 1299900, 1449900, 10, 1050000, 8, 2, 0.221, '16 x 8 x 1 cm', TRUE, TRUE, TRUE, TRUE, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 30 DAY), 'iPhone 15 Pro Max 256GB', 'iPhone 15 Pro Max con chip A17 Pro y cámara profesional.'),
(3, 3, 1, 'MacBook Air M2 13.6 8GB 256GB', 'macbook-air-m2-13-8gb-256gb', 'CMP-APP-003', 'Laptop ultraportátil con chip M2, pantalla Liquid Retina y gran autonomía', '<p>Laptop ultraportátil con chip M2, pantalla Liquid Retina y hasta 18 horas de autonomía.</p>', JSON_OBJECT('Chip', 'Apple M2', 'Memoria', '8GB', 'Almacenamiento', '256GB SSD', 'Pantalla', '13.6 pulgadas'), JSON_ARRAY('Chip M2', 'Pantalla Liquid Retina', 'Hasta 18 horas', 'Touch ID'), '12 meses', 999900, 1149900, 13, 820000, 5, 2, 1.24, '30 x 21 x 1 cm', TRUE, TRUE, FALSE, TRUE, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 30 DAY), 'MacBook Air M2', 'MacBook Air M2 ultraportátil con gran autonomía.'),
(4, 1, 3, 'Sony WH-1000XM5', 'sony-wh-1000xm5', 'AUD-SNY-004', 'Auriculares over-ear con cancelación de ruido y sonido premium', '<p>Auriculares over-ear con cancelación de ruido, sonido premium y hasta 30 horas de autonomía.</p>', JSON_OBJECT('Driver', '30mm', 'Bluetooth', '5.2', 'Autonomía', '30 horas', 'Peso', '250g'), JSON_ARRAY('Cancelación de ruido', 'Carga rápida', 'Multipunto', 'Modo ambiente'), '12 meses', 349900, 429900, 19, 280000, 22, 5, 0.25, '20 x 18 x 8 cm', TRUE, TRUE, FALSE, TRUE, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 30 DAY), 'Sony WH-1000XM5', 'Auriculares Sony con cancelación de ruido premium.'),
(5, 2, 2, 'Samsung Galaxy S24 Ultra 512GB', 'samsung-galaxy-s24-ultra-512gb', 'SPH-SAM-005', 'Smartphone Android con S Pen, cámara de 200MP y Galaxy AI', '<p>Smartphone Android con S Pen, cámara de 200MP, Galaxy AI y diseño en titanio.</p>', JSON_OBJECT('Pantalla', '6.8 pulgadas', 'Chip', 'Snapdragon 8 Gen 3', 'Almacenamiento', '512GB', 'RAM', '12GB'), JSON_ARRAY('Galaxy AI', 'S Pen', 'Cámara 200MP', 'Resistencia IP68'), '12 meses', 1199900, 1349900, 11, 980000, 12, 3, 0.232, '16 x 8 x 1 cm', TRUE, TRUE, TRUE, TRUE, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 30 DAY), 'Samsung Galaxy S24 Ultra', 'Samsung Galaxy S24 Ultra con Galaxy AI y S Pen.'),
(6, 4, 4, 'Logitech G Pro X Superlight 2', 'logitech-g-pro-x-superlight-2', 'GAM-LOG-006', 'Mouse gaming inalámbrico ultraligero con sensor HERO 2', '<p>Mouse gaming inalámbrico ultraligero con sensor HERO 2 y hasta 95 horas de batería.</p>', JSON_OBJECT('Sensor', 'HERO 2', 'DPI', '32000', 'Peso', '60g', 'Batería', '95 horas'), JSON_ARRAY('Ultraligero', 'HERO 2', 'LIGHTSPEED', 'Switches híbridos'), '24 meses', 159900, 189900, 16, 120000, 30, 5, 0.06, '12 x 6 x 4 cm', TRUE, TRUE, FALSE, TRUE, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 30 DAY), 'Logitech G Pro X Superlight 2', 'Mouse gaming Logitech ultraligero para competición.'),
(7, 5, 1, 'Apple Watch Series 9 45mm', 'apple-watch-series-9-45mm', 'SWT-APP-007', 'Smartwatch con chip S9, pantalla brillante y seguimiento avanzado', '<p>Smartwatch con chip S9, pantalla Always-On más brillante y funciones avanzadas de salud.</p>', JSON_OBJECT('Caja', '45mm', 'Chip', 'S9', 'Batería', 'Hasta 36 horas', 'Resistencia', '50m'), JSON_ARRAY('Chip S9', 'Doble toque', 'ECG', 'Detección de caídas'), '12 meses', 449900, 499900, 10, 360000, 18, 3, 0.038, '4 x 4 x 1 cm', TRUE, TRUE, TRUE, TRUE, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 30 DAY), 'Apple Watch Series 9', 'Apple Watch Series 9 con chip S9 y monitoreo avanzado.'),
(8, 4, 2, 'Samsung Odyssey G9 49', 'samsung-49-odyssey-g9', 'GAM-SAM-008', 'Monitor gaming curvo 49 pulgadas, 240Hz y resolución DQHD', '<p>Monitor gaming curvo 49 pulgadas con resolución DQHD, 240Hz y tecnología HDR.</p>', JSON_OBJECT('Tamaño', '49 pulgadas', 'Curvatura', '1000R', 'Refresco', '240Hz', 'Resolución', '5120 x 1440'), JSON_ARRAY('Panel curvo', '240Hz', 'HDR1000', 'G-Sync compatible'), '36 meses', 1299900, 1599900, 19, 1050000, 6, 2, 8.5, '115 x 42 x 22 cm', TRUE, TRUE, FALSE, TRUE, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 30 DAY), 'Samsung Odyssey G9 49', 'Monitor gaming Samsung Odyssey G9 curvo 49 pulgadas.'),
(9, 7, 5, 'Xiaomi Power Bank 20000mAh', 'xiaomi-power-bank-20000mah', 'CHR-XIA-009', 'Batería externa de alta capacidad con carga rápida USB-C', '<p>Batería externa de alta capacidad con carga rápida y diseño compacto.</p>', JSON_OBJECT('Capacidad', '20000mAh', 'Puertos', 'USB-C y USB-A', 'Potencia', '22.5W'), JSON_ARRAY('Carga rápida', 'Alta capacidad', 'Doble salida', 'Protección integral'), '12 meses', 49900, 59900, 17, 35000, 40, 8, 0.42, '15 x 7 x 3 cm', TRUE, FALSE, TRUE, TRUE, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 30 DAY), 'Xiaomi Power Bank 20000mAh', 'Batería externa Xiaomi de 20000mAh con carga rápida.'),
(10, 8, 4, 'Logitech MX Keys S', 'logitech-mx-keys-s', 'PER-LOG-010', 'Teclado inalámbrico premium para productividad', '<p>Teclado inalámbrico premium con teclas retroiluminadas y conexión multipunto.</p>', JSON_OBJECT('Conectividad', 'Bluetooth y USB', 'Teclas', 'Retroiluminadas', 'Batería', 'Hasta 10 días'), JSON_ARRAY('Multipunto', 'Teclas retroiluminadas', 'Diseño ergonómico', 'Recarga USB-C'), '24 meses', 119900, 139900, 14, 90000, 16, 4, 0.83, '43 x 13 x 2 cm', TRUE, FALSE, FALSE, TRUE, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 30 DAY), 'Logitech MX Keys S', 'Teclado inalámbrico Logitech para productividad.'),
(11, 6, 10, 'Anker Hub USB-C 7 en 1', 'anker-hub-usb-c-7-en-1', 'ACC-ANK-011', 'Hub USB-C multipuerto para trabajo y entretenimiento', '<p>Hub USB-C multipuerto con HDMI, USB, lector de tarjetas y carga de datos.</p>', JSON_OBJECT('Puertos', '7 en 1', 'Video', 'HDMI 4K', 'Datos', 'USB 3.0'), JSON_ARRAY('HDMI 4K', 'USB 3.0', 'Lector de tarjetas', 'Diseño compacto'), '18 meses', 39900, 49900, 20, 28000, 25, 5, 0.09, '11 x 4 x 1 cm', TRUE, FALSE, TRUE, TRUE, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 30 DAY), 'Anker Hub USB-C 7 en 1', 'Hub USB-C Anker multipuerto para conectar tus dispositivos.'),
(12, 9, 9, 'TP-Link Router Wi-Fi 6', 'tp-link-router-wifi-6', 'GAD-TPL-012', 'Router de alta velocidad con Wi-Fi 6 y cobertura estable', '<p>Router de alta velocidad con Wi-Fi 6, mayor cobertura y conexión estable para tu hogar.</p>', JSON_OBJECT('Estándar', 'Wi-Fi 6', 'Velocidad', '3000Mbps', 'Antenas', '4 de alta ganancia'), JSON_ARRAY('Wi-Fi 6', 'Alta velocidad', 'Cuatro antenas', 'Configuración sencilla'), '24 meses', 89900, 109900, 18, 62000, 0, 3, 0.55, '26 x 18 x 6 cm', TRUE, FALSE, FALSE, TRUE, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 30 DAY), 'TP-Link Router Wi-Fi 6', 'Router TP-Link Wi-Fi 6 de alta velocidad y cobertura estable.');

COMMIT;
