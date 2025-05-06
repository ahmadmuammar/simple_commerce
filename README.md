
# Simple Commerce App

A simple Flutter application that implement Fake Store API to show cart and product details

<img src="https://github.com/user-attachments/assets/691882af-2426-4550-9605-0444562b2dda" width="200" alt="Image 1">
<img src="https://github.com/user-attachments/assets/96fafbfc-b876-4de1-9e97-24f2abc27052" width="200" alt="Image 2">

## Features

- Login and logout feature
- List cart and its products
- View product details

## Requirements

- **Flutter version:** 3.24 or higher
- **Dart version:** 3.0.0 or higher
- **Development Tools:** Android Studio, Visual Studio Code, or any other preferred IDE
- **Platforms Supported:**
  - Android
  - iOS

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/ahmadmuammar/simple_commerce.git
cd simple_commerce
```

### 2. Install Flutter Dependencies

Run the following command in the project root directory to install the required dependencies:

```bash
flutter pub get
```

### 3. Run the Application

You can run the app on your connected device or emulator with:

```bash
flutter run
```

For a specific platform (iOS or Android), you can specify the platform:

```bash
# For Android
flutter run -d android

# For iOS
flutter run -d ios
```

### 4. Building the Application

You can build the app for release with the following commands:

- **For Android:**

```bash
flutter build apk
```

- **For iOS:**

```bash
flutter build ios
```

## Configuration

This app doesn't need to be configured further since it is only experimental app, and it doesn't need any environtment variable at all.

## Development Notes

- Ensure you have an active internet connection.
- The UI dynamically updates based on the fetched data.
- Use Flutter 3.24 for better compatibility and features.

## Troubleshooting

If you encounter issues while running the app, try the following:

- Make sure your Flutter environment is set up correctly. Run `flutter doctor` to check for potential issues.
- Ensure that you have the latest version of the app dependencies by running `flutter pub upgrade`.
