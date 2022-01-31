import 'dart:io';

import 'package:dio/dio.dart';
import 'package:lepaya_app/src/domain/entities/trainer.dart';
import 'package:lepaya_app/src/domain/repositories/trainers_repository.dart';
import '../../core/resources/data_state.dart';
import '../datasources/remote/news_api_service.dart';

class TrainersRepositoryImpl implements TrainersRepository {
  final RestApiService _restApiService;

  const TrainersRepositoryImpl(this._restApiService);

  @override
  Future<DataState<List<Trainer>>> getTrainersList() async {
    try {
      final httpResponse = await _restApiService.getTrainersList();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
         // request: httpResponse.response.,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
