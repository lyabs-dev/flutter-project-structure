# Flutter Project Structure — Copilot Instructions

This repository is the canonical starter template for all Flutter projects by Lyabs Dev. It is duplicated as the base for each new project. Every change must conform to the architecture and conventions described here.

---

## Architecture Overview

The codebase follows a strict three-layer clean architecture with a shared utilities layer:

```
lib/
├── data/         # Backend logic: providers, models, repositories
├── logic/        # Business logic: cubits, states, responses, blocs
├── presentation/ # UI: pages, widgets, dialogs, router, styles
└── utils/        # Shared helpers: constants, enums, methods, exports
```

State management uses `flutter_bloc` (Cubits). The data flow is:

**Provider → Repository → Cubit → State → UI**

---

## Layer Responsibilities

### `lib/data/`
- **`models/`** — Entity classes. Independent of providers. Must end with `Item` suffix. Field name constants must be defined in the same file, prefixed with `field` + model name + field name (e.g., `fieldMovieTitle`).
- **`providers/`** — Raw data access (APIs, SharedPreferences, local DB). Return generic types (`Map`, JSON). Files must end with `Provider` suffix.
- **`repositories/`** — Call provider methods and return model instances to the logic layer. Files must end with `Repository` suffix.
- **`providers/database/`** — All local database methods go here if the app uses an internal database.

### `lib/logic/`
- **`cubits/`** — All cubit classes. Must extend `DefaultCubit`. Always paired with a corresponding state. Files must end with `Cubit` suffix.
- **`states/`** — All state classes. Must extend `DefaultState`. Must implement `copy()`. Files must end with `State` suffix.
- **`responses/`** — Response classes for displaying UI messages (dialogs, toasts). Must extend `ResponseCodeItem`. Each file must contain both the class and its `ResponseCode` enum (enum suffix: `ResponseCode`). Files must end with `Response` suffix (e.g., `chat_response.dart` with `enum ChatResponseCode`).
- **`blocs/`** — Reserved for full BLoC classes (event-driven). Currently empty; use cubits by default.

### `lib/presentation/`
- **`pages/`** — One subfolder per page. Each page subfolder contains a main `page.dart` file and an optional `widgets/` subfolder for page-specific components when separation is needed.
- **`widgets/`** — Reusable widgets usable anywhere in the app.
- **`dialogs/`** — All dialog files. Must end with `Dialog` suffix (e.g., `AppDialog`, `BoxDialog`).
- **`router/app_router.dart`** — Centralized named navigation. Page route constants are defined in `constants.dart`.
- **`styles/styles.dart`** — App theme (light and dark).
- **`languages/`** — Localization files. See Localization section.

### `lib/utils/`
- **`constants.dart`** — All app constants: routes, setting keys, argument keys, spacing/text sizes, colors, supported languages. Settings constants use a `setting` prefix (e.g., `settingDarkMode`).
- **`enums.dart`** — All app-wide enumerations.
- **`methods.dart`** — Standalone helper functions not tied to any layer.
- **`my_material.dart`** — Barrel export file. Import this file instead of writing multiple individual imports.
- **`path_assets.dart`** — Asset path variables organized in classes (`PathImage`, `PathIcons`, `PathAnimation`). Never hardcode asset paths elsewhere.
- **`size_config.dart`** — Responsive layout helpers (`getProportionateScreenHeight`, `getProportionateScreenWidth`, `getShortSize`).

---

## Naming Conventions

| Type | Suffix | Example file | Example class |
|---|---|---|---|
| Model | `_item.dart` | `post_item.dart` | `PostItem` |
| Provider | `_provider.dart` | `user_provider.dart` | `UserProvider` |
| Repository | `_repository.dart` | `user_repository.dart` | `UserRepository` |
| Cubit | `_cubit.dart` | `event_cubit.dart` | `EventCubit` |
| State | `_state.dart` | `event_state.dart` | `EventState` |
| Response | `_response.dart` | `chat_response.dart` | `ChatResponse` + `enum ChatResponseCode` |
| Dialog | `_dialog.dart` | `box_dialog.dart` | `BoxDialog` |
| Test | `_test.dart` | `movie_test.dart` | — |

