import 'package:get_it/get_it.dart';
import 'package:gym_app/core/services/network_connectivity_service.dart';
import 'package:gym_app/core/services/supabase_synchronization_service.dart';
import 'package:gym_app/data/repositories/exercise/sync_exercise_repository.dart';
import 'package:gym_app/data/repositories/workout/sync_workout_repository.dart';
import 'package:gym_app/features/offline_auth/offline_user_data_singleton.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../data/app_database.dart';
import '../../data/repositories/exercise/drift_exercise_repository.dart';
import '../../data/repositories/exercise/local_exercise_repository.dart';
import '../../data/repositories/user/drift_preferences_repository.dart';
import '../../data/repositories/user/local_preferences_repository.dart';
import '../../data/repositories/workout/drift_workout_repository.dart';
import '../../data/repositories/workout/local_workout_repository.dart';

bool setUpEnded = false;
final getIt = GetIt.instance;
Future<void> setUp() async {
  if (setUpEnded) {
    return;
  }

  getIt
    ..registerSingleton<AppDatabase>(AppDatabase())
    ..registerSingleton<LocalExerciseRepository>(
      DriftExerciseRepository(db: getIt.get<AppDatabase>()),
    )
    ..registerSingleton<LocalWorkoutRepository>(
      DriftWorkoutRepository(db: getIt.get<AppDatabase>()),
    )
    ..registerSingleton<LocalPreferencesRepository>(
      DriftPreferencesRepository(db: getIt.get<AppDatabase>()),
    )
    ..registerSingleton<OfflineUserDataSingleton>(
      OfflineUserDataSingleton(db: getIt.get<AppDatabase>()),
    )
    ..registerSingleton<SyncExerciseRepository>(
      SyncExerciseRepository(
        db: getIt.get<AppDatabase>(),
        supabaseClient: Supabase.instance.client,
      ),
    )
    ..registerSingleton<SyncWorkoutRepository>(
      SyncWorkoutRepository(
        db: getIt.get<AppDatabase>(),
        supabaseClient: Supabase.instance.client,
      ),
    )
    ..registerSingleton<SynchronizationCenter>(
      SynchronizationCenter(
        db: getIt.get<AppDatabase>(),
        supabaseClient: Supabase.instance.client,
      ),
    )
    ..registerSingleton<NetworkConnectivityService>(
      NetworkConnectivityService(
        syncCenter: getIt.get<SynchronizationCenter>(),
      ),
    );

  await getIt.get<OfflineUserDataSingleton>().initialize();
  await getIt
      .get<SynchronizationCenter>()
      .syncFromRemoteToLocal(DateTime(1970));
  setUpEnded = true;
}

extension GetItExtensions on GetIt {
  bool get isOnline => get<NetworkConnectivityService>().isOnline;
}
