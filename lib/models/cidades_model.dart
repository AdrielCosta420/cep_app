import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CidadesModel {
  final String? nome;
  CidadesModel({
    this.nome,
  });

  factory CidadesModel.fromMap(Map<String, dynamic> map) {
    return CidadesModel(
      nome: map['nome'] != null ? map['nome'] as String : null,
    );
  }

  factory CidadesModel.fromJson(String source) => CidadesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
