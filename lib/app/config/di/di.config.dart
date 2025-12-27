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
import '../di_model/di_auth_model.dart' as _i347;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final diAuthModel = _$DiAuthModel();
    gh.singleton<_i361.Dio>(() => diAuthModel.dio);
    gh.factory<_i411.AuthApiClient>(() => _i411.AuthApiClient(gh<_i361.Dio>()));
    gh.factory<_i52.AuthRemoteDatasourceContract>(
      () => _i875.AuthRemoteDatasourceImpl(gh<_i411.AuthApiClient>()),
    );
    gh.factory<_i158.AuthRepoContract>(
      () => _i945.AuthRepoImpl(gh<_i52.AuthRemoteDatasourceContract>()),
    );
    gh.factory<_i289.GetAuthUseCase>(
      () => _i289.GetAuthUseCase(gh<_i158.AuthRepoContract>()),
    );
    gh.factory<_i834.LoginViewModel>(
      () => _i834.LoginViewModel(gh<_i289.GetAuthUseCase>()),
    );
    return this;
  }
}

class _$DiAuthModel extends _i347.DiAuthModel {}
