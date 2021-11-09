import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pattern',
      home: HomePage(),
    );
  }
}

const List<Color> colors1 = [
  Color(0xffE5989B),
  Color(0xffFFCDB2),
  Color(0xffB5838D),
  Color(0xffFFB4A2),
  Color(0xff6D6875)
];

const List<Color> colors2 = [
  Color(0xffD8E2DC),
  Color(0xff97F4FF),
  Color(0xff9D8189),
  Color(0xffFFB4A2),
  Color(0xffFFE5D9)
];

const List<Color> colors3 = [
  Color(0xffD8E2DC),
  Color(0xff97F4FF),
  Color(0xff9D8189),
  Color(0xff14213D),
  Color(0xffEF9B10),
  Color(0xffFCA311),
];

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PatterGenerator(
        colors: colors3,
      ),
    );
  }
}

generateRandomDataFromList(List list) {
  return list[Random().nextInt(list.length)];
}

class PatterGenerator extends StatefulWidget {
  final List<Color> colors;
  final int crossAxisCount;
  PatterGenerator({
    Key? key,
    required this.colors,
    this.crossAxisCount = 5,
  }) : super(key: key);

  @override
  _PatterGeneratorState createState() => _PatterGeneratorState();
}

class _PatterGeneratorState extends State<PatterGenerator> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: widget.crossAxisCount,
      children: List.generate(50, (index) {
        return Center(
          child: Shape(
            colors: widget.colors,
          ),
        );
      }),
    );
  }
}

List<BorderRadius> shape1 = [
  const BorderRadius.only(
    topLeft: Radius.circular(500),
    topRight: Radius.circular(500),
  ),
  const BorderRadius.only(
    topRight: Radius.circular(500),
    bottomRight: Radius.circular(500),
  ),
  const BorderRadius.only(
    topLeft: Radius.circular(500),
    bottomLeft: Radius.circular(500),
  ),
  const BorderRadius.only(
    bottomLeft: Radius.circular(500),
    bottomRight: Radius.circular(500),
  ),
  BorderRadius.circular(500),
];

List<BorderRadius> shape2 = [
  const BorderRadius.only(
    topLeft: Radius.circular(500),
  ),
  const BorderRadius.only(
    topRight: Radius.circular(500),
  ),
  const BorderRadius.only(
    bottomLeft: Radius.circular(500),
  ),
  const BorderRadius.only(
    bottomRight: Radius.circular(500),
  ),
  BorderRadius.circular(500),
];

List<BorderRadius> shape3 = [
  const BorderRadius.only(
    topLeft: Radius.circular(500),
    topRight: Radius.circular(500),
  ),
  const BorderRadius.only(
    topRight: Radius.circular(500),
    bottomRight: Radius.circular(500),
  ),
  const BorderRadius.only(
    topLeft: Radius.circular(500),
    bottomLeft: Radius.circular(500),
  ),
  const BorderRadius.only(
    bottomLeft: Radius.circular(500),
    bottomRight: Radius.circular(500),
  ),
  BorderRadius.circular(500),
  BorderRadius.zero,
];

class Shape extends StatelessWidget {
  final List<Color> colors;
  const Shape({Key? key, required this.colors}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: generateRandomDataFromList(colors),
        borderRadius: generateRandomDataFromList(shape3),
      ),
    );
  }
}
