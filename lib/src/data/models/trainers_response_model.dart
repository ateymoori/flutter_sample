import 'package:lepaya_app/src/domain/entities/trainer.dart';
import 'names_response_model.dart';


class TrainerResponseModel extends Trainer {
  final String email;
  final NameResponseModel name;
  final String picture;

  TrainerResponseModel({
    this.email,
    this.name,
    this.picture
  });

  factory TrainerResponseModel.fromJson(Map<String, dynamic> json) {
    return TrainerResponseModel(
      picture: json['picture'] as String,
      email: json['email'] as String,
      name:  NameResponseModel.fromJson( json['name'] ) ,
      // articles: List<ArticleModel>.from(
      //   (json['articles'] as List<dynamic>).map(
      //     (e) => ArticleModel.fromJson(e as Map<String, dynamic>),
      //   ),
      // ),
    );
  }

}

