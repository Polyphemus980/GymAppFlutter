import 'package:get_it/get_it.dart';
import 'package:gym_app/data/repositories/sync_exercise_repository.dart';
import 'package:gym_app/data/repositories/sync_workout_repository.dart';
import 'package:gym_app/offline_user_data_singleton.dart';
import 'package:gym_app/services/sync.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
  getIt.registerSingleton<SyncExerciseRepository>(SyncExerciseRepository(
      db: getIt.get<AppDatabase>(), supabaseClient: Supabase.instance.client));
  getIt.registerSingleton<SyncWorkoutRepository>(SyncWorkoutRepository(
      db: getIt.get<AppDatabase>(), supabaseClient: Supabase.instance.client));
  getIt.registerSingleton<SynchronizationCenter>(SynchronizationCenter(
      db: getIt.get<AppDatabase>(), supabaseClient: Supabase.instance.client));
  await getIt.get<SynchronizationCenter>().syncRemoteToLocal(DateTime(1970));
  await getIt.get<OfflineUserDataSingleton>().initialize();
  setUpEnded = true;
}
