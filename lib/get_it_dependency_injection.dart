import 'package:get_it/get_it.dart';
import 'package:gym_app/offline_user_data_singleton.dart';

import 'data/app_database.dart';
import 'data/repositories/drift_exercise_repository.dart';
import 'data/repositories/drift_preferences_repository.dart';
import 'data/repositories/drift_workout_repository.dart';
import 'data/repositories/local_exercise_repository.dart';
import 'data/repositories/local_preferences_repository.dart';
import 'data/repositories/local_workout_repository.dart';

bool setUpEnded = false;
final getIt = GetIt.instance;
Future<void> setUp() async {
  if (setUpEnded) {
    return;
  }

  getIt.registerSingleton<AppDatabase>(AppDatabase());
  getIt.registerSingleton<LocalExerciseRepository>(
      DriftExerciseRepository(db: getIt.get<AppDatabase>()));
  getIt.registerSingleton<LocalWorkoutRepository>(
      DriftWorkoutRepository(db: getIt.get<AppDatabase>()));
  getIt.registerSingleton<LocalPreferencesRepository>(
    DriftPreferencesRepository(db: getIt.get<AppDatabase>()),
  );
  getIt.registerSingleton<OfflineUserDataSingleton>(
      OfflineUserDataSingleton(db: getIt.get<AppDatabase>()));
  await getIt.get<OfflineUserDataSingleton>().initialize();
  setUpEnded = true;
}
