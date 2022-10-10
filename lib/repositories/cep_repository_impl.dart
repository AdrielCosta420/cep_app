import 'dart:developer';

import 'package:cep_app/models/endereco_model.dart';
import 'package:dio/dio.dart';

import 'cep_repository.dart';

class CepRepositoryImpl implements CepRepository {
  @override
  Future<EnderecoModel> getCep(String cep) async {
    try {
      final response = await Dio().get('https://viacep.com.br/ws/$cep/json/');
      EnderecoModel.fromMap(response.data);
    } on DioError catch (e) {
      log('Erro ao buscar CEP', error: e);
    }
    throw Exception('Erro ao buscar CEP');
  }
}