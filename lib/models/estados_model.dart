import 'dart:convert';

class EstadosModel {
  final String? sigla;
  EstadosModel({
    this.sigla,
  });

  factory EstadosModel.fromMap(Map<String, dynamic> map) {
    return EstadosModel(
      sigla: map['sigla'] != null ? map['sigla'] as String : null,
    );
  }

  factory EstadosModel.fromJson(String source) => EstadosModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

