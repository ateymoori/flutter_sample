part of 'remote_trainers_bloc.dart';

abstract class RemoteTrainersEvent extends Equatable {
  const RemoteTrainersEvent();

  @override
  List<Object> get props => [];
}

class GetTrainers extends RemoteTrainersEvent {
  const GetTrainers();
}
