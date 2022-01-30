import 'package:lepaya_app/src/domain/entities/trainer.dart';

import 'article_model.dart';

class TrainerResponseModel extends Trainer {
  final String email;
  final String picture;

  TrainerResponseModel({
    this.email,
    this.picture
  });

  factory TrainerResponseModel.fromJson(Map<String, dynamic> json) {

    return TrainerResponseModel(
      picture: json['email'] as String,
      email: json['email'] as String,
      // totalResults: json['totalResults'] as int,
      // articles: List<ArticleModel>.from(
      //   (json['articles'] as List<dynamic>).map(
      //     (e) => ArticleModel.fromJson(e as Map<String, dynamic>),
      //   ),
      // ),
    );
  }
}
