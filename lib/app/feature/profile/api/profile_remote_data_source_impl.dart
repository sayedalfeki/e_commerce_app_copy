import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:injectable/injectable.dart';

import '../../../config/api_utils/api_utils.dart';
import '../data/model/change_password_response.dart';
import '../data/profile_data_source_contract.dart';
import '../domain/request/change_password_request.dart';
import 'profile_api_client.dart';

@Injectable(as: ProfileDataSourceContract)
class ProfileRemoteDataSourceImpl extends ProfileDataSourceContract {
  final ProfileApiClient _profileApiClient;

  ProfileRemoteDataSourceImpl(this._profileApiClient);

  @override
  Future<BaseResponse<ChangePasswordResponse>> changePassword(
    ChangePasswordRequest request,
  ) {
    return executeApi(() => _profileApiClient.changePassword(request));
  }
}
