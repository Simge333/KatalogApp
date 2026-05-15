# 📱 KatalogApp

Bir Flutter ürün kataloğu uygulaması. Uzak bir API'den ürünleri listeler, detaylarını gösterir ve sepete ekleme imkânı sunar.

---

## ✨ Özellikler

- Ürünleri grid görünümünde listeleme
- Ürün detay sayfası (açıklama, fiyat, görsel)
- Sepete ürün ekleme ve çıkarma
- Boş sepet durumu için özel ekran
- Banner görseli ile zenginleştirilmiş ana ekran

---

## 🗂️ Proje Yapısı

```
lib/
├── main.dart
├── models/
│   └── product_model.dart       # Veri modelleri
├── services/
│   └── api_service.dart         # HTTP istekleri
├── components/
│   └── product_card.dart        # Ürün kartı bileşeni
└── views/
    ├── home_screen.dart          # Ana ekran
    ├── product_detail_screen.dart # Ürün detay ekranı
    └── cart_screen.dart          # Sepet ekranı
```

---

## 🚀 Kurulum ve Çalıştırma

### Gereksinimler

- [Flutter SDK](https://docs.flutter.dev/get-started/install) — **3.29.1** veya üzeri
- Dart SDK (Flutter ile birlikte gelir)
- Android Studio / Xcode (emülatör için) veya fiziksel cihaz
- İnternet bağlantısı (API ve görseller için)

### Kullanılan Flutter Sürümü

```
Flutter 3.29.1
```

### Adımlar

**1. Repoyu klonlayın**

```bash
git clone https://github.com/kullanici-adi/katalogapp.git
cd katalogapp
```

**2. Bağımlılıkları yükleyin**

```bash
flutter pub get
```

**3. Uygulamayı çalıştırın**

```bash
flutter run
```

Birden fazla cihaz/emülatör bağlıysa hedef seçmek için:

```bash
flutter run -d <device-id>
```

Bağlı cihazları listelemek için:

```bash
flutter devices
```

---

## 📦 Kullanılan Bağımlılıklar

| Paket | Açıklama |
|-------|----------|
| `http` | REST API istekleri için |

`pubspec.yaml` içinde:

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.2.0
```

---

## 🌐 API

Uygulama, ürün verilerini aşağıdaki uç noktadan çeker:

```
GET https://wantapi.com/products.php
```

Her ürün şu alanları içerir: `id`, `name`, `tagline`, `description`, `price`, `currency`, `image`, `specs`

---

## 📸 Ekranlar

| Ekran | Açıklama |
|-------|----------|
| **Home** | Tüm ürünleri 2 sütunlu grid'de listeler |
| **Ürün Detayı** | Ürünün görseli, açıklaması, fiyatı ve sepete ekle butonu |
| **Sepet** | Sepetteki ürünleri listeler, ürün kaldırma ve checkout butonu |

---

## 📸 Ekran Görüntüsü
<p>
  <img src="<img width="391" height="845" alt="image" src="https://github.com/user-attachments/assets/40b30b57-6246-4885-8877-19f1c6ea99bf" />
" width="200"/>
  <img src="<img width="306" height="637" alt="image" src="https://github.com/user-attachments/assets/dad88b13-a357-4c93-a351-374f48541cf1" />
" width="200"/>
  <img src="<img width="405" height="848" alt="image" src="https://github.com/user-attachments/assets/3d7af852-99d8-4b5a-b853-101f7b620073" />
" width="200"/>
  <img src="<img width="403" height="842" alt="image" src="https://github.com/user-attachments/assets/21bc2f37-2cf8-47ff-8aa5-0427ae2f385e" />
" width="200"/>
</p>
