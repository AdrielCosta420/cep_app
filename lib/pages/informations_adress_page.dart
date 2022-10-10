import 'dart:html';

import 'package:cep_app/models/endereco_model.dart';
import 'package:flutter/material.dart';

class InformationsAdressPage extends StatelessWidget {
  const InformationsAdressPage({Key? key, required this.enderecoModel})
      : super(key: key);
  final EnderecoModel enderecoModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ENDEREÇO"),
      ),
      body: Center(child: Text(enderecoModel.logradouro)),
    );
  }
}
