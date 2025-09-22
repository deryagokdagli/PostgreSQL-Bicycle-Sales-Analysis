--Bisiklet Satışları Analizi 

--Bu projede aşağıdaki sorulara yanıt aranacaktır:

--Hangi müşteriler sipariş vermiş/vermemiş?
--Bir müşterinin toplam sipariş sayısı ve toplam harcaması ne kadar?
--Belirli şehirlerde/eyaletlerde kaç müşteri var?
--En çok satılan ürünler neler?
--En çok ciroyu hangi sipariş oluşturmuş?
--Hangi tarihlerde en fazla sipariş verilmiş?
--İndirim uygulanan siparişlerin yüzdesi nedir?
--Çalışanlar hangi mağazada çalışıyorlar?
--Hangi mağazada kaç sipariş verilmiş?
--Her mağazanın toplam cirosu nedir?
--En çok sipariş veren müşteriler hangisi?
--Her müşterinin en yüksek ciroya sahip siparişi? 
--En çok satılan kategori/marka hangisi?
--Hangi ürünlerin stokları kritik seviyede?
--Belirli bir yıl üretilen ürünlerden kaç adet satılmış?
--Hangi markanın en yüksek fiyatlı ürünü var?
--Siparişlerin zaman içindeki artışı?
--Satışların yüzdelik dilimi (dörde ayıralım) ?
------

--Hangi müşteriler sipariş vermiş/vermemiş?
SELECT 
	c.first_name,
	c.last_name,
	count(o.order_id)
FROM customers c
INNER JOIN orders o on c.customer_id = o.customer_id
GROUP BY 1,2
ORDER BY 3 DESC;
--
SELECT 
	c.first_name,
	c.last_name
FROM customers c
LEFT JOIN orders o on c.customer_id = o.customer_id
WHERE order_id IS NULL;

--Bir müşterinin toplam sipariş sayısı ve toplam harcaması ne kadar?
SELECT 
	first_name,
	last_name,
	count(DISTINCT(o.order_id)), --çoklama oldu
	SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_spent
FROM customers c
INNER JOIN orders o on c.customer_id = o.customer_id
INNER JOIN order_items oi on oi.order_id = o.order_id
GROUP BY 1,2
ORDER BY 4 DESC;

--Belirli şehirlerde/eyaletlerde kaç müşteri var?
SELECT 
	state,
	city,
	count(customer_id)
FROM customers
GROUP BY 1,2
ORDER BY 3 DESC;

--En çok satılan ürünler neler? 
SELECT 
	oi.product_id,
	product_name,
	sum(quantity) as total_sales
FROM order_items oi 
INNER JOIN products p on oi.product_id = p.product_id
GROUP BY 1,2
ORDER BY 3 DESC
LIMIT 10;

--En çok ciroyu hangi sipariş oluşturmuş?
WITH order_totals AS (
    SELECT
        oi.order_id,
        SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_sales
    FROM order_items oi
    GROUP BY oi.order_id
)
SELECT
    order_id,
    total_sales,
    RANK() OVER (ORDER BY total_sales DESC) AS rank
FROM order_totals
ORDER BY rank;

--Hangi tarihlerde en fazla sipariş verilmiş?
WITH daily_orders AS (
    SELECT
        order_date,
        COUNT(order_id) AS total_orders
    FROM orders
    GROUP BY order_date
)
SELECT
    order_date,
    total_orders,
    RANK() OVER (ORDER BY total_orders DESC) AS rank
FROM daily_orders
ORDER BY rank;

--İndirim uygulanan siparişlerin yüzdesi nedir?
SELECT
    ROUND(100.0 * 
        COUNT(DISTINCT CASE WHEN discount > 0 THEN order_id END) 
        / COUNT(DISTINCT order_id)
    ) AS discount_order_percentage
FROM order_items; --yani hepsinde indirim uygulanmış

--Çalışanlar hangi mağazada çalışıyorlar?
SELECT 
	first_name,
	last_name,
	store_name
FROM staffs
INNER JOIN stores on staffs.store_id = stores.store_id
ORDER BY 1;

--Hangi mağazada kaç sipariş verilmiş?
SELECT 
	orders.store_id,
	store_name,
	count(order_id) AS order_count 
FROM orders
JOIN stores on stores.store_id = orders.store_id 
GROUP BY 1,2
ORDER BY 3 DESC;

--Her mağazanın toplam cirosu nedir?
--cte kullanarak
WITH order_revenue AS (
    -- Her siparişin toplam tutarını hesapla
    SELECT 
        o.order_id,
        o.store_id,
        SUM(oi.quantity * oi.list_price * (1-discount)) AS order_total --sipariş bazında
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY 1,2
)
SELECT 
    st.store_id,
    st.store_name,
    SUM(orv.order_total) AS total_revenue --mağaza bazında
FROM order_revenue orv
JOIN stores st ON orv.store_id = st.store_id
GROUP BY 1,2
ORDER BY 3 DESC;
--kullanmadan
SELECT
	o.store_id,
	store_name,
	SUM(quantity * list_price * (1-discount)) as order_total
FROM orders o 
JOIN order_items oi on oi.order_id = o.order_id
JOIN stores s on s.store_id = o.store_id
GROUP BY 1,2
ORDER BY 3 DESC;

