import 'dart:math';

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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'InternShip Task - Meenu Singh'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final _random = Random();

  List colors = [Colors.red, Colors.green, Colors.yellow,Colors.indigoAccent,Colors.lightGreen, Colors.black, Colors.lightGreen, Colors.black, Colors.pink, Colors.lightGreenAccent, Colors.orange, Colors.cyan, Colors.lightBlue,Colors.brown,Colors.purpleAccent ,Colors.pink, Colors.lightGreenAccent, Colors.orange, Colors.cyan, Colors.lightBlue,Colors.brown,Colors.purpleAccent , Colors.teal, Colors.greenAccent, Colors.grey, Colors.amber, Colors.purple,Colors.deepOrange];
  //List<Color> colors1 = [Colors.lightGreen, Colors.black, Colors.pink, Colors.lightGreenAccent, Colors.orange, Colors.cyan, Colors.lightBlue,Colors.brown,Colors.purpleAccent ];
  Random random = Random();
  //Random randomc2 = Random();

  int index = 0;

  void changeIndex() {
    setState(() => index = random.nextInt(17));
  }

  // void changeIndexC2() {
  //   setState(() => index = randomc2.nextInt(9));
  // }

  final double widgetALeft = 5;
  final double widgetBLeft = 110;
  bool swapped = false;

  late AnimationController controller;
  late Animation<double> addressAnimation;

  animationListener() => setState(() {});

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    // Initialize animations
    controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    addressAnimation = Tween(
      begin: 0.0,
      end: widgetBLeft - widgetALeft,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0.0, 1.0, curve: Curves.easeInToLinear),
    ))
      ..addListener(animationListener);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeIndex();
    //changeIndexC2();
  }

  @override
  dispose() {
    // Dispose of animation controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tweenValue = addressAnimation.value;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
        width: 300,
        height: 150,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 5,
              left: widgetALeft + tweenValue,
              child: Container(width: 100.0, height: 100.0, color: colors[index]
              ),
            ),
            Positioned(
              top: 5,
              left: widgetBLeft - tweenValue,
              child: Container(width: 100.0, height: 100.0, color: colors[index +1]
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          changeIndex();
          swapped ? controller.reverse() : controller.forward();
          swapped = !swapped;
        }),
        // _incrementCounter,
        tooltip: 'Swap',
        child: const Icon(Icons.emoji_emotions_outlined),
      ),
    );
  }
}
