import 'package:equatable/equatable.dart';
import 'package:lepaya_app/src/data/models/names_response_model.dart';

class Trainer extends Equatable {
  final String email;
  final String picture;
  final NameResponseModel name;
  const Trainer({
    this.email,
    this.picture,
    this.name,
  });

  @override
  List<Object> get props {
    return [
      email,
      picture,
      name
    ];
  }

  @override
  bool get stringify => true;
}
