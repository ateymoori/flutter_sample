import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../core/bloc/bloc_with_state.dart';
import '../../../core/params/trainers_request.dart';
import '../../../core/resources/data_state.dart';
import '../../../domain/entities/trainer.dart';
import '../../../domain/usecaes/get_trainers_usecase.dart';

part 'remote_trainers_event.dart';
part 'remote_trainers_state.dart';

class RemoteTrainersBloc extends BlocWithState<RemoteTrainersEvent, RemoteTrainersState> {
  final GetTrainersUseCase _getTrainersUseCase;

  RemoteTrainersBloc(this._getTrainersUseCase) : super(const RemoteTrainersLoading());

  final List<Trainer> _trainers = [];


  @override
  Stream<RemoteTrainersState> mapEventToState(RemoteTrainersEvent event) async* {
    if (event is GetTrainers) yield* _getTrainer(event);
  }

  Stream<RemoteTrainersState> _getTrainer(RemoteTrainersEvent event) async* {
    yield* runBlocProcess(() async* {
      final dataState = await _getTrainersUseCase(params: TrainersRequestParams( ));

      if (dataState is DataSuccess && dataState.data.isNotEmpty) {
        final articles = dataState.data;
        _trainers.addAll(articles);

        yield RemoteTrainersDone(_trainers);
      }
      if (dataState is DataFailed) {
        yield RemoteTrainersError(dataState.error);
      }
    });
  }
}
