import 'package:cep_app/models/cidades_model.dart';
import 'package:cep_app/models/endereco_model.dart';
import 'package:cep_app/models/estados_model.dart';

abstract class CepRepository {
  Future<EnderecoModel> getByCep(String cep);
  Future<List<EstadosModel>> getEstados(String estado);
  Future<List<CidadesModel>> getCidades(String uf);
  Future<List<EnderecoModel>> getByNameLogradouro(
      {required String uf, required String cidade, required String logradouro});
}
