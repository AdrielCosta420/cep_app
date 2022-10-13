import 'package:google_fonts/google_fonts.dart';

import 'informations_adress_page.dart';
import '../repositories/cep_repository.dart';
import '../repositories/cep_repository_impl.dart';
import '../store/home.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
        title: Text(
          'LOCALIZA CEP',
          style: GoogleFonts.adamina(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                width: 350,
                height: 300,
                child: Image.asset('assets/image/maps.png'),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      labelText: 'PESQUISE POR CEP',
                      hintText: 'ex: 12345678'),
                  controller: cepEC,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'CEP obrigatório';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    labelText: 'PESQUISE POR ENDEREÇO',
                  ),
                ),
              ),
              Observer(
                builder: (_) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(color: Colors.black)),
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
                            builder: (context) => InformationsAdressPage(
                                enderecoModel: endereco, store: store),
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
            ],
          ),
        ),
      ),
    );
  }
}
