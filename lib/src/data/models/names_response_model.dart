import 'package:lepaya_app/src/domain/entities/trainer.dart';

class NameResponseModel {
  final String first;
  final String last;

  NameResponseModel({this.first, this.last});

  factory NameResponseModel.fromJson(Map<String, dynamic> json) {
    return NameResponseModel(
      first: json['first'] as String,
      last: json['last'] as String,
    );
  }
}
