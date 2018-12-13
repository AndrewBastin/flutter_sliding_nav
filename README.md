# flutter_sliding_nav
[![pub package](https://img.shields.io/pub/v/flutter_sliding_nav.svg)](https://pub.dartlang.org/packages/flutter_sliding_nav)
flutter_sliding_nav provides you with the SlidingRoot widget which takes a slideable front widget which is rendered over a back widget, this can be used to make unique intuitive gesture interfaces

[Pub Package](https://pub.dartlang.org/packages/flutter_sliding_nav)

## Usage
```dart
new SlidingRoot(
    back: new Container(
        decoration: new BoxDecoration(color: Colors.white)
    ),

    front: new Container(
        decoration: new BoxDecoration(color: Colors.black)
    )
)
```
This renders a black colored screen which you can swipe from left edge to the right to reveal the back widget