import 'package:cep_app/models/endereco_model.dart';
import 'package:cep_app/pages/informations_adress_page.dart';
import 'package:cep_app/repositories/cep_repository.dart';
import 'package:cep_app/repositories/cep_repository_impl.dart';
import 'package:cep_app/store/home.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:logger/logger.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CepRepository cepRepository = CepRepositoryImpl();
  bool loading = false;

  final formKey = GlobalKey<FormState>();
  final cepEC = TextEditingController();
  final HomeStore store = HomeStore();

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
                child: Image.asset(
                  'image/maps.png',
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
              Observer(
                builder: (_) {
                  return ElevatedButton(
                    onPressed: () async {
                      store.isLoadingChange();
                      final valid = formKey.currentState?.validate() ?? false;
                      if (valid) {
                        try {
                          final endereco =
                              await cepRepository.getCep(cepEC.text);
                          store.enderecoChange(endereco);
                          cepEC.clear();
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                InformationsAdressPage(enderecoModel: endereco),
                          ));
                        } catch (e) {
                          store.enderecoChange(null);
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
                      store.isLoadingChange();
                    },
                    child: !store.isLoading
                        ? const Text('Buscar')
                        : const SizedBox(
                            height: 50,
                            child: CircularProgressIndicator(),
                          ),
                  );
                },
              ),
              Observer(
                builder: (_) {
                  return Visibility(
                    visible: store.enderecoModel != null,
                    child: Text(
                      '${store.enderecoModel?.logradouro}, ${store.enderecoModel?.cep}, ${store.enderecoModel?.bairro}, ${store.enderecoModel?.localidade}, ${store.enderecoModel?.uf}',
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
