import 'package:equatable/equatable.dart';

class Trainer extends Equatable {
  final String email;
  final String picture;
  const Trainer({
    this.email,
    this.picture,
  });

  @override
  List<Object> get props {
    return [
      email,
      picture
    ];
  }

  @override
  bool get stringify => true;
}
