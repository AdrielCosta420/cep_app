import 'package:cep_app/models/cidades_model.dart';
import 'package:cep_app/repositories/cep_repository.dart';
import 'package:cep_app/repositories/cep_repository_impl.dart';
import 'package:cep_app/store/home.store.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CidadeCustomWidget extends StatelessWidget {
  HomeStore store = HomeStore();
  CidadeCustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CepRepository repository = CepRepositoryImpl();

    return DropdownSearch<CidadesModel>(
      asyncItems: repository.getCidades,
      onChanged: (value) {
        store.cidadesChange;
      },
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
  }

  Widget _customPopupItemBuilder(
      BuildContext context, CidadesModel? item, bool isSelected) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: ListTile(
        selected: isSelected,
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
          : ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(item.nome!),
            ),
    );
  }
}
