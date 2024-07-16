<h2 align = "center">  Planets App </h2>


### Example: AnimatedContainer for Planet Details

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(PlanetsApp());
}

class PlanetsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Planets App'),
        ),
        body: PlanetDetails(),
      ),
    );
  }
}

class PlanetDetails extends StatefulWidget {
  @override
  _PlanetDetailsState createState() => _PlanetDetailsState();
}

class _PlanetDetailsState extends State<PlanetDetails> {
  bool _isLarge = false;

  void _toggleSize() {
    setState(() {
      _isLarge = !_isLarge;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _toggleSize,
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: _isLarge ? 200.0 : 100.0,
          height: _isLarge ? 200.0 : 100.0,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(_isLarge ? 20.0 : 10.0),
          ),
          child: Center(
            child: Text(
              _isLarge ? 'Planet Details' : 'Tap to Expand',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ),
      ),
    );
  }
}
```

### Description:

1. **Imports and Setup**: Import necessary packages (`flutter/material.dart`) and set up a basic Flutter app (`PlanetsApp`) with an app bar and a main widget (`PlanetDetails`).

2. **AnimatedContainer**: Inside `PlanetDetails`, use `AnimatedContainer` as the main widget. It animates changes to its properties like `width`, `height`, and `borderRadius` based on `_isLarge` state.

3. **State Management**: `_PlanetDetailsState` manages the `_isLarge` boolean state. Tapping on the container toggles `_isLarge`, triggering the animation due to `setState()`.

4. **GestureDetector**: Wraps the `AnimatedContainer` to detect taps and call `_toggleSize` to change `_isLarge`.

5. **Animation Properties**: `duration` specifies how long the animation should take (1 second in this case), and `curve` defines the animation's speed curve (here, `Curves.fastOutSlowIn` for a smooth transition).

6. **Decoration and Child**: `AnimatedContainer` decorates with a blue color and rounded corners (`borderRadius`). Its child (`Text`) changes based on `_isLarge` state.

This example demonstrates a basic use of animation with AnimatedContainer in Flutter, which you can adapt and expand upon for your planets app.


<img src = "https://github.com/user-attachments/assets/d95cdbbb-6e57-48ad-b00c-33cac60dbfcf" width=22% height=35%>

<img src = "https://github.com/user-attachments/assets/7a14d549-398b-4faa-a3ce-e1132aaaf494" width=22% height=35%>

<img src = "https://github.com/user-attachments/assets/f98dfe95-30bd-413a-a24b-fceeef709eee" width=22% height=35%>

<img src = "https://github.com/user-attachments/assets/7397c452-3040-4f18-b1d4-4fe7b65b90d8" width=22% height=35%>
