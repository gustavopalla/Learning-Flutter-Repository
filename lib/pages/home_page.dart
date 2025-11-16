import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: new CircularPercentIndicator(
                  radius: 120.0,
                  lineWidth: 13.0,
                  animation: true,
                  percent: 0.7,
                  center: new Text(
                    "70.0%",
                    style:
                        new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  footer: new Text(
                    "Progresso do Usuário",
                    style:
                        new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.purple,
                
                  backgroundColor: Colors.grey.shade300,
                  animationDuration: 1200,
              
                ),
                
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: new LinearPercentIndicator(
                  width: 300.0,
                  lineHeight: 20.0,
                  animation: true,
                  percent: 0.5,
                  center: Text(
                    "50.0%",
                    style:
                        new TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
                  ),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.green,
                  backgroundColor: Colors.grey.shade300,
                  animationDuration: 1200,
                ),
                
              ),
            )
          ],
        ),
      ),
    ));
  }
}