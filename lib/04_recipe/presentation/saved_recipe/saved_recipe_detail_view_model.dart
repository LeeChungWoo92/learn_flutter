import 'package:flutter/material.dart';
import 'package:learn_flutter/01_widget_rule/data/model/ingrident.dart';
import 'package:learn_flutter/04_recipe/core/result.dart';
import 'package:learn_flutter/04_recipe/domain/model/procedure.dart';
import 'package:learn_flutter/04_recipe/domain/repository/ingrident_repository.dart';
import 'package:learn_flutter/04_recipe/domain/repository/procedure_repository.dart';
import 'package:learn_flutter/04_recipe/presentation/saved_recipe/saved_recipe_detail_ui_state.dart';

import '../../domain/use_case/copy_link_use_case.dart';

class SavedRecipeDetailViewModel with ChangeNotifier {
  final IngridentRepository _ingridentRepository;
  final ProcedureRepository _procedureRepository;
  final CopyLinkUseCase _copyLinkUseCase;

  SavedRecipeDetailViewModel(
    this._ingridentRepository,
    this._procedureRepository,
    this._copyLinkUseCase,
  ) {
    getIngridents();
    getProcedures();
  }

  SavedRecipeDetailUiState _state = const SavedRecipeDetailUiState();

  SavedRecipeDetailUiState get state => _state;

  void getIngridents() async {
    _state = state.copyWith(isLoading: true);
    final result = await _ingridentRepository.getIngridents();

    switch (result) {
      case Success<List<Ingrident>>():
        _state = state.copyWith(ingrident: result.data, isLoading: false);
      case Error<List<Ingrident>>():
        _state = state.copyWith(errorMessage: '에러발생', isLoading: false);
    }

    notifyListeners();
  }

  void getProcedures() async {
    _state = state.copyWith(isLoading: true);
    final result = await _procedureRepository.getProcedures();
    switch (result) {
      case Success<List<Procedure>>():
        _state = state.copyWith(procedure: result.data, isLoading: false);
      case Error<List<Procedure>>():
        _state = state.copyWith(errorMessage: '에러발생', isLoading: false);
    }

    notifyListeners();
  }

  void copyLink(String copyRecipeLink) async {
    await _copyLinkUseCase.execute(copyRecipeLink);
  }
}
