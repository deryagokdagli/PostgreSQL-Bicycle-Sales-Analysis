[TR]
# Bisiklet Satışları Analizi

---

### Açıklama

Bu proje, bir bisiklet satış verisi setini kullanarak işletme için önemli içgörüler elde etmeyi amaçlayan bir veri analizi çalışmasıdır. Proje, SQL sorguları aracılığıyla müşteri davranışları, satış performansı, ürün popülaritesi ve stok durumu gibi konularda detaylı analizler yapmaktadır. Kaggle'dan temin edilen veri seti kullanılarak, satış süreçlerinin optimizasyonu ve stratejik karar alma süreçlerine katkı sağlayacak çıktılar üretilmiştir.

---

### Kullanılan Araçlar

* **SQL:** Veri manipülasyonu ve analizi için ana dil olarak kullanılmıştır.
* **Kaggle:** Analiz için gerekli olan veri seti bu platformdan alınmıştır.

---

### Analiz Kapsamı ve Yanıtlanan Sorular

Proje kapsamında aşağıdaki sorulara yanıt aranmıştır:

* Hangi müşteriler sipariş vermiş, hangileri vermemiş?
* Bir müşterinin toplam sipariş sayısı ve toplam harcaması nedir?
* Belirli şehirlerde veya eyaletlerde kaç müşteri bulunuyor?
* En çok satılan ürünler hangileri?
* En yüksek ciroyu hangi sipariş oluşturmuş?
* En fazla siparişin verildiği tarihler hangileri?
* İndirim uygulanan siparişlerin yüzdesi nedir?
* Çalışanlar hangi mağazalarda çalışıyorlar?
* Hangi mağazada kaç sipariş verilmiş ve bu mağazaların toplam cirosu ne kadar?
* En çok sipariş veren müşteriler kimlerdir?
* Her müşterinin en yüksek ciroya sahip siparişi hangisidir?
* En çok satılan ürün kategorisi ve markası hangisi?
* Stokları kritik seviyede olan ürünler hangileridir?
* Belirli bir yılda üretilen ürünlerden kaç adet satılmıştır?
* En yüksek fiyatlı ürüne sahip marka hangisi?
* Siparişlerin zaman içindeki artışı nasıl bir eğilim gösteriyor?
* Satışların yüzdelik dilimlere göre (dörde ayırarak) dağılımı nasıldır?

---

### Analiz Sonuçları ve Çıkarımlar

Bu veri analizi, işletmenin satış performansına dair önemli içgörüler sunmaktadır. Analiz, müşteri tabanının büyük çoğunluğunun **New York eyaletinde** bulunduğunu ve bu durumun, pazarlama ve satış stratejilerinin bu bölgeye odaklanması gerektiğini ortaya koymaktadır. Sipariş davranışları incelendiğinde, müşterilerin en fazla 3 sipariş verdiği görülmüştür. İlginç bir şekilde, **tek bir siparişte en yüksek harcamayı yapan müşteriler** de bulunmaktadır ki bu, tek seferlik büyük alımların ne kadar değerli olduğunu göstermektedir. Mağaza performansına bakıldığında, yine New York'ta bulunan **Baldwin Bikes** mağazası en çok siparişin verildiği yer olarak öne çıkmıştır. Ürün bazlı analizler ise, en çok satılan kategorinin **Cruisers Bicycles** olduğunu ve özellikle **2016 model bisikletlerin** satışlarda baskın olduğunu göstermektedir. Bu bulgular, işletmenin New York eyaletine yönelik stratejiler geliştirmesi, Baldwin Bikes gibi başarılı mağazaları model alması ve popüler ürün kategorileri ile model yıllarına yatırım yapması için sağlam bir temel oluşturmaktadır.

---

### Proje Nasıl Çalıştırılır?

Bu projenin çıktısını görmek için, analizde kullanılan SQL sorgularını bir veritabanı yönetim sisteminde (örneğin, PostgreSQL, MySQL veya SQL Server) çalıştırabilirsiniz. Veri setinin ve şema yapısının doğru şekilde yüklenmiş olması gerekmektedir. Sorgular, analizin her bir adımını net bir şekilde göstererek sonuçları tablo formatında sunar.

---
[EN]
# Bicycle Sales Analysis

---

### Description

This project is a data analysis study that aims to gain important insights for a business using a bicycle sales dataset. The project performs detailed analyses on customer behavior, sales performance, product popularity, and stock status through SQL queries. By using the dataset obtained from Kaggle, outputs have been generated that will contribute to the optimization of sales processes and strategic decision-making.

---

### Tools Used

* **SQL:** Used as the primary language for data manipulation and analysis.
* **Kaggle:** The necessary dataset for the analysis was obtained from this platform.

---

### Scope of Analysis and Questions Answered

The following questions were answered within the scope of this project:

* Which customers have placed orders and which haven't?
* What is a customer's total number of orders and total spending?
* How many customers are in specific cities or states?
* What are the best-selling products?
* Which order generated the most revenue?
* On which dates were the most orders placed?
* What is the percentage of orders with a discount?
* In which stores do the employees work?
* How many orders were placed in each store, and what is the total revenue for each store?
* Which customers have placed the most orders?
* What is each customer's highest-revenue order?
* What is the best-selling product category and brand?
* Which products have critical stock levels?
* How many products produced in a specific year have been sold?
* Which brand has the highest-priced product?
* What is the increase in orders over time?
* What is the percentile of sales (dividing into four)?

---

### Analysis Results and Conclusions

This data analysis provides important insights into the business's sales performance. The analysis reveals that the majority of the customer base is located in **New York**, indicating that marketing and sales strategies should focus on this region. When examining order behavior, it was found that customers placed a maximum of 3 orders. Interestingly, there are customers who made the **highest single-order spending**, which shows how valuable one-time large purchases are. Looking at store performance, the **Baldwin Bikes** store, also in New York, stands out as the location where the most orders were placed. Product-based analysis shows that the best-selling category is **Cruisers Bicycles** and that **2016 model bicycles** were particularly dominant in sales. These findings provide a solid foundation for the business to develop strategies for New York, model successful stores like Baldwin Bikes, and invest in popular product categories and model years.

---

### How to Run the Project

To view the output of this project, you can run the SQL queries used in the analysis on a database management system (e.g., PostgreSQL, MySQL, or SQL Server). The dataset and schema must be loaded correctly. The queries will clearly show each step of the analysis and present the results in a table format.
