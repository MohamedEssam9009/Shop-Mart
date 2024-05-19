# Shop Mart

Shop Mart is a Flutter-based mobile application for a shopping platform that allows users to browse products, add them to their favorites or cart, and purchase them using integrated payment methods. The app supports user authentication, social logins, product display via API, theme switching, and multilingual support.

## Features

1- User Authentication:

Login and register using username and password.
Login using Google and Facebook accounts.

2- Product Display:
Display products fetched from an API.

3-Favorites and Cart:
Add products to favorites.
Add products to the cart.

4-Purchase Products:
Buy products using integrated payment methods.

5-Theme Switching:
Change themes between dark and light modes.

6-Language Support:
Change the app's language.

## Packages Used
- badges: 
- carousel_slider: 
- cupertino_icons: 
- firebase_auth: 
- firebase_core: 
- flutter:
    sdk: flutter
- flutter_rating_bar: 
- geocoding: 
- geolocator: 
- get: 
- get_storage: 
- google_fonts: 
- google_sign_in: 
- http: 
- readmore: 
- smooth_page_indicator: 

## Screens
![Full Presentation Shop Mart](https://github.com/MohamedEssam9009/Shop-Mart/assets/77198018/400976b5-c4fc-4782-8ae7-489b0b772a53)


## Getting Started

To get started with this project, follow these steps:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/MohamedEssam9009/Shop-Mart
   ```

2. **Install dependencies:**
   ```bash
   cd Shop-Mart
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ``` 

##Firebase Setup

1- Set up a Firebase project here.
2- Add your Android and iOS app to the Firebase project.
3- Download the google-services.json file for Android and GoogleService-Info.plist for iOS.
4- Place the google-services.json file in the android/app directory.
5- Place the GoogleService-Info.plist file in the ios/Runner directory.
6- Follow the official Firebase setup guide for Flutter here.

## Project Structure

lib/: Contains the main source code of the app.
main.dart: The entry point of the application.
screens/: Contains the UI screens.
models/: Contains the data models.
services/: Contains the service classes for API calls, authentication, etc.
controllers/: Contains the controller classes for managing state and business logic.
widgets/: Contains reusable widgets.

## Contributing

Contributions are welcome! If you want to contribute to this project, feel free to open a pull request.
