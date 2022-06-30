import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DemoPage(),
    );
  }
}

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  bool _doAnimate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                const SizedBox(
                  width: 200,
                  height: 200,
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 800),
                  bottom: _doAnimate ? 100 : 0,
                  child: AnimatedOpacity(
                    opacity: _doAnimate ? 1.0 : 1.0,
                    duration: const Duration(seconds: 500),
                    child: const Icon(Icons.star, size: 32),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _doAnimate = !_doAnimate;
                });
              },
              child: const Text('アニメーション'),
            ),
          ],
        ),
      ),
    );
  }
}
