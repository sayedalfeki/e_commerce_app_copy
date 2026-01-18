// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

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

import '../../feature/auth/api/api_auth/api_auth.dart' as _i411;
import '../../feature/auth/api/datasource/remote/remote_datasource_impl.dart'
    as _i875;
import '../../feature/auth/data/datasource/remote/remote_datasource_contract.dart'
    as _i52;
import '../../feature/auth/data/repo/auth_repo_impl.dart' as _i945;
import '../../feature/auth/domain/repo/auth_repo_contract.dart' as _i158;
import '../../feature/auth/domain/use_case/get_auth_use_case.dart' as _i289;
import '../../feature/auth/presentation/view_model/login_view_model.dart'
    as _i834;
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
import '../../feature/home/presentation/view_model/home_view_model.dart'
    as _i60;
import '../../feature/home/presentation/views/tabs/home_tab/api/api_client/home_tab_api_client.dart'
    as _i423;
import '../../feature/home/presentation/views/tabs/home_tab/api/datasources/remote/home_tab_remote_data_source_impl.dart'
    as _i215;
import '../../feature/home/presentation/views/tabs/home_tab/data/datasources/remote/home_tab_remote_data_source_contract.dart'
    as _i1047;
import '../../feature/home/presentation/views/tabs/home_tab/data/repos/home_tab_repo_impl.dart'
    as _i647;
import '../../feature/home/presentation/views/tabs/home_tab/domain/repos/home_tab_repo_contract.dart'
    as _i275;
import '../../feature/home/presentation/views/tabs/home_tab/domain/use_cases/home_tab_use_case.dart'
    as _i709;
import '../../feature/home/presentation/views/tabs/home_tab/presentation/view_model/home_tab_view_model.dart'
    as _i927;
import '../../feature/signup/api/api_client/api_client.dart' as _i544;
import '../../feature/signup/api/data_source_impls/signup_remote_data_source_impl.dart'
    as _i12;
import '../../feature/signup/data/data_sources/signup_remote_data_source_contract.dart'
    as _i656;
import '../../feature/signup/data/repo/signup_repo_impl.dart' as _i131;
import '../../feature/signup/domain/repo/signup_repo_contract.dart' as _i504;
import '../../feature/signup/domain/use_cases/signup_usecase.dart' as _i408;
import '../../feature/signup/presentation/vie_model/signup_view_model.dart'
    as _i697;
import '../di_model/di_auth_model.dart' as _i347;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final diAuthModel = _$DiAuthModel();
    gh.factory<_i60.HomeViewModel>(() => _i60.HomeViewModel());
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
    gh.factory<_i411.AuthApiClient>(() => _i411.AuthApiClient(gh<_i361.Dio>()));
    gh.factory<_i423.HomeTabApiClient>(
      () => _i423.HomeTabApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i544.SignupApiClient>(
      () => _i544.SignupApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i1047.HomeTabRemoteDataSourceContract>(
      () => _i215.HomeTabRemoteDataSourceImpl(gh<_i423.HomeTabApiClient>()),
    );
    gh.factory<_i466.ForgetPasswordDataSourceContract>(
      () => _i313.ForgetPasswordRemoteDataSourceImpl(
        gh<_i532.ForgetPasswordApiClient>(),
      ),
    );
    gh.factory<_i52.AuthRemoteDatasourceContract>(
      () => _i875.AuthRemoteDatasourceImpl(gh<_i411.AuthApiClient>()),
    );
    gh.factory<_i276.ForgetPasswordRepoContract>(
      () => _i705.ForgetPasswordRepoImpl(
        gh<_i466.ForgetPasswordDataSourceContract>(),
      ),
    );
    gh.factory<_i275.HomeTabRepoContract>(
      () => _i647.HomeTabRepoImpl(gh<_i1047.HomeTabRemoteDataSourceContract>()),
    );
    gh.factory<_i929.ForgetPasswordUseCase>(
      () => _i929.ForgetPasswordUseCase(gh<_i276.ForgetPasswordRepoContract>()),
    );
    gh.factory<_i762.ResetPasswordUseCase>(
      () => _i762.ResetPasswordUseCase(gh<_i276.ForgetPasswordRepoContract>()),
    );
    gh.factory<_i639.VerifyOtpUseCase>(
      () => _i639.VerifyOtpUseCase(gh<_i276.ForgetPasswordRepoContract>()),
    );
    gh.factory<_i656.SignupRemoteDataSourceContract>(
      () => _i12.SignupRemoteDataSourceImpl(gh<_i544.SignupApiClient>()),
    );
    gh.factory<_i94.ResetPasswordViewModel>(
      () => _i94.ResetPasswordViewModel(gh<_i762.ResetPasswordUseCase>()),
    );
    gh.factory<_i504.SignupRepoContract>(
      () => _i131.SignupRepoImpl(gh<_i656.SignupRemoteDataSourceContract>()),
    );
    gh.factory<_i709.HomeTabUseCase>(
      () => _i709.HomeTabUseCase(gh<_i275.HomeTabRepoContract>()),
    );
    gh.factory<_i408.SignupUsecase>(
      () => _i408.SignupUsecase(gh<_i504.SignupRepoContract>()),
    );
    gh.factory<_i343.VerifyOtpViewModel>(
      () => _i343.VerifyOtpViewModel(gh<_i639.VerifyOtpUseCase>()),
    );
    gh.factory<_i158.AuthRepoContract>(
      () => _i945.AuthRepoImpl(gh<_i52.AuthRemoteDatasourceContract>()),
    );
    gh.factory<_i540.ForgetPasswordViewModel>(
      () => _i540.ForgetPasswordViewModel(gh<_i929.ForgetPasswordUseCase>()),
    );
    gh.factory<_i697.SignupViewModel>(
      () => _i697.SignupViewModel(gh<_i408.SignupUsecase>()),
    );
    gh.factory<_i289.GetAuthUseCase>(
      () => _i289.GetAuthUseCase(gh<_i158.AuthRepoContract>()),
    );
    gh.factory<_i927.HomeTabViewModel>(
      () => _i927.HomeTabViewModel(gh<_i709.HomeTabUseCase>()),
    );
    gh.factory<_i834.LoginViewModel>(
      () => _i834.LoginViewModel(gh<_i289.GetAuthUseCase>()),
    );
    return this;
  }
}

class _$DiAuthModel extends _i347.DiAuthModel {}
