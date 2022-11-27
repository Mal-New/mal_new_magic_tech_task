# malik_newman_tech_task

A basic application that can track a user's workouts.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
## Architecture

- Data: retrieve raw weather data from the API
- Repository: abstract the data layer and expose domain models for the application to consume
- Business Logic: manage the state of each feature (unit information, city details, themes, etc.)
- Presentation: display weather information and collect input from users (settings page, search page etc.)

## Third Party Packages

# Material 3
# Bloc
- Documentaion:
  - [Bloc State Management Library](https://bloclibrary.dev/#/gettingstarted?id=overview)
- Package(s) Name: 
  - flutter_bloc 
- Description:
  - Powerful Flutter Widgets built to work with bloc in order to build fast, reactive mobile applications.
- Reason for Implementation:
  - allows for over arching control of background data coming into the app at and better state management.

# DataStore with Amplify
Powerful Flutter Widgets built to work with bloc in order to build fast, reactive mobile applications.
- Documentaion:
  - [DataStore with Amplify](https://docs.amplify.aws/lib/datastore/getting-started/q/platform/flutter/#datastore-with-amplify)
- Package(s) Name:
    - amplify_flutter
    - amplify_datastore
- Prerequisites:
    - [Amplify CLI](https://docs.amplify.aws/cli/start/install/) version >=7.6.10
      - eu-west-2
      - api name:MagicFitFlutterTechTestMalikN
      - api key:MagicFitFlutterTechTestMalikNAPIKey
- Reason for Implementation:
    - Amplify DataStore provides a programming model for leveraging shared and distributed data without writing 
additional code for offline and online scenarios, which makes working with distributed, cross-user data just 
as simple as working with local-only data.

# Integration_test

- Package(s) Name:
  - integration_test
- Reason for Implementation:
  - allows for automated testing in 


# Test

- Package(s) Name:
  - test
- Reason for Implementation:
  - allows for 

# DataStore with Amplify
Powerful Flutter Widgets built to work with bloc in order to build fast, reactive mobile applications.
- Documentaion:
  - [DataStore with Amplify](https://docs.amplify.aws/lib/datastore/getting-started/q/platform/flutter/#datastore-with-amplify)
- Package(s) Name:
  - amplify_flutter
  - amplify_datastore
- Prerequisites:
  - [Amplify CLI](https://docs.amplify.aws/cli/start/install/) version >=7.6.10
    - eu-west-2
    - api name:MagicFitFlutterTechTestMalikN
    - api key:MagicFitFlutterTechTestMalikNAPIKey
- Reason for Implementation:
  - Amplify DataStore provides a programming model for leveraging shared and distributed data without writing
    additional code for offline and online scenarios, which makes working with distributed, cross-user data just
    as simple as working with local-only data.