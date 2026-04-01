# shimmer_widget

A Flutter demo that shows a shimmer loading state and lets you toggle between placeholder content and real list content.

## Preview

[Shimmer widget preview](docs/images/shimmer-widget-preview.svg)

## Context Used

This screen demonstrates a simple loading skeleton UI built with the [`shimmer`](https://pub.dev/packages/shimmer) package.

- A centered toggle button switches between the loading state and the loaded content.
- The loading state renders four skeleton rows with circular avatar placeholders and text bars.
- The loaded state swaps those placeholders for real `ListTile` content.
- The app uses Material 3 styling with a soft neutral color palette to keep the shimmer effect subtle.

## Run The App

```bash
flutter pub get
flutter run
```