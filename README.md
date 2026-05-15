# 🌸 Flower Store E-Commerce App

A beautiful and feature-rich Flutter e-commerce application for selling flowers and plants online. This app combines elegant UI design with robust backend integration to deliver a seamless shopping experience.

<p align="center">
  <a href="https://flutter.dev" target="_blank">
    <img src="https://img.shields.io/badge/Flutter-3.10+-02569B?style=flat&logo=flutter" alt="Flutter">
  </a>
  <a href="https://dart.dev" target="_blank">
    <img src="https://img.shields.io/badge/Dart-3.10+-0175C2?style=flat&logo=dart" alt="Dart">
  </a>
  <img src="https://img.shields.io/badge/License-MIT-green?style=flat" alt="License">
  <img src="https://img.shields.io/badge/State%20Management-BLoC-yellow?style=flat" alt="BLoC">
</p>

---

## 📱 Screenshots

### Home & Product Browsing
<table>
  <tr>
    <td align="center" width="33%">
      <h4>Home Screen</h4>
      <img src="./docs/screenshots/home_screen.png" alt="Home Screen" width="200">
    </td>
    <td align="center" width="33%">
      <h4>Product Details</h4>
      <img src="./docs/screenshots/product_details.png" alt="Product Details" width="200">
    </td>
    <td align="center" width="33%">
      <h4>Product Catalog</h4>
      <img src="./docs/screenshots/catalog.png" alt="Catalog" width="200">
    </td>
  </tr>
</table>

### Shopping & Checkout
<table>
  <tr>
    <td align="center" width="33%">
      <h4>Shopping Cart</h4>
      <img src="./docs/screenshots/cart.png" alt="Shopping Cart" width="200">
    </td>
    <td align="center" width="33%">
      <h4>Checkout</h4>
      <img src="./docs/screenshots/checkout.png" alt="Checkout" width="200">
    </td>
    <td align="center" width="33%">
      <h4>Order Confirmation</h4>
      <img src="./docs/screenshots/order_confirmation.png" alt="Order Confirmation" width="200">
    </td>
  </tr>
</table>

### User Features
<table>
  <tr>
    <td align="center" width="33%">
      <h4>User Profile</h4>
      <img src="./docs/screenshots/profile.png" alt="User Profile" width="200">
    </td>
    <td align="center" width="33%">
      <h4>Order History</h4>
      <img src="./docs/screenshots/order_history.png" alt="Order History" width="200">
    </td>
    <td align="center" width="33%">
      <h4>Payment Methods</h4>
      <img src="./docs/screenshots/payment_methods.png" alt="Payment Methods" width="200">
    </td>
  </tr>
</table>

---

## ✨ Features

- 🌺 **Beautiful UI/UX** - Modern and intuitive interface with smooth animations
- 🛍️ **Product Catalog** - Browse and search flowers with detailed information
- 🛒 **Shopping Cart** - Add, remove, and manage products with ease
- 💳 **Secure Payments** - Integrated payment gateway with Firebase
- 👤 **User Authentication** - Secure login and registration
- 📍 **Location Services** - Geocoding and map integration for delivery
- 🌍 **Multi-language Support** - Internationalization support (i18n)
- 📸 **Image Management** - Image picker for profile and product reviews
- 🔒 **Secure Storage** - Encrypted storage for sensitive data
- 📊 **State Management** - Clean BLoC pattern for state management
- ♿ **Responsive Design** - Works seamlessly on all screen sizes

---

## 🏗️ Architecture

This project follows **Clean Architecture** principles with BLoC pattern:

```
lib/
├── presentation/       # UI Layer (Screens, Widgets, BLoCs)
│   ├── screens/
│   ├── widgets/
│   └── bloc/
├── domain/            # Business Logic Layer (Entities, Repositories)
│   ├── entities/
│   ├── repositories/
│   └── usecases/
├── data/              # Data Layer (Models, Data Sources)
│   ├── datasources/
│   ├── models/
│   └── repositories/
└── core/              # Core utilities and constants
    ├── utils/
    ├── constants/
    └── di/            # Dependency Injection
```

---

## 🛠️ Tech Stack

### Core Framework
- **Flutter** - Cross-platform mobile development framework
- **Dart** - Programming language

### State Management
- **BLoC** `^9.1.0` - Business Logic Component pattern
- **Flutter BLoC** `^9.1.1` - Flutter integration
- **Equatable** `^2.0.7` - Value equality

