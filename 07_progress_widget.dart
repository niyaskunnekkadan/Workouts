import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const ScreenHome(),
    );
  }
}

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircPercent(),
            LineProgress(),
            LinePercent(),
          ],
        ),
      ),
    );
  }
}


class CircPercent extends StatelessWidget {
  const CircPercent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 100,
      lineWidth: 20,
      startAngle: 10,
      percent: .6,
      backgroundColor: Colors.purple.shade100,
      progressColor: Colors.purple,
      backgroundWidth: 18,
      center: const Text('60% Processing...'),
      animation: true,
      animationDuration: 1800,
      restartAnimation: true,
    );
  }
}


class LineProgress extends StatelessWidget {
  const LineProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      minHeight: 20,
      color: Colors.green,
      backgroundColor: Colors.green.shade100,
    );
  }
}


class LinePercent extends StatelessWidget {
  const LinePercent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      percent: .4,
      backgroundColor: Colors.purple.shade100,
      progressColor: Colors.purple,
      animation: true,
      animationDuration: 1800,
      restartAnimation: true,
      lineHeight: 20,
      barRadius: const Radius.circular(20),
    );
  }
}
