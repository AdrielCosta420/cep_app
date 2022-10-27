// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'HomeStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$enderecoModelAtom =
      Atom(name: 'HomeStoreBase.enderecoModel', context: context);

  @override
  EnderecoModel? get enderecoModel {
    _$enderecoModelAtom.reportRead();
    return super.enderecoModel;
  }

  @override
  set enderecoModel(EnderecoModel? value) {
    _$enderecoModelAtom.reportWrite(value, super.enderecoModel, () {
      super.enderecoModel = value;
    });
  }

  late final _$ufAtom = Atom(name: 'HomeStoreBase.uf', context: context);

  @override
  String? get uf {
    _$ufAtom.reportRead();
    return super.uf;
  }

  @override
  set uf(String? value) {
    _$ufAtom.reportWrite(value, super.uf, () {
      super.uf = value;
    });
  }

  late final _$cidadeAtom =
      Atom(name: 'HomeStoreBase.cidade', context: context);

  @override
  String? get cidade {
    _$cidadeAtom.reportRead();
    return super.cidade;
  }

  @override
  set cidade(String? value) {
    _$cidadeAtom.reportWrite(value, super.cidade, () {
      super.cidade = value;
    });
  }

  late final _$logradouroAtom =
      Atom(name: 'HomeStoreBase.logradouro', context: context);

  @override
  String? get logradouro {
    _$logradouroAtom.reportRead();
    return super.logradouro;
  }

  @override
  set logradouro(String? value) {
    _$logradouroAtom.reportWrite(value, super.logradouro, () {
      super.logradouro = value;
    });
  }

  late final _$cepAtom = Atom(name: 'HomeStoreBase.cep', context: context);

  @override
  String? get cep {
    _$cepAtom.reportRead();
    return super.cep;
  }

  @override
  set cep(String? value) {
    _$cepAtom.reportWrite(value, super.cep, () {
      super.cep = value;
    });
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  void isLoadingChange() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.isLoadingChange');
    try {
      return super.isLoadingChange();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void enderecoChange(EnderecoModel? value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.enderecoChange');
    try {
      return super.enderecoChange(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void ufChange(String? value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.ufChange');
    try {
      return super.ufChange(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cidadesChange(String? value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.cidadesChange');
    try {
      return super.cidadesChange(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void logradouroChange(String? value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.logradouroChange');
    try {
      return super.logradouroChange(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cepChange(String? value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.cepChange');
    try {
      return super.cepChange(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clean() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.clean');
    try {
      return super.clean();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
enderecoModel: ${enderecoModel},
uf: ${uf},
cidade: ${cidade},
logradouro: ${logradouro},
cep: ${cep}
    ''';
  }
}
