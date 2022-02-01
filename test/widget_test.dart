// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import 'package:lepaya_app/main.dart';
import 'package:lepaya_app/src/injector.dart';
import 'package:lepaya_app/src/presentation/blocs/remote_trainers/remote_trainers_bloc.dart';
import 'package:lepaya_app/src/presentation/views/dashboard_view.dart';

void main() {
  testWidgets('home page is created', (WidgetTester tester) async {
    await initializeDependencies();

    final testWidget = MaterialApp(
      home: MyApp(),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.text('Lepaya'), findsOneWidget);
  });
}
