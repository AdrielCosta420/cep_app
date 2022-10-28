import 'package:cep_app/models/endereco_model.dart';
import 'package:cep_app/widgets/cidade_custom_widget.dart';
import 'package:cep_app/widgets/uf_custom_widget.dart';
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

  late GlobalKey<FormState> formKey;

  final cepEC = TextEditingController();
  final HomeStore store = HomeStore();

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    cepEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              store.clean();
            },
            icon: Icon(
              Icons.refresh,
              color: Colors.green.shade500,
              size: 27,
            ),
          )
        ],
        backgroundColor: Colors.grey.shade300,
        centerTitle: true,
        title: Text(
          'LOCALIZA CEP',
          style: GoogleFonts.adamina(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                width: 230,
                height: 250,
                child: Image.asset('assets/image/maps.png'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: UfCustomWidget(
                        store: store,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 3,
                      child: CidadeCustomWidget(
                        store: store,
                      ),
                    ),
                  ],
                ),
              ),
              Observer(
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: TextFormField(
                      enabled: store.uf != null && store.cidade != null,
                      onChanged: (value) => store.logradouroChange(value),
                      decoration: const InputDecoration(
                        /*border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        )*/
                        icon: Icon(Icons.manage_search_rounded,
                            color: Colors.blue),
                        label: Text(
                          'insira o endereço',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  children: const [
                    Expanded(
                        child: Divider(
                      endIndent: 10,
                      indent: 25,
                      color: Colors.black,
                    )),
                    Text(
                      'OU',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                        child: Divider(
                      indent: 10,
                      endIndent: 25,
                      color: Colors.black,
                    ))
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      labelText: 'PESQUISA POR CEP',
                      hintText: 'ex: 12345678'),
                  controller: cepEC,
                  onChanged: (value) => store.cepChange(value),
                  validator: (value) {
                    if (store.cidade != null) {
                      return null;
                    }
                    if (store.uf != null) {
                      return null;
                    }
                    if (value == null || value.isEmpty) {
                      return 'CEP obrigatório';
                    }
                    if (value.length != 8) {
                      return 'CEP invalido';
                    }
                    // return null;
                  },
                ),
              ),
              Observer(
                builder: (_) {
                  return ElevatedButton(
                    style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(200, 40)),
                    ),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        store.isLoadingChange();
                        if (store.cidade != null &&
                            store.uf != null &&
                            store.logradouro != null) {
                          try {
                            final enderecos =
                                await cepRepository.getByNameLogradouro(
                              uf: store.uf ?? "",
                              cidade: store.cidade ?? "",
                              logradouro: store.logradouro ?? "",
                            );
                            showAlertEnderecosModel(context, enderecos);
                          } catch (e) {
                            store.enderecoChange(null);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  'Erro ao buscar Endereço',
                                ),
                              ),
                            );
                          }
                        } else {
                          try {
                            final endereco =
                                await cepRepository.getByCep(cepEC.text);
                            store.enderecoChange(endereco);
                            cepEC.clear();
                            // ignore: use_build_context_synchronously
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => InformationsAdressPage(
                                enderecoModel: endereco,
                              ),
                            ));
                            store.clean();
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
                      }
                    },
                    child: !store.isLoading
                        ? const Text(
                            'Buscar',
                          )
                        : const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
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

  void showAlertEnderecosModel(BuildContext context, List<EnderecoModel> list) {
    AlertDialog alerta = AlertDialog(
      title: const Text(
        "selecione endereço:",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Column(
          mainAxisSize: MainAxisSize.min,
          children: list
              .map((e) => ListTile(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>
                            InformationsAdressPage(enderecoModel: e),
                      ));
                      store.clean();
                    },
                    title: Text(e.logradouro),
                  ))
              .toList()),
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }
}
