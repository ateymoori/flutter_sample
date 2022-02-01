import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lepaya_app/src/presentation/blocs/remote_trainers/remote_trainers_bloc.dart';
import 'src/config/routes/app_routes.dart';
import 'src/config/themes/app_theme.dart';
import 'src/core/utils/constants.dart';
import 'src/injector.dart';
import 'src/presentation/blocs/remote_trainers/remote_trainers_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteTrainersBloc>(
      create: (_) => injector()..add(const GetTrainers()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kMaterialAppTitle,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
      ),
    );
  }
}