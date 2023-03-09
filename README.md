# ![Nota][nota_icon_asset] Nota - Notes App

## [🌍 Nota Website][nota_website]

This Flutter project is a simple notes app optimized for mobile and web platforms.

It uses Firebase Firestore to store notes, providing users with fast and reliable access to their collections. Users can easily create, edit, and delete notes, as well as search for and organize them into categories.

This app is a great example of modern cross-platform development in action. It was built using Domain-Driven Design (DDD) and Clean Architecture, which allows for maintainable and scalable code.

The notes UI/UX is inspired by Google Keep, providing users with a familiar and intuitive interface. Overall, this project showcases the power and potential of cross-platform development with Flutter and Firebase Firestore.

---

## Core Dependencies 📦

| Package Name | Pub.dev                             | Documentation                     | Description                               |
| ------------ | ----------------------------------- | --------------------------------- | ----------------------------------------- |
| Firebase     | [firebase_core][firebase_pubdev]    | [Flutter Firebase][firebase_docs] | Flutter Firebase Integration              |
| Flutter Bloc | [flutter_bloc][bloc_library_pubdev] | [Bloc Library][bloc_library_docs] | BloC State Management                     |
| GoRouter     | [go_router][go_router_pubdev]       | [Go Router Docs][go_router_docs]  | Router Package Maintained by Flutter Team |

---

## Getting Started 🚀

Project Generated by the [Very Good CLI][very_good_cli_link] 🤖

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```
---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---

## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/presentation/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:test/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>es</string>
	</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_es.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

`app_es.arb`

```arb
{
    "@@locale": "es",
    "counterAppBarTitle": "Contador",
    "@counterAppBarTitle": {
        "description": "Texto mostrado en la AppBar de la página del contador"
    }
}
```


<!-- Links -->

[nota_website]: https://nota.jarjut.dev/ "nota.jarjut.dev"
[nota_icon_asset]: assets/icons/nota-icon-32x32.png "Nota"

[go_router_pubdev]: https://pub.dev/packages/go_router
[go_router_docs]: https://pub.dev/documentation/go_router/latest/topics/Get%20started-topic.html

[bloc_library_pubdev]: https://pub.dev/packages/flutter_bloc
[bloc_library_docs]: https://bloclibrary.dev/#/gettingstarted

[firebase_pubdev]: https://pub.dev/packages/firebase_core
[firebase_docs]: https://firebase.google.com/docs/flutter/setup#available-plugins

[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization

[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli