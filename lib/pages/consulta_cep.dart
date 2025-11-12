import 'dart:convert';
import 'package:appdioteste/model/viaCEPModel.dart';
import 'package:appdioteste/repository/via_cep_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConsultaCEP extends StatefulWidget {
  const ConsultaCEP({super.key});

  @override
  State<ConsultaCEP> createState() => _TesteHttpState();
}

class _TesteHttpState extends State<ConsultaCEP> {

  var cepController = TextEditingController(text: "");
  bool loading = false;

  viaCEPModel? _viacepModel;

  var viaCepRepository = ViaCepRepository();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        child: Column(
          children: [
            Text("Consulta CEP", style: TextStyle(fontSize: 20),),
            TextField(
              controller: cepController,
              keyboardType: TextInputType.number,
              onChanged: (String value) async {
  
                var cep = value.trim().replaceAll(RegExp(r'[^0-9]'), '');
                
                if (cep.length >= 8) {
                  
                  setState(() {
                    loading = true;
                    _viacepModel = null;
                  });

                  _viacepModel = await viaCepRepository.consultarCEP(cep);

                  var response = await http.get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));
                  var json = jsonDecode(response.body);

                  
                  setState(() {
                    loading = false;
                    
                    
                    if (json.containsKey("erro") && json["erro"] == true) {
                      
                      _viacepModel = null;
                    } else {
                      _viacepModel = viaCEPModel.fromJson(json);
                    }
                  });

                } else {
                  
                  setState(() {
                    _viacepModel = null;
                    loading = false;
                  });
                }
              },
            ),
            SizedBox(height: 50),
          Text(_viacepModel?.logradouro ?? '', style: TextStyle(fontSize: 16),),
          Text('${_viacepModel?.localidade ?? ''} - ${_viacepModel?.uf ?? ''}', style: TextStyle(fontSize: 20),),
          Visibility(
            visible: loading,
            child: CircularProgressIndicator()
            )
          ],
        ),
      ),
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
      }
      ),
    ));
  }
}