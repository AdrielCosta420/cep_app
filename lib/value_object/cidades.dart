// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cep_app/value_object/value_object.dart';

class Cidades implements ValueObject {
  String cidades;

  @override
  String? validator;
  Cidades({
    required this.cidades,
    this.validator,
  });
}
