part of 'news_api_service.dart';
class _NewsApiService implements RestApiService {
  _NewsApiService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://5fb52c64e473ab0016a179a0.mockapi.io/api';
  }

  final Dio _dio;
  String baseUrl;

  @override
  Future<HttpResponse<List<TrainerResponseModel>>> getTrainersList() async {
    Response response = await _dio.get(
        "/v1/employee/employee",
        options: RequestOptions(baseUrl: baseUrl));
    final trainers = (response.data as List)
        .map((x) => TrainerResponseModel.fromJson(x))
        .toList();

    final httpResponse = HttpResponse(trainers, response);
    return httpResponse;
  }
}
