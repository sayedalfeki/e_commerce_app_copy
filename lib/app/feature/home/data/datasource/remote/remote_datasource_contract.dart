import 'package:flower_app/app/config/base_response/base_response.dart';

abstract class RemoteDatasourceContract {
  Future<BaseResponse> login();
}
