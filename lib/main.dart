import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home(), debugShowCheckedModeBanner: false));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController alcControl = TextEditingController();
  TextEditingController gasControl = TextEditingController();
  String resu = "informr os valores";

  void resetaR() {
    alcControl.text = "";
    gasControl.text = "";

    setState(() {
      resu = "Informe os valores.";
    });
  }

  void calcComb() {
    setState(() {
      double valcool = double.parse(alcControl.text.replaceAll(',', '.'));
      double vgaso = double.parse(gasControl.text.replaceAll(',', '.'));

      double proporcao = valcool / vgaso;

      if (proporcao < 0.7) {
        resu = " Coloque Álcool";
      } else {
        resu = "Coloque Gasolina";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Álcool ou Gasolina?",
          style: TextStyle(color: const Color.fromARGB(255, 41, 31, 21)),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 236, 213, 4),
        actions: [
          IconButton(
            onPressed: () {
              resetaR();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          child: Column(
            children: [
              Icon(
                Icons.local_gas_station,
                size: 144.0,
                color: Colors.amberAccent,
              ),
              TextFormField(
                controller: alcControl,

                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço do Álcool.",
                  labelStyle: TextStyle(color: Colors.blueAccent),
                ),
                style: TextStyle(color: Colors.blue, fontSize: 26.0),
              ),

              TextFormField(
                controller: gasControl,

                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço da Gasolina.",
                  labelStyle: TextStyle(color: Colors.blueAccent),
                ),
                style: TextStyle(color: Colors.blue, fontSize: 26.0),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Container(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      calcComb();
                    },
                    child: Text(
                      "Verificar ",
                      style: TextStyle(color: Colors.brown, fontSize: 25.0),
                    ),
                  ),
                ),
              ),
              Text(
                resu,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontSize: 26.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
