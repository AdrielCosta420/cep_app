import 'package:cep_app/store/home.store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../models/endereco_model.dart';
import 'package:flutter/material.dart';

class InformationsAdressPage extends StatelessWidget {
  final HomeStore store;
  InformationsAdressPage(
      {Key? key, required this.enderecoModel, required this.store})
      : super(key: key);
  final EnderecoModel enderecoModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: const Text("ENDEREÇO"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 5,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${store.enderecoModel?.logradouro}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${store.enderecoModel?.cep}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${store.enderecoModel?.bairro}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${store.enderecoModel?.complemento}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${store.enderecoModel?.localidade}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${store.enderecoModel?.uf}',
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
