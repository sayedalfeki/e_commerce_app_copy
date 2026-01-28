import 'dart:convert';

import 'package:flower_app/app/config/api_utils/api_utils.dart';
import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/terms_and_conditions/data/data_sources/local/local_terms_data_source_contract.dart';
import 'package:flower_app/app/feature/terms_and_conditions/data/models/terms_content.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: LocalTermsDataSourceContract)
class LocalTermsDataSourceImpl implements LocalTermsDataSourceContract{
  @override
  Future<BaseResponse<TermsContent>> getTermsAndConditions() async{
    return executeApi(() async{
      final jsonString=await rootBundle.loadString('assets/files/Flowery Terms and Conditions JSON with Arabic and English.json');
      final jsonMap=jsonDecode(jsonString) as Map<String,dynamic>;
      return TermsContent.fromJson(jsonMap);
    },);
  }
}