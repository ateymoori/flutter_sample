import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:lepaya_app/main.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lepaya_app/src/presentation/blocs/remote_trainers/remote_trainers_bloc.dart';
import 'package:lepaya_app/src/config/routes/app_routes.dart';
import 'package:lepaya_app/src/config/themes/app_theme.dart';
import 'package:lepaya_app/src/core/utils/constants.dart';
import 'package:lepaya_app/src/injector.dart';
import 'package:lepaya_app/src/presentation/blocs/remote_trainers/remote_trainers_bloc.dart';

import 'DioAdapterMock.dart';


// void main() {
//   Widget makeTestableWidget({@required Widget child, @required Locale locale}) {
//     return MaterialApp(
//       localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
//         // S.delegate,
//         // GlobalMaterialLocalizations.delegate,
//         // GlobalWidgetsLocalizations.delegate,
//         // GlobalCupertinoLocalizations.delegate,
//       ],
//       //supportedLocales: S.delegate.supportedLocales,
//       locale: locale,
//       home: child,
//     );
//   }
//
//   testWidgets('Widget', (WidgetTester tester) async {
//     const MyApp screen = MyApp();
//     await tester.pumpWidget(makeTestableWidget(
//       child: screen,
//       locale: const Locale('en'),
//     ));
//     await tester.pump();
//
//     expect(find.text('Lepaya'), findsOneWidget);
//     // expect(find.text('Witaj świecie!'), findsNothing);
//   });
// }


//
// void main() {
//   DioAdapterMock dioAdapterMock;
//
//   setUp(() {
//     dioAdapterMock = DioAdapterMock();
//   });
//
//   testWidgets('Test-1', (WidgetTester tester) async {
//     /// create a http response that will be returned when an API is called
//     var data = {'message': 'This message has been fetched from mock API-1.'};
//
//     final responsepayload = jsonEncode(data);
//
//     final httpResponse = ResponseBody.fromString(
//       responsepayload,
//       200,
//       headers: {
//         Headers.contentTypeHeader: [Headers.jsonContentType],
//       },
//     );
//
//     /// [when] is used for mocking API to return the http response created above
//     /// It will mock any next API call for once
//     /// Here, we mock the API for any requestOptions, requestStream and cancelFuture
//     /// which are the parameters of the fetch method which is used to make an API request.
//     when(dioAdapterMock.fetch(any, any, any))
//         .thenAnswer((_) async => httpResponse);
//
//     await tester.pumpWidget(
//       MaterialApp(
//         title: 'Flutter Test',
//         home: MyApp(
//         ),
//       ),
//     );
//
//     // Finder button = find.ancestor(
//     //   of: find.text('Click here to fetch data from API-1'),
//     //   matching: find.byType(RaisedButton),
//     // );
//
//     expect(find.text('Lepaya'),
//         findsNothing);
//
//     // await tester.tap(button);
//     // await tester.pumpAndSettle();
//     //
//     // expect(find.text('This message has been fetched from mock API-1.'),
//     //     findsOneWidget);
//   });
// }