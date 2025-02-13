-- Entendiendo los datos
SELECT *
FROM tickets
LIMIT 100;


-- Pregunta 1: ¿Cuál es el ingreso total generado por el negocio?
SELECT SUM(precio_total) AS ingreso_total
FROM tickets;



-- Pregunta 2: ¿Cómo ha sido la tendencia de ingresos mensuales?
SELECT strftime('%Y-%m', fecha) AS mes, SUM(precio_total) AS ingreso_mensual
FROM tickets
GROUP BY mes
ORDER BY mes;


-- Pregunta 3: ¿Cuál es el rendimiento de cada departamento en términos de ventas?
SELECT id_departamento, SUM(precio_total) AS ventas_departamento
FROM tickets
GROUP BY id_departamento
ORDER BY ventas_departamento DESC;

-- Pregunta 4: ¿Cómo se distribuyen las ventas entre las diferentes secciones?
SELECT id_seccion, SUM(precio_total) AS ventas_seccion
FROM tickets
GROUP BY id_seccion
ORDER BY ventas_seccion DESC;

-- Pregunta 5: ¿Cuáles son los 10 productos más vendidos en cantidad?
SELECT nombre_producto, SUM(cantidad) AS total_vendido
FROM tickets
GROUP BY nombre_producto
ORDER BY total_vendido DESC
LIMIT 10;

-- Pregunta 6: ¿Qué 10 productos generan más ingresos?
SELECT nombre_producto, SUM(precio_total) AS ingreso_producto
FROM tickets
GROUP BY nombre_producto
ORDER BY ingreso_producto DESC
LIMIT 10;


-- Pregunta 7: ¿Quiénes son los 20 clientes que más compran en términos de ingresos?
SELECT id_cliente, SUM(precio_total) AS ingreso_cliente
FROM tickets
GROUP BY id_cliente
ORDER BY ingreso_cliente DESC
LIMIT 20;

-- Pregunta 8: ¿Cuál es la compra media por cliente?
SELECT AVG(compra_total_cliente) AS compra_media_por_cliente 
FROM ( 
SELECT id_cliente, SUM(precio_total) AS compra_total_cliente 
FROM tickets 
GROUP BY id_cliente ) subconsulta;


-- Pregunta 9: ¿Cuántos pedidos totales se han realizado?
SELECT COUNT(DISTINCT id_pedido) AS total_pedidos
FROM tickets;

-- Pregunta 10: ¿Cuál es el valor promedio por pedido?
SELECT AVG(total_pedido) AS valor_promedio_pedido
FROM (
SELECT id_pedido, SUM(precio_total) AS total_pedido
FROM tickets
GROUP BY id_pedido
) subconsulta;
