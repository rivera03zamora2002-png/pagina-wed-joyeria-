CREATE TABLE `clientes`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre_completo` VARCHAR(255) NOT NULL,
    `gmail` VARCHAR(255) NOT NULL,
    `contraseña` VARCHAR(255) NOT NULL,
    `telefono` BIGINT NOT NULL,
    `direccion` TEXT NOT NULL,
    `fecha_registro` DATETIME NOT NULL,
    `activo` BOOLEAN NOT NULL
);
CREATE TABLE `Detalle_ventas`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `venta_id` BIGINT NOT NULL,
    `producto_id` BIGINT NOT NULL,
    `cantidad` BIGINT NOT NULL,
    `precio_unitario_historico` DECIMAL(15, 2) NOT NULL,
    `subtotal` DECIMAL(15, 2) NOT NULL
);
CREATE TABLE `Catalogo_metodos_pago`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre_metodo` VARCHAR(50) NOT NULL,
    `activo` TINYINT NOT NULL
);
CREATE TABLE `Categorias`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(50) NOT NULL,
    `descripcion` TEXT NOT NULL
);
CREATE TABLE `Productos`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `sku` VARCHAR(255) NOT NULL,
    `nombre` VARCHAR(100) NOT NULL,
    `categoria_id` BIGINT NOT NULL,
    `material_principal` VARCHAR(50) NOT NULL,
    `peso_gramos` DECIMAL(10, 2) NOT NULL,
    `precio_actual` BIGINT(15) NOT NULL,
    `stock_total` BIGINT NOT NULL,
    `imagen_url` VARCHAR(255) NOT NULL
);
CREATE TABLE `Detalle_gemas`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `producto_id` BIGINT NOT NULL,
    `tipo_gema` VARCHAR(50) NOT NULL,
    `quilates` DECIMAL(5, 3) NOT NULL,
    `corte` VARCHAR(50) NOT NULL,
    `claridad` VARCHAR(20) NOT NULL
);
CREATE TABLE `Ventas`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `cliente_id` BIGINT NOT NULL,
    `fecha_venta` DATETIME NOT NULL,
    `total` DECIMAL(15, 2) NOT NULL,
    `metodo_pago` BIGINT NOT NULL
);
CREATE TABLE `pagos_ventas`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `venta_id` BIGINT NOT NULL,
    `metodo_pago_id` BIGINT NOT NULL,
    `monto_pagado` DECIMAL(15, 2) NOT NULL,
    `referencia_transaccion` VARCHAR(100) NOT NULL,
    `fecha_pago` DATETIME NOT NULL
);
ALTER TABLE
    `Ventas` ADD CONSTRAINT `ventas_cliente_id_foreign` FOREIGN KEY(`cliente_id`) REFERENCES `clientes`(`id`);
ALTER TABLE
    `Detalle_ventas` ADD CONSTRAINT `detalle_ventas_producto_id_foreign` FOREIGN KEY(`producto_id`) REFERENCES `Productos`(`id`);
ALTER TABLE
    `Productos` ADD CONSTRAINT `productos_categoria_id_foreign` FOREIGN KEY(`categoria_id`) REFERENCES `Categorias`(`id`);
ALTER TABLE
    `pagos_ventas` ADD CONSTRAINT `pagos_ventas_venta_id_foreign` FOREIGN KEY(`venta_id`) REFERENCES `Ventas`(`id`);
ALTER TABLE
    `pagos_ventas` ADD CONSTRAINT `pagos_ventas_metodo_pago_id_foreign` FOREIGN KEY(`metodo_pago_id`) REFERENCES `Catalogo_metodos_pago`(`id`);
ALTER TABLE
    `Detalle_gemas` ADD CONSTRAINT `detalle_gemas_producto_id_foreign` FOREIGN KEY(`producto_id`) REFERENCES `Productos`(`id`);
ALTER TABLE
    `Detalle_ventas` ADD CONSTRAINT `detalle_ventas_venta_id_foreign` FOREIGN KEY(`venta_id`) REFERENCES `Productos`(`id`);
ALTER TABLE
    `Detalle_gemas` ADD CONSTRAINT `detalle_gemas_id_foreign` FOREIGN KEY(`id`) REFERENCES `Ventas`(`id`);