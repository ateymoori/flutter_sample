import 'package:equatable/equatable.dart';

class Trainer extends Equatable {
  final String email;
  const Trainer({
    this.email
  });

  @override
  List<Object> get props {
    return [
      email
    ];
  }

  @override
  bool get stringify => true;
}
