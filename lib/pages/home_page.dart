import 'dart:html';

import 'package:cep_app/models/endereco_model.dart';
import 'package:cep_app/pages/informations_adress_page.dart';
import 'package:cep_app/repositories/cep_repository.dart';
import 'package:cep_app/repositories/cep_repository_impl.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CepRepository cepRepository = CepRepositoryImpl();
  EnderecoModel? enderecoModel;
  bool loading = false;

  final formKey = GlobalKey<FormState>();
  final cepEC = TextEditingController();

  @override
  void dispose() {
    cepEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('LOCALIZA CEP'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: 300,
                child: Image.network(
                  'https://www.pngall.com/wp-content/uploads/5/Google-Maps-Location-Mark-PNG-HD-Image.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 100, bottom: 50),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'DIGITE UM CEP', hintText: 'ex: 12345678'),
                  controller: cepEC,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'CEP obrigatório';
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  MaterialPageRoute(
                      builder: (context) => InformationsAdressPage());

                  final valid = formKey.currentState?.validate() ?? false;
                  if (valid) {
                    try {
                      setState(() {
                        loading = true;
                      });
                      final endereco = await cepRepository.getCep(cepEC.text);
                      setState(() {
                        loading = false;
                        enderecoModel = endereco;
                      });
                    } catch (e) {
                      setState(() {
                        loading = false;
                        enderecoModel = null;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            'Erro ao buscar CEP',
                          ),
                        ),
                      );
                    }
                  }
                },
                child: const Text('Buscar'),
              ),
              Visibility(
                  visible: loading,
                  child: const CircularProgressIndicator(
                    value: 30,
                    strokeWidth: 1.5,
                  )),
              Visibility(
                visible: enderecoModel != null,
                child: Text(
                  '${enderecoModel?.logradouro}, ${enderecoModel?.cep}, ${enderecoModel?.bairro}, ${enderecoModel?.localidade}, ${enderecoModel?.uf}',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
