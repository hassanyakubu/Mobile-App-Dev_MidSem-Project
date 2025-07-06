# midsem_project

# MyBank Mobile App

This is a Flutter-based application made as a prototype of the bank app I use, Stanbic Bank App, developed as my mid-semester exam project. The app provides core banking features such as logging in, viewing account balances, transferring funds, paying bills, and checking transaction history.

## Features

1. Login Screen  
   A basic login screen where users enter their username and password to access the app.

2. Dashboard  
   Displays a summary of the user’s account with options to navigate to other features. The account balance is hidden by default and can be toggled on or off using an eye icon.

3. Transfer Funds  
   Users can transfer money to either a bank account or a mobile money wallet (MTN Mobile Money, Vodafone Cash, AirtelTigo Money). Input validation ensures that users enter valid information before submitting.

4. Bills Payment  
   A page that allows users to pay for services such as electricity, water, and TV. Includes form input with validation.

5. Accounts and Balances  
   Displays account balance information, including checking and savings accounts.

6. Transaction History  
   Shows a list of recent transactions with basic details such as amount and date.

## Technologies Used

1. Dart programming (variables, functions, classes, logic)
2. Flutter widgets (layouts, buttons, text, images, lists)
3. Named route navigation
4. Local state management using setState()
5. Form input and validation with TextFields and Dropdowns

## How to Run the App

1. Download the project folder
2. Open it in Visual Studio Code 
3. Make sure Flutter is properly installed and set up
4. Run the command: flutter run


## Key Challenges

- Making the UI clean and consistent across all screens
- Managing state when toggling account visibility and handling dynamic form content
- Validating multiple types of transfers (bank vs. mobile money)
- Using Flutter layout widgets effectively for responsive design

## What Was Learned

- How to structure a multi-screen Flutter app using named routes
- How to manage state locally with setState()
- How to build and validate user forms with different types of input
- How to create dynamic form behavior based on dropdown selections
- How to maintain readable and organized Dart code



