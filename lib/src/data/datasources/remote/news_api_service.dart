import 'package:dio/dio.dart';
import 'package:lepaya_app/src/data/models/trainers_response_model.dart';
import 'package:lepaya_app/src/domain/entities/trainer.dart';
import 'package:retrofit/retrofit.dart';
import '../../../core/utils/constants.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class RestApiService {
  factory RestApiService(Dio dio, {String baseUrl}) = _NewsApiService;

  @GET('/v1/employee/employee')
  Future<HttpResponse<List<TrainerResponseModel>>> getTrainersList( );

}
