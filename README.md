# Flower App - E-Commerce Solution

A modern, feature-rich E-Commerce application built with Flutter. This project demonstrates best practices in Flutter development, including modular architecture, state management, and robust API integration.

## 🚀 Features

- **Product Discovery**: Browse products through a clean and intuitive interface.
- **Search & Filter**: Find exactly what you're looking for with advanced search and category sorting.
- **Product Details**: Detailed views with high-quality images, descriptions, and animations.
- **Profile Management**: Manage user profiles, including photo uploads and personal details.
- **Multi-language Support**: Fully localized in **English** and **Arabic** using Flutter's l10n.
- **Push Notifications**: Integrated with Firebase Cloud Messaging.
- **Maps & Geolocation**: Integrated maps for location-based services.
- **Responsive Design**: Optimized for different screen sizes using `flutter_screenutil`.

## 🛠 Tech Stack

- **Framework**: [Flutter](https://flutter.dev/)
- **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc) & [Cubit](https://pub.dev/packages/bloc)
- **Networking**: [Retrofit](https://pub.dev/packages/retrofit) & [Dio](https://pub.dev/packages/dio)
- **Dependency Injection**: [GetIt](https://pub.dev/packages/get_it) & [Injectable](https://pub.dev/packages/injectable)
- **Serialization**: [json_serializable](https://pub.dev/packages/json_serializable) & [dart_mappable](https://pub.dev/packages/dart_mappable)
- **Local Storage**: [Flutter Secure Storage](https://pub.dev/packages/flutter_secure_storage) & [Shared Preferences](https://pub.dev/packages/shared_preferences)
- **Animations**: [Flutter Animate](https://pub.dev/packages/flutter_animate)
- **Backend Services**: [Firebase](https://firebase.google.com/)

## 🏗 Project Structure

The project follows a feature-driven architecture:

```text
lib/
├── app/
│   ├── core/           # Common resources, endpoints, and utilities
│   └── feature/        # Feature-based modules (profile, search, categories, etc.)
│       └── [feature_name]/
│           ├── data/           # Repositories and API clients
│           ├── domain/         # Models and Entities
│           └── presentation/   # UI (Screens, Widgets) and ViewModels (Bloc/Cubit)
├── l10n/               # Localization files (ARB)
└── main.dart           # Entry point
```

## 🏁 Getting Started

### Prerequisites

- Flutter SDK (v3.10.4 or higher)
- Android Studio / VS Code
- Dart SDK

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   This project uses `build_runner` for generating API clients, models, and dependency injection code.
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## 📄 Assets

Assets are organized in the following directories:
- `assets/images/`
- `assets/icons/`
- `assets/svg/`
- `assets/jsonFiles/`
