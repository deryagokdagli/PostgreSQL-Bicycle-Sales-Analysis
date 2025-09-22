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