### API & Networking
- **Retrofit** `^4.9.2` - Type-safe HTTP client
- **Dio** `^5.9.0` - HTTP client with interceptors
- **Pretty Dio Logger** `^1.4.0` - Request/response logging

### Data Serialization
- **JSON Annotation** `^4.9.0` - JSON serialization annotations
- **JSON Serializable** `^6.10.0` - Code generation for JSON
- **Dart Mappable** `^4.2.0` - Alternative serialization

### Dependency Injection
- **Injectable** `^2.7.1+4` - DI setup
- **Get It** `^9.2.0` - Service locator

### UI & Styling
- **Flutter ScreenUtil** `^5.9.3` - Responsive UI scaling
- **Google Fonts** `^6.3.3` - Beautiful fonts
- **Flutter SVG** `^2.2.3` - SVG support
- **Flutter Animate** `^4.5.2` - Animation library
- **Pin Code Fields** `^8.0.1` - OTP input widget

### Forms & Validation
- **Flutter Form Builder** `^10.2.0` - Advanced form handling

### Media & Location
- **Image Picker** `^1.2.1` - Image selection
- **Flutter Map** `^8.2.2` - Map display
- **Latlong2** `^0.9.1` - Location coordinates
- **Geocoding** `^4.0.0` - Address to coordinates conversion
- **WebView Flutter** `^4.13.1` - Web content display

### Storage & Security
- **Firebase Core** `^4.4.0` - Firebase integration
- **Shared Preferences** `^2.5.4` - Key-value storage
- **Flutter Secure Storage** `^9.2.4` - Secure credential storage

### Utilities
- **URL Launcher** `^6.3.2` - Open URLs
- **Intl** - Internationalization
- **Provider** `^6.1.5+1` - State management (additional)
- **Logger** `^2.6.0` - Logging utility
- **Cupertino Icons** `^1.0.8` - iOS-style icons

### Development
- **Build Runner** `^2.4.7` - Code generation
- **Retrofit Generator** `^10.2.1` - API client generation
- **Injectable Generator** `^2.9.1` - DI code generation
- **Dart Mappable Builder** `^4.2.0` - Mapping code generation
- **Mockito** `^5.6.1` - Mocking for tests
- **BLoC Test** `^10.0.0` - BLoC testing utilities

---

## 📋 Prerequisites

Before you begin, ensure you have installed:

