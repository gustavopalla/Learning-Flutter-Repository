import 'dart:convert';
import 'package:appdioteste/model/viaCEPModel.dart';
import 'package:http/http.dart' as http;

class ViaCepRepository {
  
  Future<viaCEPModel> consultarCEP(String cep) async{
      var response = await http.get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));
      if(response.statusCode == 200){
        var json = jsonDecode(response.body);
        return viaCEPModel.fromJson(json);
      }
      return viaCEPModel();      
  }

}