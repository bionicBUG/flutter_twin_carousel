import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController c1;
  late PageController c2;
  bool s1 = false;
  bool s2 = false;
  int _previousPage = 0;

  void reset() {
    s1 = false;
    s2 = false;
  }

  void _on1Scroll() {
    if (s2) return;

    s1 = true;
    if (c1.page!.toInt() == c1.page) {
      _previousPage = c1.page!.toInt();
      reset();
    }

    c2.position.jumpTo(c1.position.pixels);
  }

  void _on2Scroll() {
    if (s1) return;

    s2 = true;
    if (c2.page!.toInt() == c2.page) {
      _previousPage = c2.page!.toInt();
      reset();
    }

    c1.position.jumpTo(c2.position.pixels);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    c1 = PageController(viewportFraction: 0.8)
      ..addListener(() {
        _on1Scroll();
      });
    c2 = PageController(viewportFraction: 0.8)
      ..addListener(() {
        _on2Scroll();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: PageView(
              controller: c1,
              children: <Widget>[
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.green,
                ),
                Container(
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: PageView(
              controller: c2,
              children: <Widget>[
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.green,
                ),
                Container(
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
