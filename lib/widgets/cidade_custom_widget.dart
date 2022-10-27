// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:cep_app/models/cidades_model.dart';
import 'package:cep_app/repositories/cep_repository.dart';
import 'package:cep_app/repositories/cep_repository_impl.dart';
import 'package:cep_app/store/home.store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CidadeCustomWidget extends StatelessWidget {
  HomeStore store;
  CidadeCustomWidget({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CepRepository repository = CepRepositoryImpl();

    return Observer(
      builder: (context) {
        return DropdownSearch<CidadesModel>(
          enabled: store.uf != null,
          asyncItems: (_) => repository.getCidades(store.uf ?? ""),
          onChanged: (value) => store.cidadesChange(value?.nome ?? ""),
          validator: (value) {
            if (store.cep != null) {
              return null;
            }
            return value == null ? "Campo Obrigatoriuuu" : null;
          },
          filterFn: (item, filter) =>
              item.nome?.toUpperCase().contains(filter.toUpperCase()) ?? false,
          dropdownBuilder: _customDropDown,
          popupProps: PopupProps.dialog(
            itemBuilder: _customPopupItemBuilder,
            showSearchBox: true,
          ),
          dropdownDecoratorProps: const DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              filled: true,
              labelText: 'Selecione uma cidade',
              contentPadding: EdgeInsets.fromLTRB(12, 55, 0, 0),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
            ),
          ),
        );
      },
    );
  }

  Widget _customPopupItemBuilder(
      BuildContext context, CidadesModel? item, bool isSelected) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: ListTile(
        title: Text(item?.nome ?? ''),
      ),
    );
  }

  Widget _customDropDown(
    BuildContext context,
    CidadesModel? item,
  ) {
    if (item == null) {
      return Container();
    }

    return Container(
      child: (item.nome == null)
          ? const ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text("Selecione um item"),
            )
          : Text(
              item.nome ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
    );
  }
}