- **Flutter SDK** - [Download here](https://flutter.dev/docs/get-started/install)
- **Dart SDK** - Usually comes with Flutter
- **Android Studio** or **Xcode** (for iOS development)
- **Git** - Version control
- **An IDE** - VS Code, Android Studio, or IntelliJ IDEA

### Minimum Versions
- Flutter: 3.10+
- Dart: 3.10.4+
- Android: API 21+
- iOS: 11.0+

---

## ⚙️ Installation & Setup

### 1. Clone the Repository

```bash
git clone https://github.com/sayedalfeki/e_commerce_app_copy.git
cd e_commerce_app_copy
git checkout develop
```

### 2. Get Flutter Dependencies

```bash
flutter pub get
```

### 3. Generate Code Files

The project uses code generation for serialization and DI:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Or for incremental builds:

```bash
flutter pub run build_runner watch
```

### 4. Generate App Icons and Splash Screen

```bash
flutter pub run flutter_launcher_icons
flutter pub run flutter_native_splash:create
```

### 5. Environment Configuration

Create a `.env` file in the root directory (if needed for API keys):

```env
API_BASE_URL=your_api_url
FIREBASE_API_KEY=your_firebase_key
```

---

## 🚀 Building & Running

### Run Development Build

```bash
# Debug mode
flutter run

# Run on specific device
flutter run -d <device_id>
```

### Build for Release

```bash
# Android APK
flutter build apk --release

# Android App Bundle (for Play Store)
flutter build appbundle --release

# iOS
flutter build ios --release
```

---

## 📂 Project Structure Overview

```
lib/
├── main.dart                    # Entry point
├── core/
│   ├── di/
│   │   └── injection.dart       # Dependency injection setup
│   ├── utils/
│   │   ├── constants.dart
│   │   └── extensions.dart
│   └── theme/
│       └── app_theme.dart       # App theming
├── data/
│   ├── datasources/
│   │   ├── local/
│   │   └── remote/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
├── presentation/
│   ├── bloc/
│   ├── screens/
│   ├── widgets/
│   └── pages/
└── l10n/                        # Localization files
    ├── app_en.arb
    └── app_ar.arb
```

---

## 🏛️ Architecture Layers Explained

### Presentation Layer
- Contains UI components (Screens, Widgets)
- Manages state using BLoC pattern
- Handles user interactions and navigation

### Domain Layer
- Defines business rules and entities
- Abstract repository interfaces
- Use cases for business logic

### Data Layer
- Implements repository interfaces
- Contains API clients (Retrofit) and local storage
- Models for data transformation

### Core Layer
- Dependency injection configuration
- Constants and utilities
- Theme and styling setup

---

## 🔄 State Management with BLoC

The app uses **BLoC (Business Logic Component)** pattern:

```dart
// Example BLoC structure
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUseCase getProductsUseCase;
  
  ProductBloc(this.getProductsUseCase) : super(ProductInitial()) {
    on<GetProductsEvent>(_onGetProducts);
  }
  
  Future<void> _onGetProducts(
    GetProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());
    final result = await getProductsUseCase.call();
    result.fold(
      (failure) => emit(ProductError(failure.message)),
      (products) => emit(ProductLoaded(products)),
    );
  }
}
```

---

## 🔐 Configuration & Security

### Firebase Setup
1. Create a Firebase project at [console.firebase.google.com](https://console.firebase.google.com)
2. Add Android and iOS apps
3. Download and add configuration files:
   - `google-services.json` for Android
   - `GoogleService-Info.plist` for iOS

### API Configuration
Update the base URL in your data sources:

```dart
const String apiBaseUrl = 'https://your-api.com/api';
```

### Secure Storage
Sensitive data is stored securely using `flutter_secure_storage`:

```dart
final secureStorage = FlutterSecureStorage();
await secureStorage.write(key: 'token', value: accessToken);
```

---

## 🧪 Testing

### Run Tests

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage
```

### Test Structure

```
test/
├── unit/
│   ├── bloc/
│   └── usecase/
└── integration/
    └── screens/
```

Example test:

```dart
void main() {
  group('ProductBloc', () {
    late ProductBloc productBloc;
    late MockGetProductsUseCase mockGetProductsUseCase;

    setUp(() {
      mockGetProductsUseCase = MockGetProductsUseCase();
      productBloc = ProductBloc(mockGetProductsUseCase);
    });

    test('emits [ProductLoading, ProductLoaded] when successful', () async {
      // Test implementation
    });
  });
}
```

---

## 📱 Supported Platforms

- ✅ Android (API 21+)
- ✅ iOS (11.0+)
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

---

## 🌍 Localization

The app supports multiple languages through `intl` package:

### Adding New Language

1. Edit `l10n.yaml`:
```yaml
arb-dir: lib/l10n
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
supported-locales:
  - en
  - ar
  - es
```

2. Create translation files:
   - `lib/l10n/app_en.arb`
   - `lib/l10n/app_ar.arb`

3. Run code generation:
```bash
flutter gen-l10n
```

---

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Coding Guidelines
- Follow Dart style guide
- Use meaningful variable/function names
- Add comments for complex logic
- Write tests for new features
- Keep methods small and focused

---

## 📝 Pre-commit Hooks

This project includes pre-commit hooks for code quality:

```bash
# Setup pre-commit hooks
chmod +x pre-commit
git config core.hooksPath pre-commit
```

---

## 🐛 Troubleshooting

### Build Issues

**Problem**: `Gradle build failed`
```bash
# Clean build
flutter clean
flutter pub get
flutter run
```

**Problem**: `CocoaPods error on iOS`
```bash
cd ios
rm -rf Pods
rm Podfile.lock
pod install --repo-update
cd ..
```

### Code Generation Issues

**Problem**: Generated files not found
```bash
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 📚 Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Language Guide](https://dart.dev/guides)
- [BLoC Library Documentation](https://bloclibrary.dev/)
- [Firebase Documentation](https://firebase.flutter.dev/)
- [Clean Architecture Guide](https://resocoder.com/flutter-clean-architecture)

---

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

## 👨‍💻 Author

**Sayed Al Feki**
- GitHub: [@sayedalfeki](https://github.com/sayedalfeki)
- Email: selfeki207@gmail.com 

---

## 🙏 Acknowledgments

- Thanks to all contributors
- Original project: [flowery_store_app](https://github.com/IslamRamzy444/flowery_store_app)
- Flutter team for the amazing framework
- All package maintainers

---

## 📞 Support

For support, email selfeki207@gmail.com or open an issue on GitHub.

---

<p align="center">
  Made with ❤️ by Sayed Al Feki
</p>
