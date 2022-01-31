part of 'news_api_service.dart';
class _NewsApiService implements RestApiService {
  _NewsApiService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://5fb52c64e473ab0016a179a0.mockapi.io/api';
  }

  final Dio _dio;
  String baseUrl;

  @override
  Future<HttpResponse<BreakingNewsResponseModel>> getBreakingNewsArticles(
      {apiKey, country, category, page, pageSize}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'apiKey': apiKey,
      r'country': country,
      r'category': category,
      r'page': page,
      r'pageSize': pageSize
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/top-headlines',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BreakingNewsResponseModel.fromJson(_result.data);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

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
