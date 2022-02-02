import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:lepaya_app/src/data/datasources/remote/news_api_service.dart';
import 'package:lepaya_app/src/data/models/trainers_response_model.dart';

const successMessage = '''
[
    {
        "name": {
            "first": "Bertie",
            "last": "Williamson"
        },
        "isAvailable": true,
        "picture": "https://upload.wikimedia.org/wikipedia/commons/f/f7/Henry_Winkler_Fonzie_1977.JPG",
        "email": "bertie.williamson@company.co.uk",
        "about": "test test",
        "tags": [
            "culpa",
            "adipisicing"
        ],
        "favoriteFruit": "banana"
    }
]
''';
const errorMessage = {'message': 'error'};
const testPath = '/v1/employee/employee';
const header = {'Content-Type': 'application/json'};

void main() {
  final dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);
  var baseUrl;

  setUp(() {
    dio.httpClientAdapter = dioAdapter;
    baseUrl = 'https://5fb52c64e473ab0016a179a0.mockapi.io/api';
  });

  group('- ApiService class and Json parser methods test', () {
      test('- Get Method Success test', () async {
        dioAdapter.onGet(
          '$baseUrl$testPath',
          (request) {
            return request.reply(200, jsonDecode(successMessage));
          },
          data: null,
          queryParameters: {},
          headers: {},
        );

        final service = RestApiService(dio);
        final response = await service.getTrainersList();

        expect(
            response.data[0].email,
            (jsonDecode(successMessage) as List)
                .map((x) => TrainerResponseModel.fromJson(x))
                .toList()[0]
                .email);


      });
    });

}
