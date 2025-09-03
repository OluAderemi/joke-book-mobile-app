````markdown
# joke_app

This is a mobile application that fetches and displays jokes from the Official Joke API, providing a seamless and engaging user experience across multiple screens. Users can select joke categories, view joke setups and punchlines, navigate between jokes via arrows or swipes, and return to the list or home screen easily.

## Features
- Front cover with navigation to category selection
- Category selection: `general`, `knock-knock`, `programming`
- Fetches jokes from the [Official Joke API](https://official-joke-api.appspot.com)
- Display joke setups and punchlines
- Side arrows and swipe gestures to navigate between jokes
- "Back to List" button below punchline and "Home" buttons for quick navigation
- Responsive and user-friendly UI

## Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/) with Flutter plugin
- Android/iOS device or emulator

### Installation

1. Clone the repository:
```bash
git clone https://github.com/OluAderemi/joke-book-mobile-app
cd joke_app
````

2. Fetch the Flutter dependencies:

```bash
flutter pub get
```

3. Run the app on an emulator or connected device:

```bash
flutter run
```

### Notes
- Ensure you have an active internet connection for fetching jokes from the API.
- Tested with **Flutter 3.32.7** and **Dart 3.8.1**.

## Folder Structure

* `lib/Models` – Joke model definition
* `lib/Screens` – Page1 (front cover), Page2 (categories & joke list), Page3 (joke detail & navigation)
* `lib/main.dart` – App entry point

## Usage

1. Launch the app → Front cover appears with "Start" button.
2. Click "Start" → Select a joke category (`general`, `knock-knock`, or `programming`).
3. View list of joke setups → Tap a setup to see the punchline.
4. Navigate between jokes using:

    * Left/Right arrows on the sides
    * Swipe gestures
5. Use "Back to List" to return to the category list or "Home" to return to the front cover.

