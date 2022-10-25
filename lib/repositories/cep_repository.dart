import 'package:cep_app/models/cidades_model.dart';
import 'package:cep_app/models/endereco_model.dart';
import 'package:cep_app/models/estados_model.dart';

abstract class CepRepository {
  Future<EnderecoModel> getCep(String cep);
  Future<List<EstadosModel>> getEstados(String estado);
  Future<List<CidadesModel>> getCidades(String uf);
  
}
