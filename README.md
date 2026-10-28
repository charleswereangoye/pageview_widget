# Flutter PageView Onboarding App

## Overview
This project is a beginner tutorial app made with Flutter.
It shows how to make an onboarding walkthrough screen.
Users can swipe left and right between pages like slides in a presentation.

## What is PageView
A PageView in Flutter is a widget that displays screens side by side.
Think of it like a photo album or a digital book.
You swipe across your screen to see the next page.

## What This App Does
- Shows three clean onboarding screens
- Lets you swipe horizontally between screens
- Lets you skip directly to the final screen
- Displays indicator dots at the bottom to show your current screen
- Provides a button that advances pages or finishes the walkthrough

## Main Concepts Used
- StatefulWidget: Keeps track of changing data such as the active page number
- PageController: Tells the PageView when to jump or slide to a different page
- PageView: The main widget that holds the sliding pages
- AnimatedContainer: Changes the dot shapes and colors smoothly
- ElevatedButton: Advances the page or shows a welcome message

## How The Code Works

### 1. The Pages
The app builds three introduction pages using the helper function.
Each page displays an icon inside a soft circle.
Each page also has a title and a short explanation text.

### 2. Swiping Pages
The PageView widget holds all three pages in a list.
When you swipe your finger the page change function updates the current page index.

### 3. Page Controller
The PageController gives you remote control over the swiper.
Pressing the Skip button calls jump to page and goes straight to the end.
Pressing the Next button calls next page with a smooth slide animation.

### 4. Page Indicator Dots
Three small dots sit near the bottom of the screen.
The active dot grows wider and turns purple.
The inactive dots stay small and grey.
This helps the user know where they are.

### 5. Next and Get Started Button
The button text changes automatically.
It says Next on the first two pages.
It switches to Get Started on the last page.
Tapping Get Started shows a popup message on your screen.

## Project Structure
- `lib/main.dart`: Contains all the code for this app
- `pubspec.yaml`: Contains configuration details and packages

## How to Run This Project

### Prerequisites
You need Flutter installed on your computer.
You also need an editor like VS Code or Android Studio.

### Steps
1. Open your terminal in this project folder.
2. Run this command to download packages:
```bash
flutter pub get
```
3. Connect your mobile device or start an emulator.
4. Run the app with this command:
```bash
flutter run
```
