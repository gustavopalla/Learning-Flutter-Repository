import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  PageController pageController = PageController();
  var controllerCEP = TextEditingController();
  var controllerCPF = TextEditingController();

  String cpfStatus = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: PageView(
        controller: pageController,
        children: [
          Container(
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Cep'),
                  TextFormField(
                    controller: controllerCEP,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CepInputFormatter(),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text('CPF'),
                  TextFormField(
                    controller: controllerCPF,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter(),
                    ],
                  ),
                  SizedBox(height: 20,),
                  TextButton(onPressed: (){
                    bool isValid = UtilBrasilFields.isCPFValido(controllerCPF.text);
                    setState(() {
                      cpfStatus = (isValid ? 'CPF Válido' : 'CPF Inválido');
                    });
                  }, 
                  child: Text('Continuar')),
                  SizedBox(height: 20,),
                  Text(cpfStatus),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.purple,
          ),
          Container(
            color: Colors.orange,
          ),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.map, title: 'Map'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        initialActiveIndex: 0,
        onTap: (int i){
          pageController.jumpToPage(i);
        },
      ),
    ));
  }
}