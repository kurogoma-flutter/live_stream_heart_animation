import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: Center(
        child: IconWidget(),
      ),
    );
  }
}

class ShakeCurve extends Curve {
  @override
  double transform(double t) {
    return 24 * math.sin(2 * math.pi * t);
  }
}

class IconWidget extends StatefulWidget {
  const IconWidget({Key? key}) : super(key: key);

  @override
  _IconWidgetState createState() => _IconWidgetState();
}

class _IconWidgetState extends State<IconWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late CurvedAnimation curvedAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animationController.addListener(() {
      setState(() {});
    });
    animationController.repeat();
    curvedAnimation =
        CurvedAnimation(parent: animationController, curve: ShakeCurve());
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double left = 40;
    left += curvedAnimation.value;
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(width: 160.0, height: 60.0),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            left: left,
            top: 0.0,
            child: const Icon(
              Icons.star_outline_rounded,
              size: 60,
            ),
          ),
        ],
      ),
    );
  }
}
