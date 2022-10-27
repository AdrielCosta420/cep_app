// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:cep_app/models/estados_model.dart';
import 'package:cep_app/repositories/cep_repository.dart';
import 'package:cep_app/repositories/cep_repository_impl.dart';
import 'package:cep_app/store/home.store.dart';

class UfCustomWidget extends StatefulWidget {
  HomeStore store;
  UfCustomWidget({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  State<UfCustomWidget> createState() => _UfCustomWidgetState();
}

class _UfCustomWidgetState extends State<UfCustomWidget> {
  CepRepository repository = CepRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<EstadosModel>(
      validator: (value) {
        if (widget.store.cep != null) {
          return null;
        }
        return value == null ? "Campo Obrigatorio" : null;
      },
      asyncItems: (_) => repository.getEstados(widget.store.uf ?? ""),
      onChanged: (value) => widget.store.ufChange(value?.sigla ?? ""),
      filterFn: (item, filter) =>
          item.sigla?.toLowerCase().contains(filter.toLowerCase()) ?? false,
      dropdownBuilder: _customDropDown,
      popupProps: PopupProps.dialog(
        itemBuilder: _customPopupItemBuilder,
        showSearchBox: true,
      ),
      dropdownDecoratorProps: const DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          filled: true,
          labelText: 'Selecione UF',
          contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
        ),
      ),
    );
  }

  Widget _customPopupItemBuilder(
      BuildContext context, EstadosModel? item, bool isSelected) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: ListTile(
        selected: isSelected,
        title: Text(item?.sigla ?? ''),
      ),
    );
  }

  Widget _customDropDown(
    BuildContext context,
    EstadosModel? item,
  ) {
    if (item == null) {
      return Container();
    }

    return Container(
      child: (item.sigla == null)
          ? const ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text("Selecione um item"),
            )
          : ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(item.sigla!),
            ),
    );
  }
}
