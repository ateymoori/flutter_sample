// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _NewsApiService implements RestApiService {
  _NewsApiService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    //baseUrl ??= 'https://newsapi.org/v2';
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
    final _result = await _dio.request<Map<String, dynamic>>('',
        queryParameters: null,
        options: RequestOptions(
            method: 'GET',
            baseUrl:
                "/v1/employee/employee"));

    final trainers = List<TrainerResponseModel>.from(
      (_result.data as List<dynamic>).map(
        (e) => TrainerResponseModel.fromJson(e as Map<String, dynamic>),
      ),
    );

    final httpResponse = HttpResponse(trainers, _result);
    return httpResponse;
  }
}
