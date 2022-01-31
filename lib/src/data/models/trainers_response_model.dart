import 'package:lepaya_app/src/domain/entities/trainer.dart';
import 'names_response_model.dart';

class TrainerResponseModel extends Trainer {
  final String email;
  final NameResponseModel name;
  final String picture;
  final String favoriteFruit;
  final String about;
  final bool isAvailable;
  final List<String> tags;

  TrainerResponseModel({
    this.email,
    this.name,
    this.picture,
    this.favoriteFruit,
    this.about,
    this.tags,
    this.isAvailable
  });

  factory TrainerResponseModel.fromJson(Map<String, dynamic> json) {
    List<String> tags = List.from(json['tags']) ;

    return TrainerResponseModel(
      picture: json['picture'] as String,
      email: json['email'] as String,
      name:  NameResponseModel.fromJson( json['name'] ) ,
      favoriteFruit: json['favoriteFruit'] as String,
      about: json['about'] as String,
      isAvailable: json['isAvailable'] as bool,
      tags: tags
    );
  }

}

