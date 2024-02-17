# Smartpay

## Project strcture

The project follows the MVVM (Model-View-ViewModel) architecture pattern

- `lib`
  - `assets`: Contains various assets used in the application such as fonts, images, and SVG files.

  - `core`: Holds the core functionalities and constants of the application.
    - `constants`: Includes constants such as device specifications (`device.dart`) and API endpoints (`endpoints.dart`).
    - `dependency_injection`: Manages dependency injection for the application.
    - `extensions`: Contains extension methods for Dart classes.

  - `models`: Consists of data models used throughout the application.

  - `navigation`: Manages the navigation routes of the application.
    - `routes.dart`: Defines the various routes used for navigation.

  - `presentation`: Contains the presentation layer of the application.
    - `animation`: Includes animation-related files.
    - `screens`: Organizes screens into feature modules. Each module contains the views and view models for a specific feature.
        - `views`: Holds the UI components for the feature.
        - `view_models`: Manages the logic and state for the corresponding views.
    - `widgets`: Houses reusable widgets used across the application.
      - `forms`: Includes form-related widgets.
      - `inputs`: Contains custom input widgets.
      - `screens`: Reusable components for similar screens.
      - `other_widgets`: Other custom widgets used in the project.

  - `services`: Handles communication with external sources, such as APIs.

  - `themes`: Manages the styling of the application.
    - `theme.dart`: Defines the overall theme of the app.
    - `colors.dart`: Centralizes color definitions.
    - `spacing.dart`: Contains spacing-related constants.

  - `utils`: Holds utility files providing helper functions.
    - `dio_helper.dart`: Manages API requests and handles errors by displaying a dialog box.
    - `formatter.dart`: Provides formatting functions.
    - `validator.dart`: Contains various validation functions for form fields.

- `test`: Contains unit tests for the Dart code.

## Features

### Responsive Design

The application is designed to provide a seamless user experience across various screen sizes and orientations. The responsive design ensures that the app adapts gracefully to different devices, as well as landscape and portrait orientations.

### Error Handling

Robust error handling mechanisms are implemented throughout the application. The `dio_helper.dart` file efficiently manages API requests and displays user-friendly error dialogs when issues occur. This ensures that users receive clear feedback in case of network errors or other unexpected issues, enhancing the overall reliability of the application.

### Minimalistic Animations

Minimalistic animations are incorporated to enhance the user interface and provide subtle visual feedback. The `animation` folder contains reusable animations for UI elements, contributing to a polished and engaging user experience.

## Dependencies Used

- `mocktail`: Mocking library for Dart/Flutter.
- `flutter_svg`: SVG rendering library for Flutter.
- `flutter_bloc`: State management library for Flutter applications.
- `dio`: HTTP client for Dart, providing features like interceptors, FormData, and more.
- `device_info_plus`: Flutter plugin to retrieve information about the device.
- `get_it`: Simple service locator for Dart and Flutter projects.
- `pinput`: Customizable PIN input field widget for Flutter.

## Online Emulation with Appetize.io

You can test the app online using [appetize.io](https://appetize.io/). Click the following link to access the online emulator:

[Open Appetize.io Emulator](https://)

## Download APK

To manually install the app on an Android device or emulator, you can download the APK file [here](https://)

