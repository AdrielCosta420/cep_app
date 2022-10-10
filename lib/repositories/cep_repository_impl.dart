import 'package:cep_app/models/endereco_model.dart';
import 'package:dio/dio.dart';
import 'cep_repository.dart';
import 'package:logger/logger.dart';

class CepRepositoryImpl implements CepRepository {
  var logger = Logger();

  @override
  Future<EnderecoModel> getCep(String cep) async {
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
}
