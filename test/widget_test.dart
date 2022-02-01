import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:image_test_utils/image_test_utils.dart';

import 'package:lepaya_app/main.dart';
import 'package:lepaya_app/src/data/models/names_response_model.dart';
import 'package:lepaya_app/src/domain/entities/trainer.dart';
import 'package:lepaya_app/src/injector.dart';
import 'package:lepaya_app/src/presentation/blocs/remote_trainers/remote_trainers_bloc.dart';
import 'package:lepaya_app/src/presentation/views/dashboard_view.dart';
import 'package:lepaya_app/src/presentation/views/trainer_details_view.dart';
import 'package:lepaya_app/src/presentation/widgets/trainer_widget.dart';

void main() {
  Trainer trainer = Trainer(
      isAvailable: true,
      email: "test@test.com",
      tags: ["tag1", "tag2"],
      favoriteFruit: "banana",
      picture:
          "https://upload.wikimedia.org/wikipedia/commons/f/f7/Henry_Winkler_Fonzie_1977.JPG",
      name: NameResponseModel(first: "AmirHossein", last: "Teymoori"));

  testWidgets('home page is created', (WidgetTester tester) async {
    await initializeDependencies();

    final testWidget = MaterialApp(
      home: MyApp(),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.text('Lepaya'), findsOneWidget);
  });

  testWidgets('detail page is created', (WidgetTester tester) async {
    if (GetIt.instance == null) {
      await initializeDependencies();
    }

    final testWidget = MaterialApp(
      home: TrainerDetailsView(
          trainer: trainer),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.text('test@test.com'), findsOneWidget);
  });



  testWidgets('trainer widget', (WidgetTester tester) async {
    if (GetIt.instance == null) {
      await initializeDependencies();
    }

    final testWidget = MaterialApp(
      home: TrainerWidget( trainer: trainer),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.text('test@test.com'), findsOneWidget);
  });
}
