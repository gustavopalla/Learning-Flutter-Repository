import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class BaterryPage extends StatefulWidget {
  const BaterryPage({super.key});

  @override
  State<BaterryPage> createState() => _BaterryPageState();
}

class _BaterryPageState extends State<BaterryPage> {

  var batteryLevel = Battery();
  String statusBateria = '';

  String mensagemBateria() {
  if (statusBateria == '') return 'Carregando...';
  int nivel = int.parse(statusBateria.replaceAll('%', ''));
  if (nivel < 100) return 'Carregando...';
  return 'Bateria Carregada!';
}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    int nivelBateria = await batteryLevel.batteryLevel;
    print('Nivel bateria: $nivelBateria');
    setState(() {
      statusBateria = '$nivelBateria%';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    
    Scaffold(
      appBar: AppBar(
        title: Text("Status da Bateria: ${statusBateria}"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: new LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 16,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 1000,
                percent: (int.parse(statusBateria.replaceAll('%', '')) / 100),
                center: Text(
                  statusBateria,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                progressColor: Colors.green,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(8),
          child: Text(mensagemBateria()))
        ],
      )
      ),

    );
  }
}