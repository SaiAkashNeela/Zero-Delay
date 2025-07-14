# Zero Delay - iOS Authentication Flow

A SwiftUI implementation of a modern authentication flow for iOS 16+.

## Features

- Clean, modern UI design matching the provided mockup
- Login and Registration screens
- Email validation with regex
- Password validation (minimum 6 characters)
- Error handling with alerts
- Navigation between screens
- Authentication state management
- iOS 16+ features (NavigationStack)

## Project Structure

- **AuthViewModel.swift**: Handles authentication state and methods
- **Views/**
  - **ContentView.swift**: Main view that handles navigation between screens
  - **LoginView.swift**: Login screen with email input and social login options
  - **RegisterView.swift**: Registration screen with form validation
  - **HomeView.swift**: Simple home screen shown after successful authentication

## Requirements

- iOS 16.0+
- Xcode 14.0+
- Swift 5.7+

## Implementation Notes

- This is a UI prototype with stub authentication methods
- No actual backend integration yet
- Uses SwiftUI's NavigationStack for navigation (iOS 16+)
- Implements ObservableObject pattern for state management

## Next Steps

- Implement actual authentication with Firebase, Auth0, or a custom backend
- Add more robust form validation
- Implement password reset functionality
- Add biometric authentication options
- Implement proper error handling for network requests 