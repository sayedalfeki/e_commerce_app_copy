import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/occasion/data/models/occasion_model.dart';
import 'package:flower_app/app/feature/occasion/domain/use_cases/get_all_occasions_use_case.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class OccasionViewModel extends ChangeNotifier {
  final GetAllOccasionsUseCase _getAllOccasionsUseCase;

  OccasionViewModel(this._getAllOccasionsUseCase);

  List<OccasionModel> _occasions = [];
  List<OccasionModel> get occasions => _occasions;

  int _selectedTabIndex = 0;
  int get selectedTabIndex => _selectedTabIndex;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void selectTab(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  Future<void> getAllOccasions() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final response = await _getAllOccasionsUseCase();

    switch (response) {
      case SuccessResponse<List<OccasionModel>>():
        _occasions = response.data;
        _errorMessage = null;
        break;
      case ErrorResponse<List<OccasionModel>>():
        _errorMessage = response.error.toString();
        break;
    }

    _isLoading = false;
    notifyListeners();
  }

  OccasionModel? get selectedOccasion {
    if (_occasions.isEmpty || _selectedTabIndex >= _occasions.length) {
      return null;
    }
    return _occasions[_selectedTabIndex];
  }
}
