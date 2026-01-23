import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../config/local_storage_processes/domain/use_case/clear_token_use_case.dart';
import '../../../config/local_storage_processes/domain/use_case/get_remember_me_use_case.dart';

@injectable
class StartViewModel extends ChangeNotifier {
  final ClearTokenUseCase _clearTokenUseCase;
  final GetRememberMeUseCase _getRememberMeUseCase;

  StartViewModel(this._clearTokenUseCase, this._getRememberMeUseCase);

  Future<void> clearToken() async {
    final result = await _getRememberMeUseCase.invoke();
    switch (result) {
      case SuccessResponse<bool>():
        if (!result.data) {
          await _clearTokenUseCase.invoke();
        }
        notifyListeners();
      case ErrorResponse<bool>():
        break;
    }
  }
}
