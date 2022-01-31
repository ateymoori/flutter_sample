part of 'remote_trainers_bloc.dart';

abstract class RemoteTrainersState extends Equatable {
  final List<Trainer> trainers;

  final DioError error;

  const RemoteTrainersState({this.trainers, this.error});

  @override
  List<Object> get props => [trainers,  error];
}

class RemoteTrainersLoading extends RemoteTrainersState {
  const RemoteTrainersLoading();
}

class RemoteTrainersDone extends RemoteTrainersState {
  const RemoteTrainersDone(List<Trainer> trainer, {bool noMoreData}) : super(trainers: trainer );
}

class RemoteTrainersError extends RemoteTrainersState {
  const RemoteTrainersError(DioError error) : super(error: error);
}
