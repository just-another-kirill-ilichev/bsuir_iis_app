import 'package:bsuir_iis_app/config/app_routes.dart';
import 'package:bsuir_iis_app/domain/service/preferences_service.dart';
import 'package:bsuir_iis_app/domain/service/schedule_service.dart';
import 'package:bsuir_iis_app/presentation/schedule_page/schedule_page.dart';
import 'package:bsuir_iis_app/presentation/settings_page/settings_page.dart';
import 'package:bsuir_iis_app/state/schedule_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => ScheduleBloc(ScheduleService(), PreferencesService()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          AppRoutes.schedule: (_) => const SchedulePage(),
          AppRoutes.settings: (_) => SettingsPage(),
        },
        initialRoute: AppRoutes.schedule,
      ),
    );
  }
}
