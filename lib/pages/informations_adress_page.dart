import 'package:cep_app/pages/home_page.dart';
import 'package:cep_app/store/home.store.dart';
import 'package:cep_app/widgets/row_card_custom_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/endereco_model.dart';
import 'package:flutter/material.dart';

class InformationsAdressPage extends StatelessWidget {
  const InformationsAdressPage({Key? key, required this.enderecoModel})
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
            onPressed: () =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const HomePage(),
                )),
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
                    title: 'Logradouro:',
                    value: enderecoModel.logradouro,
                  ),
                  RowCardCustomWidget(title: 'Cep:', value: enderecoModel.cep),
                  RowCardCustomWidget(
                      title: 'Bairro:', value: enderecoModel.bairro),
                  RowCardCustomWidget(
                      title: 'Complemento:', value: enderecoModel.complemento),
                  RowCardCustomWidget(
                      title: 'Localidade:', value: enderecoModel.localidade),
                  RowCardCustomWidget(title: 'UF', value: enderecoModel.uf),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
