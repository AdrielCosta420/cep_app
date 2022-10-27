import 'package:cep_app/models/cidades_model.dart';
import 'package:cep_app/models/endereco_model.dart';
import 'package:cep_app/models/estados_model.dart';
import 'package:dio/dio.dart';
import 'cep_repository.dart';
import 'package:logger/logger.dart';

class CepRepositoryImpl implements CepRepository {
  var logger = Logger();

  @override
  Future<EnderecoModel> getByCep(String cep) async {
    try {
      final response = await Dio().get('https://viacep.com.br/ws/$cep/json/');

      final endereco = EnderecoModel.fromMap(response.data);
      logger.i(endereco.logradouro);
      return endereco;
    } on DioError catch (e) {
      logger.d('Erro ao buscar CEP\n\n ${e.message}');
      throw Exception('Erro ao buscar CEP');
    }
  }

  @override
  Future<List<CidadesModel>> getCidades(String uf) async {
    try {
      final response = await Dio().get(
          'https://servicodados.ibge.gov.br/api/v1/localidades/estados/$uf/distritos');

      List<CidadesModel> list = [];

      for (var element in response.data) {
        list.add(CidadesModel.fromMap(element));
      }

      return list;
    } on DioError catch (e) {
      logger.d('Erro ao buscar CIDADE');
      logger.e(e.message);
      throw Exception('Erro ao buscar CEP');
    }
  }

  @override
  Future<List<EstadosModel>> getEstados(String estado) async {
    try {
      final response = await Dio()
          .get('https://servicodados.ibge.gov.br/api/v1/localidades/estados/');

      List<EstadosModel> list = [];
      for (var element in response.data) {
        list.add(EstadosModel.fromMap(element));
      }
      return list;
    } on DioError catch (e) {
      logger.d('Erro ao buscar Estado');
      logger.e(e.message);
      throw Exception('Erro ao buscar CEP');
    }
  }

  @override
  Future<List<EnderecoModel>> getByNameLogradouro(
      {required String uf,
      required String cidade,
      required String logradouro}) async {
    try {
      final response =
          await Dio().get("https://viacep.com.br/ws/$uf/$cidade/$logradouro/json/");
      List<EnderecoModel> list = [];
      for (var element in response.data) {
        list.add(EnderecoModel.fromMap(element));
      }
      return list;
    } on DioError catch (e) {
      logger.d('Erro ao Endereco por logradouro');
      logger.e(e.message);
      throw Exception('Erro ao Endereco por logradouro');
    }
  }
}
