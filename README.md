# Send Money Page - Flutter (Week 7 Assignment)

This Flutter project implements a complete Send Money interface based on the requirements for Week 7. The application demonstrates input handling, form validation, reusable components, and basic animations using Flutter's widget system.

## Project Structure

lib/
 ├── main.dart
 ├── send_money_page.dart
 └── reusable_button.dart

- main.dart: Application entry point. Loads the Send Money page.
- send_money_page.dart: Contains the main form UI, validation, dropdown, switch, and animation.
- reusable_button.dart: Defines a reusable button widget that can be used throughout the app.

## Features Implemented

1. Input Widgets
   - Recipient name text field
   - Amount text field
   - Payment method dropdown menu
   - "Mark as favorite" switch

2. Form Validation
   - Checks for empty fields
   - Detects invalid numbers
   - Displays error messages under each field

3. Reusable Custom Button
   - Implemented as a separate widget
   - Accepts button text and action callback
   - Used inside the Send Money page

4. Animation
   - AnimatedOpacity widget is used to show a smooth success message after a valid form submission.

## How to Run the Project

1. Clone the repository:
   git clone <your-repo-url>

2. Navigate to the project directory:
   cd send_money_app

3. Run the application:
   flutter run

## Learning Outcomes

This project demonstrates the following:
- Building and validating forms in Flutter
- Managing widget state with StatefulWidget
- Creating reusable UI components
- Using Flutter animations such as AnimatedOpacity
- Organizing project files in a clean and maintainable structure

## Author

Developed as part of the Week 7 Flutter Assignment.
