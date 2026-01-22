import 'package:flower_app/app/core/keys/app_keys.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class LocalStorageProcesses {
  static final FlutterSecureStorage storage = const FlutterSecureStorage();

  static void writeTokin(String token){
    storage.write(key: AppKeys.tokenKey, value: token);
  }

  static Future<String?> readTokin()async{
    String? token = await storage.read(key: AppKeys.tokenKey);
    return token;
  }
}