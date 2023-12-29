import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controllerAlcool = TextEditingController();
  final TextEditingController _controllerGasolina = TextEditingController();

  String _mensagem = "";

  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _mensagem =
            "Número inválido, digite números maiores que 0 e utilizando (.)";
      });
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _mensagem = "Melhor abastecer com GASOLINA";
        });
      } else {
        setState(() {
          _mensagem = "Melhor abastecer com ÁLCOOL";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Álcool ou gasolina",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromRGBO(63, 81, 143, 1),
      ),
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70, bottom: 50),
                  child: Image.asset("images/logo.png"),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text(
                    "Saiba qual a melhor opção para abastecimento do seu carro.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: Color.fromRGBO(63, 81, 143, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Preço do álcool, ex.: 3.31",
                  ),
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                  controller: _controllerAlcool,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Preço da Gasolina Comum, ex.: 5.79",
                  ),
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                  controller: _controllerGasolina,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextButton(
                    onPressed: _calcular,
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromRGBO(63, 81, 143, 1),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.zero),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    ),
                    child: const Text(
                      "Calcular",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    _mensagem,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(63, 81, 143, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]),
            )
          ],
        )
      ]),
    );
  }
}
