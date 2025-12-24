// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../feature/forget_password/api/forget_password_api_client.dart'
    as _i532;
import '../../feature/forget_password/api/forget_password_remote_data_source_impl.dart'
    as _i313;
import '../../feature/forget_password/data/forget_password_data_source_contract.dart'
    as _i466;
import '../../feature/forget_password/data/forget_password_repo_impl.dart'
    as _i705;
import '../../feature/forget_password/domain/forget_password_repo_contract.dart'
    as _i276;
import '../../feature/forget_password/domain/use_case/forget_password_use_case.dart'
    as _i929;
import '../../feature/forget_password/domain/use_case/reset_password_use_case.dart'
    as _i762;
import '../../feature/forget_password/domain/use_case/verify_otp_use_case.dart'
    as _i639;
import '../../feature/forget_password/presentation/forget_password/view_model/forget_password_view_model.dart'
    as _i540;
import '../../feature/forget_password/presentation/reset_password/view_model/reset_password_view_model.dart'
    as _i94;
import '../../feature/forget_password/presentation/verify_otp/view_model/verify_otp_view_model.dart'
    as _i343;
import '../di_model/di_auth_model.dart' as _i347;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final diAuthModel = _$DiAuthModel();
    gh.lazySingleton<_i361.BaseOptions>(() => diAuthModel.provideBaseOptions());
    gh.lazySingleton<_i528.PrettyDioLogger>(
      () => diAuthModel.providePrettyDioLogger(),
    );
    gh.lazySingleton<_i361.Dio>(
      () => diAuthModel.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.lazySingleton<_i532.ForgetPasswordApiClient>(
      () => diAuthModel.provideForgetPasswordApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i466.ForgetPasswordDataSourceContract>(
      () => _i313.ForgetPasswordRemoteDataSourceImpl(
        gh<_i532.ForgetPasswordApiClient>(),
      ),
    );
    gh.factory<_i276.ForgetPasswordRepoContract>(
      () => _i705.ForgetPasswordRepoImpl(
        gh<_i466.ForgetPasswordDataSourceContract>(),
      ),
    );
    gh.factory<_i762.ResetPasswordUseCase>(
      () => _i762.ResetPasswordUseCase(gh<_i276.ForgetPasswordRepoContract>()),
    );
    gh.factory<_i639.VerifyOtpUseCase>(
      () => _i639.VerifyOtpUseCase(gh<_i276.ForgetPasswordRepoContract>()),
    );
    gh.factory<_i929.ForgetPasswordUseCase>(
      () => _i929.ForgetPasswordUseCase(gh<_i276.ForgetPasswordRepoContract>()),
    );
    gh.factory<_i94.ResetPasswordViewModel>(
      () => _i94.ResetPasswordViewModel(gh<_i762.ResetPasswordUseCase>()),
    );
    gh.factory<_i343.VerifyOtpViewModel>(
      () => _i343.VerifyOtpViewModel(gh<_i639.VerifyOtpUseCase>()),
    );
    gh.factory<_i540.ForgetPasswordViewModel>(
      () => _i540.ForgetPasswordViewModel(gh<_i929.ForgetPasswordUseCase>()),
    );
    return this;
  }
}

class _$DiAuthModel extends _i347.DiAuthModel {}
