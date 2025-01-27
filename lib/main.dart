import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/core/services/android_notification_service.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/dependency_injection/get_it_dependency_injection.dart';
import 'core/dependency_injection/global_providers.dart';
import 'features/theme/notifier/theme_notifier.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://fakalwhzqmsqjhrtuudc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZha2Fsd2h6cW1zcWpocnR1dWRjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzczNzAxMTksImV4cCI6MjA1Mjk0NjExOX0.RKjia0O4ypmgEZKWkhgIEcjFiwgQBt3cujmYotG2lhA',
  );

  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  await setUp();
  HydratedBloc.storage = storage;
  await NotificationService.initialize();
  runApp(const GlobalProviders(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeNotifier>().currentTheme;
    return MaterialApp.router(
      theme: theme,
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
