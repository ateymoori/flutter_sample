import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:lepaya_app/src/data/models/names_response_model.dart';

class Trainer extends Equatable {
  final String email;
  final String picture;
  final String about;
  final String favoriteFruit;
  final NameResponseModel name;
  final bool isAvailable;
  final List<String> tags;

  const Trainer({
    this.email,
    this.picture,
    this.favoriteFruit,
    this.about,
    this.isAvailable,
    this.tags,
    this.name,
  });

  @override
  List<Object> get props {
    return [email, favoriteFruit, picture, about, isAvailable, name, tags];
  }

  @override
  bool get stringify => true;
}
