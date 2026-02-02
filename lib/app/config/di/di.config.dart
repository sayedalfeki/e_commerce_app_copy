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
import '../../feature/occasion/data/api_client/occasion_api_client.dart'
    as _i1069;
import '../../feature/occasion/data/api_client/occasion_api_module.dart'
    as _i359;
import '../../feature/occasion/data/api_client/product_api_client.dart'
    as _i392;
import '../../feature/occasion/data/data_sources/occasion_remote_data_source.dart'
    as _i387;
import '../../feature/occasion/data/data_sources/product_remote_data_source.dart'
    as _i50;
import '../../feature/occasion/data/repositories/occasion_repository_impl.dart'
    as _i979;
import '../../feature/occasion/data/repositories/product_repository_impl.dart'
    as _i229;
import '../../feature/occasion/domain/repositories/occasion_repository.dart'
    as _i252;
import '../../feature/occasion/domain/repositories/product_repository.dart'
    as _i629;
import '../../feature/occasion/domain/use_cases/get_all_occasions_use_case.dart'
    as _i112;
import '../../feature/occasion/domain/use_cases/get_occasion_by_id_use_case.dart'
    as _i34;
import '../../feature/occasion/domain/use_cases/get_products_by_occasion_use_case.dart'
    as _i121;
import '../../feature/occasion/presentation/view_model/occasion_products_view_model.dart'
    as _i477;
import '../../feature/occasion/presentation/view_model/occasion_view_model.dart'
    as _i146;
import '../../feature/product_details/api/api_client/api_client.dart' as _i340;
import '../../feature/product_details/api/data_source_impls/product_details_remote_data_source_impl.dart'
    as _i312;
import '../../feature/product_details/data/data_sources/product_details_remote_data_source_contract.dart'
    as _i895;
import '../../feature/product_details/data/repo/product_details_repo_impl.dart'
    as _i243;
import '../../feature/product_details/domain/repo/product_details_repo_contract.dart'
    as _i457;
import '../../feature/product_details/domain/use_cases/get_product_details_usecase.dart'
    as _i214;
import '../../feature/product_details/presentation/view_model/product_details_view_model.dart'
    as _i1018;
import '../../feature/profile/api/profile_api_client.dart' as _i865;
import '../../feature/profile/api/profile_remote_data_source_impl.dart'
    as _i986;
import '../../feature/profile/data/profile_data_source_contract.dart' as _i985;
import '../../feature/profile/data/profile_repo_impl.dart' as _i699;
import '../../feature/profile/domain/profile_repo_contract.dart' as _i130;
import '../../feature/profile/domain/use_case/change_password_use_case.dart'
    as _i1053;
import '../../feature/profile/domain/use_case/get_user_data_use_case.dart'
    as _i918;
import '../../feature/profile/domain/use_case/update_profile_use_case.dart'
    as _i340;
import '../../feature/profile/domain/use_case/upload_profile_photo_use_case.dart'
    as _i16;
import '../../feature/profile/presentation/profile/view_model/profile_view_model.dart'
    as _i978;
import '../../feature/profile/presentation/reset_password/view_model/change_password_view_model.dart'
    as _i300;
