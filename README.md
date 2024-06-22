# Weather Forecast App

This is a Flutter application that displays the weather forecast for a given location. Users can search for weather data by city, postal code, or both. The app fetches weather data from the Weatherbit API and displays it in a user-friendly interface.

## Features

- Search weather by city, postal code, or both.
- Display current weather conditions, temperature, and other relevant information.
- User-friendly interface with loading and error handling.
- Proper state management using Provider.

## Screenshots

<img src="https://github.com/mimi-tech/pokemon_app/assets/62711340/ccdacce9-7e45-4065-9e2c-2caf6996f174"/>

## Getting Started

### Prerequisites

- Flutter SDK: You can download it from [flutter.dev](https://flutter.dev/docs/get-started/install)
- A code editor: VS Code, Android Studio, or IntelliJ IDEA
- A Weatherbit API key: Sign up at [Weatherbit](https://www.weatherbit.io/) to get your free API key.

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/weather_forecast_app.git
   cd weather_forecast_app
   flutter pub get
   flutter packages pub run build_runner build --delete-conflicting-outputs
   flutter run

## Usage
1. Open the app.
2. Enter a city name and/or postal code.
3. Tap the "Get Weather" button.
4. View the weather information.

## Running Tests
Ensure you have the Flutter SDK installed.

Navigate to the project directory: 
   ```bash
   flutter test