- All file and folder names: lowercase letters and underscores only.
- Model field name constants: `field` + ModelName + FieldName (e.g., `fieldMovieTitle` in `MovieItem`).

---

## Key Patterns

### Cubit + State
Every cubit extends `DefaultCubit<T>` and is paired with a state extending `DefaultState`. States must implement `copy()` to return new instances — never mutate state directly.

```dart
// state
class EventState extends DefaultState<EventResponse> {
  final List<EventItem> events;
  EventState({required this.events, super.isLoading, super.response});

  @override
  EventState copy() => EventState(events: events, isLoading: isLoading, response: response);
}

// cubit
class EventCubit extends DefaultCubit<EventState> {
  EventCubit() : super(EventState(events: []));

  @override
  void initData() { /* initial load */ }
}
```

### Response / UI Messages
To show a dialog or toast from a cubit, use the Response pattern:
1. Create `lib/logic/responses/feature_response.dart` with enum `FeatureResponseCode` and class `FeatureResponse extends ResponseCodeItem`.
2. Add a `response` field of that type to the corresponding state.
3. Call `showMessage()` in the cubit to emit the response.
4. In the UI, wrap the page with `BlocListener` and call `ResponseCodeWidget.show()`, then reset `response` to null in state.

### Settings
To add a new persisted setting:
1. Add a constant in `constants.dart` below `///SETTINGS FIELD`, prefixed with `setting`.
2. Add the variable with a default value to `SettingsItem`.
3. Update `toMap()` and `fromMap()` in `SettingsItem`.
4. Add a method in `SettingsCubit` to modify it, calling `update()` at the end.

### Navigation
- All route constants live in `constants.dart` (e.g., `const pageSettings = '/settings'`).
- Register every new page in `app_router.dart`.
- Use `Navigator.of(context).pushNamed(pageX, arguments: {...})` for navigation.
- Pass `argumentIsNOAnimation: true` in arguments to suppress the transition animation.

### Localization
- Language files are `.arb` format in `lib/l10n/` (e.g., `intl_en.arb`, `intl_fr.arb`).
- To add a language: add its code to `supportedLanguages` in `constants.dart`, then create the `.arb` file.
- Access strings via `AppLocalizations.of(context)!.key`.
- Never hardcode UI-facing text strings; always use localization keys.

### Assets
- Declare all asset paths as constants in `lib/utils/path_assets.dart`.
- Never reference asset paths as raw strings outside this file.

---

## Default Logic Classes

Two cubits are always present and available globally via `BlocProvider` in `main.dart`:

- **`AppCubit` / `AppState`** — App-level state (loading, global response messages).
- **`SettingsCubit` / `SettingsState`** — Persisted settings (dark mode, language).

New cubits are scoped to specific pages/features unless they need to be global.

---

## Lint Compliance

After every change, verify compliance with Flutter lints:

```
flutter analyze
```

Fix all warnings and errors before considering a task complete. The project uses `package:flutter_lints/flutter.yaml`. Do not suppress lint rules without a documented reason.

---

## Build and Test

```bash
# Run all tests
flutter test

# Analyze code
flutter analyze

# Generate localization files
flutter gen-l10n
```

Tests live in `test/`. All test files must end with `_test.dart`.

---

## What Not to Do

- Do not add logic to presentation layer files (pages/widgets). Logic belongs in cubits.
- Do not call providers directly from cubits — always go through repositories.
- Do not hardcode strings, colors, spacing, or asset paths. Use constants, styles, and path variables.
- Do not import individual files when `my_material.dart` already exports them.
- Do not create new `BlocProvider` instances globally unless the cubit is truly app-wide.
