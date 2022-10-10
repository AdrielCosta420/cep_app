import 'package:cep_app/models/endereco_model.dart';
import 'package:mobx/mobx.dart';
part 'home.store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  bool isLoading = false;
  @action
  void isLoadingChange() => isLoading = !isLoading;

  @observable
  EnderecoModel? enderecoModel;
  @action
  void enderecoChange(EnderecoModel? value) => enderecoModel = value;
}
