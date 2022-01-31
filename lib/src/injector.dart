import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lepaya_app/src/data/repositories/trainers_repository_impl.dart';
import 'package:lepaya_app/src/domain/repositories/trainers_repository.dart';
import 'package:lepaya_app/src/domain/usecaes/get_trainers_usecase.dart';

import 'core/utils/constants.dart';
import 'data/datasources/remote/news_api_service.dart';
import 'data/repositories/trainers_repository_impl.dart';
import 'domain/repositories/trainers_repository.dart';
import 'domain/usecaes/get_trainers_usecase.dart';
import 'presentation/blocs/remote_trainers/remote_trainers_bloc.dart';


final injector = GetIt.instance;

Future<void> initializeDependencies() async {

  // Dio client
  injector.registerSingleton<Dio>(Dio());

  // Dependencies
  injector.registerSingleton<RestApiService>(RestApiService(injector()));

  // *
  injector.registerSingleton<TrainersRepository>(
    TrainersRepositoryImpl(injector() ),
  );

  // UseCases
  injector.registerSingleton<GetTrainersUseCase>(GetTrainersUseCase(injector()));

  // Blocs
  injector.registerFactory<RemoteTrainersBloc>(
    () => RemoteTrainersBloc(injector()),
  );


}
