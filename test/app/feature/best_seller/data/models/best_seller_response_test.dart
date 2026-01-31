import 'package:flower_app/app/feature/best_seller/data/models/best_seller_dto.dart';
import 'package:flower_app/app/feature/best_seller/data/models/best_seller_response.dart';
import 'package:test/test.dart';

void main() {
  group('BestSellerResponse cases', () {
    test('checking that fromJson working properly', () {
      final json = {
        'message': 'Success',
        'bestSeller': [
          {'_id': 'id1', 'title': 'title1'},
          {'_id': 'id2', 'title': 'title2'},
        ],
      };
    final parsedResponse = BestSellerResponse.fromJson(json);
    expect(parsedResponse.message, equals(json['message']));
    expect(parsedResponse.bestSeller?.length, equals((json['bestSeller']!as List<dynamic>).length));
    expect(parsedResponse.bestSeller![0].id,equals((json['bestSeller']!as List<dynamic>)[0]['_id']));
    expect(parsedResponse.bestSeller![1].id,equals((json['bestSeller']!as List<dynamic>)[1]['_id']));
    expect(parsedResponse.bestSeller![0].title,equals((json['bestSeller']!as List<dynamic>)[0]['title']));
    expect(parsedResponse.bestSeller![1].title,equals((json['bestSeller']!as List<dynamic>)[1]['title']));
  },);
  test('checking that toJson works properly', () {
    final res=BestSellerResponse(
      message: "success",
      bestSeller: [BestSellerDTO(id: 'id1',title: 'title1'),BestSellerDTO(id: 'id2',title: 'title2')]
    );
    final json=res.toJson();
    expect(json['message'], equals(res.message));
    expect((json['bestSeller']!as List<dynamic>).length, equals(res.bestSeller!.length));
  },);
  },);
}