--En çok sipariş veren müşterileri sırala
WITH customer_orders AS (
    -- Her müşterinin toplam sipariş sayısını hesapla
    SELECT
        o.customer_id,
        c.first_name,
        c.last_name,
        COUNT(o.order_id) AS total_orders
    FROM orders o
    JOIN customers c ON c.customer_id = o.customer_id
    GROUP BY o.customer_id, c.first_name, c.last_name
),
ranked_customers AS (
    -- Toplam sipariş sayısına göre rank ver
    SELECT
        *,
        RANK() OVER (ORDER BY total_orders DESC) AS rank
    FROM customer_orders
)
-- En çok sipariş veren(ler)
SELECT *
FROM ranked_customers
WHERE rank = 1
ORDER BY total_orders DESC;

--Her müşterinin en yüksek ciroya sahip siparişi? 
WITH customer_order_totals AS ( --müşteri toplam satış
	SELECT
		o.customer_id,
		c.first_name,
		c.last_name,
		o.order_id,
		SUM(quantity * list_price * (1-discount)) AS order_total
	FROM orders o
	INNER JOIN order_items oi on oi.order_id = o.order_id
	INNER JOIN customers c on c.customer_id = o.customer_id
	GROUP BY 1,2,3,4
),

ranked_orders AS ( --satışları sıraladık
	SELECT 
		*,
		RANK() OVER (PARTITION BY customer_id ORDER BY order_total DESC) AS rank
	FROM customer_order_totals
)

SELECT --arasından en yüksek siparişi sectik 
	customer_id,
	first_name,
	last_name,
	order_id,
	order_total
FROM ranked_orders
WHERE rank = 1
ORDER BY 5 DESC;

--En çok satılan kategori hangisi?
SELECT
	c.category_name,
	SUM(quantity) as quantity_total
FROM order_items oi
INNER JOIN products p on p.product_id = oi.product_id
INNER JOIN categories c on c.category_id = p.category_id
GROUP BY 1
ORDER BY 2 DESC;
--En çok satılan marka hangisi?
SELECT 
	product_name, 
	SUM(quantity) as quantity_total 
FROM order_items oi 
INNER JOIN products p on p.product_id = oi.product_id 
GROUP BY 1 
ORDER BY 2 DESC;

--Hangi ürünlerin stokları kritik seviyede?
WITH prdcts AS(
	SELECT 
		product_name,
		sum(s.quantity) as total_quantity
	FROM products p 
	LEFT JOIN stocks s on s.product_id = p.product_id
	GROUP BY 1
)
SELECT 
	*
FROM prdcts
WHERE total_quantity <= 10
ORDER BY 1;
--having kullanımı
SELECT 
    product_name,
    SUM(quantity) AS total_quantity
FROM stocks s
LEFT JOIN products p ON s.product_id = p.product_id
GROUP BY product_name
HAVING SUM(quantity) <= 10
ORDER BY total_quantity;

--Belirli bir yıl üretilen ürünlerden kaç adet satılmış?
SELECT 
	model_year,
	SUM(quantity)
FROM order_items oi 
LEFT JOIN products p on p.product_id = oi.product_id
GROUP BY 1
ORDER BY 2 DESC;

--Hangi markanın en yüksek fiyatlı ürünü var?
SELECT 
	brand_name,
	max(list_price)
FROM products p 
INNER JOIN brands b on b.brand_id = p.brand_id
GROUP BY 1
ORDER BY 2 DESC;

--Müşterilerin siparişleri arasında sıralama
SELECT
	customer_id,
	order_date,
	ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date)
FROM orders;

--Siparişlerin zaman içindeki artışı
SELECT
	customer_id,
	order_id,
	order_date,
	LAG(order_date) OVER (PARTITION BY customer_id ORDER BY order_date) AS previous_order_date,
	(order_date::date - LAG(order_date::date) OVER (PARTITION BY customer_id ORDER BY order_date)) AS days_since_last_order
FROM orders
ORDER BY 1,3;

--Marka bazında satış sıralaması
WITH product_sales AS (
    SELECT
        p.product_name,
        SUM(oi.quantity) AS quantity_total
    FROM order_items oi
    INNER JOIN products p ON p.product_id = oi.product_id
    GROUP BY p.product_name
)
SELECT
    product_name,
    quantity_total,
    RANK() OVER (ORDER BY quantity_total DESC) AS rank_in_product
FROM product_sales;

--Kategori bazında satış sıralaması
WITH category_sales AS (
    SELECT
        c.category_name,
        SUM(oi.quantity) AS quantity_total
    FROM order_items oi
    INNER JOIN products p ON p.product_id = oi.product_id
    INNER JOIN categories c ON c.category_id = p.category_id
    GROUP BY c.category_name
)
SELECT
    category_name,
    quantity_total,
    RANK() OVER (ORDER BY quantity_total DESC) AS rank
FROM category_sales
ORDER BY rank;

--Satışların yüzdelik dilimi (dörde ayıralım)
WITH customers_sales AS (
SELECT 
	c.customer_id,
	c.first_name || ' ' || c.last_name as customer_name,
	sum(quantity * list_price * (1 - discount)) as total_sales
FROM order_items oi 
LEFT JOIN orders o on o.order_id = oi.order_id
LEFT JOIN customers c on c.customer_id = o.customer_id
GROUP BY 1,2
)
SELECT 
	customer_id,
	customer_name,
	NTILE(4) OVER (ORDER BY total_sales DESC) as sales_quartile
FROM customers_sales;