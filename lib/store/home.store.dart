import '../models/endereco_model.dart';
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

  @observable
  String? uf;
  @action
  void ufChange(String? value) => uf = value;

  @observable
  String? cidade;
  @action
  void cidadesChange(String? value) => cidade = value;

  @observable
  String? logradouro;

  @action
  void logradouroChange(String? value) => logradouro = value;

  @observable
  String? cep;

  @action
  void cepChange(String? value) => cep = value;

  @action
  void clean() {
    enderecoModel = null;
    uf = null;
    cidade = null;
    logradouro = null;
    cep = null;
  }
}
