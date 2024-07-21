import 'package:flutter/material.dart';
import 'package:learn_flutter/01_widget_rule/data/model/ingrident.dart';
import 'package:learn_flutter/04_recipe/core/result.dart';
import 'package:learn_flutter/04_recipe/data/repository/ingrident_repository.dart';

class IngridentViewModel with ChangeNotifier {
  final IngridentRepository _ingridentRepository;

  IngridentViewModel(this._ingridentRepository) {
    getIngridents();
  }

  List<Ingrident> _ingrident = [];

  List<Ingrident> get ingrident => List.unmodifiable(_ingrident);

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
        print('_ingrident $ingrident');
      case Error<List<Ingrident>>():
        _errorMessage = '에러발생';
    }

    notifyListeners();
  }
}
