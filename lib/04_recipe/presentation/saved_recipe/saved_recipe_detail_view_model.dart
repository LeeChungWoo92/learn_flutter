import 'package:flutter/material.dart';
import 'package:learn_flutter/01_widget_rule/data/model/ingrident.dart';
import 'package:learn_flutter/04_recipe/core/result.dart';
import 'package:learn_flutter/04_recipe/data/model/procedure.dart';
import 'package:learn_flutter/04_recipe/data/repository/ingrident_repository.dart';
import 'package:learn_flutter/04_recipe/data/repository/procedure_repository.dart';

class SavedRecipeDetailViewModel with ChangeNotifier {
  final IngridentRepository _ingridentRepository;
  final ProcedureRepository _procedureRepository;

  SavedRecipeDetailViewModel(
    this._ingridentRepository,
    this._procedureRepository,
  ) {
    getIngridents();
    getProcedures();
  }

  List<Ingrident> _ingrident = [];

  List<Ingrident> get ingrident => List.unmodifiable(_ingrident);

  List<Procedure> _procedure = [];

  List<Procedure> get procedure => List.unmodifiable(_procedure);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  void getIngridents() async {
    _isLoading = true;
    final data = await _ingridentRepository.getIngridents();
    _isLoading = false;
    switch (data) {
      case Success<List<Ingrident>>():
        _ingrident = data.data;
      case Error<List<Ingrident>>():
        _errorMessage = '에러발생';
    }

    notifyListeners();
  }

  void getProcedures() async {
    _isLoading = true;
    final data = await _procedureRepository.getProcedures();
    _isLoading = false;
    switch (data) {
      case Success<List<Procedure>>():
        _procedure = data.data;
      case Error<List<Procedure>>():
        _errorMessage = '에러발생';
    }

    notifyListeners();
  }
}
