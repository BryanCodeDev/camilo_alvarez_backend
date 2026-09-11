-- Seed data for TechStore
-- This file is intended to be run manually after migrations
-- It does NOT contain demo/test data

-- Clean up any existing seed products (identified by SKU prefix)
DELETE FROM `product_images` WHERE `product_id` IN (
  SELECT `id` FROM `products` WHERE `sku` LIKE 'SEED-%'
);

DELETE FROM `products` WHERE `sku` LIKE 'SEED-%';

-- Insert test users (1 per role, password: Admin1012@)
INSERT IGNORE INTO `users` (`first_name`, `last_name`, `email`, `password_hash`, `role_id`, `is_active`, `email_verified`) VALUES
('Admin', 'TechStore', 'admin@techstore.com', '$2a$12$kzlsqHY/QgEcOxqnX22zv.P1h.oRrupoNzW.2jBDdUfy5lAu1nRyi', 1, TRUE, TRUE),
('User', 'Test', 'user@techstore.com', '$2a$12$kzlsqHY/QgEcOxqnX22zv.P1h.oRrupoNzW.2jBDdUfy5lAu1nRyi', 2, TRUE, TRUE),
('Guest', 'Test', 'guest@techstore.com', '$2a$12$kzlsqHY/QgEcOxqnX22zv.P1h.oRrupoNzW.2jBDdUfy5lAu1nRyi', 3, TRUE, FALSE);

-- Insert seed products (no hardcoded IDs - let AUTO_INCREMENT handle it)
INSERT INTO `products` (
  `category_id`, `brand_id`, `name`, `slug`, `sku`, `short_description`, `description`,
  `specifications`, `features`, `warranty`, `price`, `original_price`, `discount_percent`,
  `cost_price`, `stock`, `min_stock`, `weight`, `dimensions`, `is_active`, `is_featured`,
  `is_new`, `is_on_sale`, `sale_starts_at`, `sale_ends_at`, `meta_title`, `meta_description`
) VALUES
(6, 10, 'Cables y Cargadores para Celulares', 'cables-cargadores-celulares', 'SEED-CAB-001',
 'Kit completo de cables y cargadores universales para celulares',
 '<p>Kit completo de cables y cargadores universales para celulares. Compatible con USB-C, Lightning y Micro USB.</p>',
 JSON_OBJECT('Conectores', 'USB-C, Lightning, Micro USB', 'Longitud', '1m / 2m', 'Material', 'Nylon trenzado'),
 JSON_ARRAY('Universal', 'Carga rápida', 'Durable', 'Múltiples conectores'),
 '12 meses', 15900, 24900, 36, 9500, 50, 3, 0.05, '20 x 10 x 5 cm',
 TRUE, TRUE, FALSE, TRUE, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 30 DAY),
 'Cables y Cargadores para Celulares', 'Kit completo de cables y cargadores universales.'),

(1, 3, 'Audífonos', 'audifonos', 'SEED-AUD-001',
 'Audífonos inalámbricos con cancelación de ruido',
 '<p>Audífonos inalámbricos premium con cancelación de ruido activa, sonido envolvente y batería de larga duración.</p>',
 JSON_OBJECT('Tipo', 'In-ear', 'Conectividad', 'Bluetooth 5.3', 'Batería', '30 horas', 'Cancelación', 'Activos'),
 JSON_ARRAY('Bluetooth 5.3', 'Cancelación de ruido', 'Batería 30h', 'Carga rápida', 'Micrófono HD'),
 '18 meses', 34900, 59900, 41, 24000, 35, 1, 0.15, '18 x 8 x 5 cm',
 TRUE, TRUE, FALSE, TRUE, DATE_SUB(NOW(), INTERVAL 2 DAY), DATE_ADD(NOW(), INTERVAL 25 DAY),
 'Audífonos', 'Audífonos inalámbricos premium con cancelación de ruido activa.'),

