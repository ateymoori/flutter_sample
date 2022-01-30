import 'package:dio/dio.dart';
import 'package:lepaya_app/src/data/models/trainers_response_model.dart';
import 'package:lepaya_app/src/domain/entities/trainer.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/utils/constants.dart';
import '../../models/breaking_news_response_model.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class RestApiService {
  factory RestApiService(Dio dio, {String baseUrl}) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<BreakingNewsResponseModel>> getBreakingNewsArticles({
    @Query("apiKey") String apiKey,
    @Query("country") String country,
    @Query("category") String category,
    @Query("page") int page,
    @Query("pageSize") int pageSize,
  });

  @GET('/v1/employee/employee')
  Future<HttpResponse<List<TrainerResponseModel>>> getTrainersList( );




}