import '../../feature/profile/presentation/update_profile/view_model/update_profile_view_model.dart'
    as _i389;
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
    final occasionApiModule = _$OccasionApiModule();
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
    gh.lazySingleton<_i865.ProfileApiClient>(
      () => diAuthModel.provideProfileApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i411.AuthApiClient>(() => _i411.AuthApiClient(gh<_i361.Dio>()));
    gh.factory<_i423.HomeTabApiClient>(
      () => _i423.HomeTabApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i1069.OccasionApiClient>(
      () => occasionApiModule.occasionApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i392.ProductApiClient>(
      () => occasionApiModule.productApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i340.ProductDetailsApiClient>(
      () => _i340.ProductDetailsApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i544.SignupApiClient>(
      () => _i544.SignupApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i387.OccasionRemoteDataSource>(
      () => _i387.OccasionRemoteDataSourceImpl(gh<_i1069.OccasionApiClient>()),
    );
    gh.factory<_i252.OccasionRepository>(
      () => _i979.OccasionRepositoryImpl(gh<_i387.OccasionRemoteDataSource>()),
    );
    gh.factory<_i112.GetAllOccasionsUseCase>(
      () => _i112.GetAllOccasionsUseCase(gh<_i252.OccasionRepository>()),
    );
    gh.factory<_i34.GetOccasionByIdUseCase>(
      () => _i34.GetOccasionByIdUseCase(gh<_i252.OccasionRepository>()),
    );
    gh.factory<_i1047.HomeTabRemoteDataSourceContract>(
      () => _i215.HomeTabRemoteDataSourceImpl(gh<_i423.HomeTabApiClient>()),
    );
    gh.factory<_i50.ProductRemoteDataSource>(
      () => _i50.ProductRemoteDataSourceImpl(gh<_i392.ProductApiClient>()),
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
    gh.factory<_i985.ProfileDataSourceContract>(
      () => _i986.ProfileRemoteDataSourceImpl(gh<_i865.ProfileApiClient>()),
    );
    gh.factory<_i146.OccasionViewModel>(
      () => _i146.OccasionViewModel(gh<_i112.GetAllOccasionsUseCase>()),
    );
    gh.factory<_i895.ProductDetailsRemoteDataSourceContract>(
      () => _i312.ProductDetailsRemoteDataSourceImpl(
        gh<_i340.ProductDetailsApiClient>(),
      ),
    );
    gh.factory<_i656.SignupRemoteDataSourceContract>(
      () => _i12.SignupRemoteDataSourceImpl(gh<_i544.SignupApiClient>()),
    );
    gh.factory<_i457.ProductDetailsRepoContract>(
      () => _i243.ProductDetailsRepoImpl(
        gh<_i895.ProductDetailsRemoteDataSourceContract>(),
      ),
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
    gh.factory<_i130.ProfileRepoContract>(
      () => _i699.ProfileRepoImpl(gh<_i985.ProfileDataSourceContract>()),
    );
    gh.factory<_i343.VerifyOtpViewModel>(
      () => _i343.VerifyOtpViewModel(gh<_i639.VerifyOtpUseCase>()),
    );
    gh.factory<_i629.ProductRepository>(
      () => _i229.ProductRepositoryImpl(gh<_i50.ProductRemoteDataSource>()),
    );
    gh.factory<_i121.GetProductsByOccasionUseCase>(
      () => _i121.GetProductsByOccasionUseCase(gh<_i629.ProductRepository>()),
    );
    gh.factory<_i477.OccasionProductsViewModel>(
      () => _i477.OccasionProductsViewModel(
        gh<_i121.GetProductsByOccasionUseCase>(),
      ),
    );
    gh.factory<_i158.AuthRepoContract>(
      () => _i945.AuthRepoImpl(gh<_i52.AuthRemoteDatasourceContract>()),
    );
    gh.factory<_i540.ForgetPasswordViewModel>(
      () => _i540.ForgetPasswordViewModel(gh<_i929.ForgetPasswordUseCase>()),
    );
    gh.factory<_i1053.ChangePasswordUseCase>(
      () => _i1053.ChangePasswordUseCase(gh<_i130.ProfileRepoContract>()),
    );
    gh.factory<_i918.GetUserDataUseCase>(
      () => _i918.GetUserDataUseCase(gh<_i130.ProfileRepoContract>()),
    );
    gh.factory<_i340.UpdateProfileUseCase>(
      () => _i340.UpdateProfileUseCase(gh<_i130.ProfileRepoContract>()),
    );
    gh.factory<_i16.UploadProfilePhotoUseCase>(
      () => _i16.UploadProfilePhotoUseCase(gh<_i130.ProfileRepoContract>()),
    );
    gh.factory<_i697.SignupViewModel>(
      () => _i697.SignupViewModel(gh<_i408.SignupUsecase>()),
    );
    gh.factory<_i214.GetProductDetailsUsecase>(
      () => _i214.GetProductDetailsUsecase(
        gh<_i457.ProductDetailsRepoContract>(),
      ),
    );
    gh.factory<_i289.GetAuthUseCase>(
      () => _i289.GetAuthUseCase(gh<_i158.AuthRepoContract>()),
    );
    gh.factory<_i389.UpdateProfileViewModel>(
      () => _i389.UpdateProfileViewModel(
        gh<_i340.UpdateProfileUseCase>(),
        gh<_i16.UploadProfilePhotoUseCase>(),
      ),
    );
    gh.factory<_i927.HomeTabViewModel>(
      () => _i927.HomeTabViewModel(gh<_i709.HomeTabUseCase>()),
    );
    gh.factory<_i300.ChangePasswordViewModel>(
      () => _i300.ChangePasswordViewModel(gh<_i1053.ChangePasswordUseCase>()),
    );
    gh.factory<_i978.ProfileViewModel>(
      () => _i978.ProfileViewModel(gh<_i918.GetUserDataUseCase>()),
    );
    gh.factory<_i1018.ProductDetailsViewModel>(
      () =>
          _i1018.ProductDetailsViewModel(gh<_i214.GetProductDetailsUsecase>()),
    );
    gh.factory<_i834.LoginViewModel>(
      () => _i834.LoginViewModel(gh<_i289.GetAuthUseCase>()),
    );
    return this;
  }
}

class _$DiAuthModel extends _i347.DiAuthModel {}

class _$OccasionApiModule extends _i359.OccasionApiModule {}
