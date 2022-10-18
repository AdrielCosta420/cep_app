import 'package:cep_app/store/home.store.dart';
import 'package:cep_app/widgets/row_card_custom_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/endereco_model.dart';
import 'package:flutter/material.dart';

class InformationsAdressPage extends StatelessWidget {
  final HomeStore store;
  const InformationsAdressPage(
      {Key? key, required this.enderecoModel, required this.store})
      : super(key: key);
  final EnderecoModel enderecoModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(enderecoModel.logradouro,
            style: GoogleFonts.adamina(color: Colors.white, fontSize: 25)),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shadowColor: Colors.grey,
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                children: [
                  RowCardCustomWidget(
                    text: 'Logradouro:',
                    store: store.enderecoModel?.logradouro,
                  ),
                  RowCardCustomWidget(
                      text: 'Cep:', store: store.enderecoModel?.cep),
                  RowCardCustomWidget(
                      text: 'Bairro:', store: store.enderecoModel?.bairro),
                  RowCardCustomWidget(
                      text: 'Complemento:',
                      store: store.enderecoModel?.complemento),
                  RowCardCustomWidget(
                      text: 'Localidade:',
                      store: store.enderecoModel?.localidade),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          'UF:',
                          style:
                              GoogleFonts.adamina(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text('${store.enderecoModel?.uf}',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
