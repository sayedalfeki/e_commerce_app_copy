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

import '../../feature/home/presentation/view_model/home_view_model.dart'
    as _i60;
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
    gh.singleton<_i361.Dio>(() => diAuthModel.dio);
    gh.factory<_i544.SignupApiClient>(
      () => _i544.SignupApiClient.new(gh<_i361.Dio>()),
    );
    gh.factory<_i656.SignupRemoteDataSourceContract>(
      () => _i12.SignupRemoteDataSourceImpl(gh<_i544.SignupApiClient>()),
    );
    gh.factory<_i504.SignupRepoContract>(
      () => _i131.SignupRepoImpl(gh<_i656.SignupRemoteDataSourceContract>()),
    );
    gh.factory<_i408.SignupUsecase>(
      () => _i408.SignupUsecase(gh<_i504.SignupRepoContract>()),
    );
    gh.factory<_i697.SignupViewModel>(
      () => _i697.SignupViewModel(gh<_i408.SignupUsecase>()),
    );
    return this;
  }
}

class _$DiAuthModel extends _i347.DiAuthModel {}
