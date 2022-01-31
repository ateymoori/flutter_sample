import 'package:flutter/material.dart';
import '../../domain/entities/trainer.dart';
import '../../presentation/views/trainer_details_view.dart';
import '../../presentation/views/dashboard_view.dart';

mixin AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const DashboardView());
        break;

      case '/TrainerDetailsView':
        return _materialRoute(TrainerDetailsView(trainer: settings.arguments as Trainer));
        break;
      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