(7, 9, 'Cargadores Vehiculares', 'cargadores-vehiculares', 'SEED-CAR-001',
 'Cargador veicular USB-C de carga rápida para autos',
 '<p>Cargador veicular USB-C con carga rápida de 35W, doble puerto y diseño compacto para tu auto.</p>',
 JSON_OBJECT('Potencia', '35W', 'Puertos', '2x USB-C', 'Compatibilidad', 'Android/iPhone', 'Entrada', '12-24V'),
 JSON_ARRAY('Carga rápida 35W', 'Doble puerto', 'Compacto', 'Protección contra sobrecarga', 'Cable USB-C incluido'),
  '12 meses', 8900, 14900, 40, 3500, 45, 3, 0.08, '12 x 6 x 4 cm',
 TRUE, FALSE, FALSE, TRUE, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 30 DAY),
 'Cargadores Vehiculares', 'Cargador veicular USB-C de carga rápida para autos.'),

(7, 10, 'Cargadores Portátiles', 'cargadores-portatiles', 'SEED-PWR-001',
 'Power Bank de 20000mAh con carga rápida',
 '<p>Power Bank de 20000mAh con carga rápida de 45W, doble puerto USB-C y pantalla de carga.</p>',
 JSON_OBJECT('Capacidad', '20000mAh', 'Potencia', '45W', 'Puertos', '2x USB-C, 1x USB-A', 'Batería', 'Li-ion'),
 JSON_ARRAY('Carga rápida 45W', '20000mAh', 'Doble USB-C', 'Pantalla LED', 'Carga passthrough'),
  '12 meses', 12900, 19900, 35, 8500, 60, 3, 0.35, '15 x 7 x 2 cm',
 TRUE, TRUE, FALSE, TRUE, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 30 DAY),
 'Cargadores Portátiles', 'Power Bank de 20000mAh con carga rápida.'),

(6, 1, 'Soportes Para Celulares', 'soportes-celulares', 'SEED-SUP-001',
 'Soporte magnético universal para celulares',
 '<p>Soporte magnético universal con agarre fuerte, rotación 360° y compatible con carga inalámbrica.</p>',
 JSON_OBJECT('Material', 'Aluminio', 'Montaje', 'Ventosa/air vent', 'Rotación', '360°', 'Imán', 'Neodimio'),
 JSON_ARRAY('Magnético', '360° rotación', 'Universal', 'Carga inalámbrica', 'Ventosa y clip'),
  '12 meses', 3200, 5900, 45, 1200, 80, 3, 0.04, '10 x 8 x 12 cm',
 TRUE, FALSE, FALSE, TRUE, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 30 DAY),
 'Soportes Para Celulares', 'Soporte magnético universal para celulares.'),

(6, 10, 'Adaptadores', 'adaptadores', 'SEED-ADP-001',
 'Adaptador USB-C a HDMI/USB-A/LAN',
 '<p>Adaptador multipuerto USB-C con HDMI, USB-A, LAN y carga pass-through. Compatible con Mac y Windows.</p>',
 JSON_OBJECT('Puertos', 'HDMI + 2x USB-A + LAN + USB-C', 'Resolución', '4K@30Hz', 'Conectividad', 'Gigabit LAN', 'Compatibilidad', 'Mac/Windows'),
 JSON_ARRAY('4K HDMI', 'USB-A x2', 'Gigabit LAN', 'Carga pass-through', 'Compacto'),
  '12 meses', 4200, 7900, 47, 1800, 40, 3, 0.06, '8 x 5 x 2 cm',
 TRUE, FALSE, FALSE, TRUE, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 30 DAY),
 'Adaptadores', 'Adaptador multipuerto USB-C con HDMI, USB-A, LAN y carga pass-through.'),

(1, 3, 'Estuches Para Audifonos', 'estuches-audifonos', 'SEED-EST-001',
 'Estuche protector para audífonos y earbuds',
 '<p>Estuche rígido protector para audífonos y earbuds, con compartimento para cables y cierre magnético.</p>',
 JSON_OBJECT('Material', 'Silicona rígida', 'Cierre', 'Magnético', 'Compartimentos', 'Principal + cables', 'Resistencia', 'Agua IPX4'),
 JSON_ARRAY('Rígido', 'Magnético', 'Cables', 'IPX4', 'Compacto'),
  '12 meses', 1500, 2900, 50, 800, 100, 3, 0.02, '12 x 8 x 5 cm',
 TRUE, FALSE, FALSE, TRUE, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 30 DAY),
 'Estuches Para Audifonos', 'Estuche protector para audífonos y earbuds.');

-- Note: Product images should be managed through the admin interface or Cloudinary uploads.
-- The seed file does not include image URLs to avoid hardcoded paths.
