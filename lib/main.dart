import 'dart:async';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/data/models/exercise.dart';
import 'package:gym_app/data/repositories/drift_exercise_repository.dart';
import 'package:gym_app/data/repositories/local_exercise_repository.dart';
import 'package:gym_app/screens/add_exercise_screen.dart';
import 'package:gym_app/screens/choose_muscle_groups_screen.dart';
import 'package:gym_app/screens/empty_workout_screen.dart';
import 'package:gym_app/screens/exercise_list_screen.dart';
import 'package:gym_app/screens/focus_workout_screen.dart';
import 'package:gym_app/screens/new_workout_plan_screen.dart';
import 'package:gym_app/screens/profile_screen.dart';
import 'package:gym_app/screens/select_exercise_screen.dart';
import 'package:gym_app/screens/workout_screen.dart';
import 'package:gym_app/workout_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'data/app_database.dart';
import 'data/models/muscle_group.dart';
import 'data/models/set_data.dart';

class ThemeNotifier extends ChangeNotifier {
  final ThemeData lightTheme = FlexThemeData.light(
      tones: const FlexTones.dark(),
      scheme: FlexScheme.vesuviusBurn,
      surfaceTint: Colors.transparent);

  final ThemeData darkTheme = FlexThemeData.dark(
    scheme: FlexScheme.vesuviusBurn,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    darkIsTrueBlack: false,
    blendLevel: 20,
    tones: const FlexTones.light(),
    subThemesData: const FlexSubThemesData(
      defaultRadius: 8.0,
    ),
  );

  ThemeData _currentTheme;
  bool _isLightTheme() => _currentTheme == lightTheme;
  bool isLightTheme() => _isLightTheme();
  ThemeNotifier()
      : _currentTheme = ThemeMode.system != ThemeMode.light
            ? FlexThemeData.light(
                scheme: FlexScheme.vesuviusBurn,
                surfaceTint: Colors.transparent)
            : FlexThemeData.dark(
                scheme: FlexScheme.greyLaw,
                darkIsTrueBlack: false,
              );

  ThemeData get currentTheme => _currentTheme;
  void toggleTheme() {
    _currentTheme = (_currentTheme == lightTheme) ? darkTheme : lightTheme;
    notifyListeners();
  }
}

class TimerNotifier extends ChangeNotifier {
  DateTime? _startedAt;
  DateTime? _pausedAt;
  bool _isRunning = false;
  Timer? _notifyTimer;
  int get elapsedSeconds {
    if (_startedAt == null) {
      return 0;
    }
    if (!_isRunning && _pausedAt != null) {
      return _pausedAt!.difference(_startedAt!).inSeconds;
    }
    return DateTime.now().difference(_startedAt!).inSeconds;
  }

  startTimer() {
    if (!_isRunning) {
      if (_startedAt == null) {
        _startedAt = DateTime.now();
      } else {
        _startedAt = _startedAt!.add(DateTime.now().difference(_pausedAt!));
      }
      _isRunning = true;
      _pausedAt = null;
      _notifyTimer?.cancel();
      _notifyTimer =
          Timer.periodic(const Duration(seconds: 1), (_) => notifyListeners());
      notifyListeners();
    }
  }

  resetTimer() {
    if (!_isRunning) {
      return;
    }
    _startedAt = DateTime.now();
    _pausedAt = null;
    notifyListeners();
  }

  pauseTimer() {
    if (_isRunning) {
      _pausedAt = DateTime.now();
      _isRunning = false;
      _notifyTimer?.cancel();
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _notifyTimer?.cancel();
    super.dispose();
  }
}

bool setUpEnded = false;
final getIt = GetIt.instance;
void setUp() {
  if (setUpEnded) {
    return;
  }

  getIt.registerSingleton<AppDatabase>(AppDatabase());
  getIt.registerSingleton<LocalExerciseRepository>(
      DriftExerciseRepository(db: getIt.get<AppDatabase>()));
  setUpEnded = true;
}

class GlobalProviders extends StatelessWidget {
  const GlobalProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(
          create: (_) => ThemeNotifier(),
        ),
        BlocProvider<WorkoutBloc>(
            create: (BuildContext context) => WorkoutBloc()),
        ChangeNotifierProvider<TimerNotifier>(
          create: (_) => TimerNotifier(),
        )
      ],
      child: const MyApp(),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBloc.storage = storage;
  runApp(const GlobalProviders());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    setUp();
    final theme = context.watch<ThemeNotifier>().currentTheme;
    return MaterialApp.router(
      theme: theme,
      themeMode: ThemeMode.system,
      routerConfig: _router,
      title: 'Week 4',
    );
  }
}

final _router = GoRouter(initialLocation: '/home', routes: [
  ShellRoute(builder: (context, state, child) => BottomNavBar(child), routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const Placeholder(),
    ),
    GoRoute(
      path: '/exercise',
      builder: (context, state) => const ExerciseListScreen(),
    ),
    GoRoute(
      path: '/workout',
      builder: (context, state) => const WorkoutListScreen(),
    ),
    GoRoute(
        path: '/start',
        builder: (context, state) {
          final sets = state.extra as List<SetData>? ?? [];
          return FocusWorkoutScreen(sets: sets);
        }),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
  ]),
  GoRoute(
      path: '/add',
      builder: (context, state) => const AddExerciseScreen(),
      routes: [
        GoRoute(
            path: 'pick',
            builder: (context, state) {
              final selectedOptions = state.extra as List<MuscleGroup>? ?? [];
              return MusclePicker(list: selectedOptions);
            })
      ]),
  GoRoute(
      path: '/plan',
      builder: (context, state) {
        return const NewWorkoutPlanScreen(
          numWeeks: 12,
          numDays: 1,
        );
      },
      routes: [
        GoRoute(
            path: 'new',
            builder: (context, state) {
              final data = state.extra as List<SetData>;
              return PreWorkoutScreen(
                isRpe: true,
                data: data,
                title: "Create workout",
                finishButtonText: "Save Workout",
                finishButtonOnTap: (sets) {
                  context.pop(sets);
                },
              );
            })
      ]),
  GoRoute(
      path: '/new',
      builder: (context, state) {
        return PreWorkoutScreen(
          title: "Create workout",
          finishButtonText: "Start Workout",
          finishButtonOnTap: (sets) {
            Provider.of<TimerNotifier>(context, listen: false).startTimer();
            context.go('/start', extra: sets);
          },
        );
      },
      routes: [
        GoRoute(
            path: 'select',
            builder: (context, state) {
              final selectedList = state.extra as List<Exercise>? ?? [];
              return SelectExerciseScreen(selectedExercises: selectedList);
            }),
      ]),
]);

class BottomNavBar extends StatefulWidget {
  const BottomNavBar(this.child, {super.key});
  final Widget child;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocBuilder<WorkoutBloc, WorkoutState>(
        builder: (BuildContext context, state) {
          if (state is WorkoutInProgress) {
            return FloatingActionButton.extended(
              onPressed: () {
                context.go('/start');
              },
              label:
                  Text('${Provider.of<TimerNotifier>(context).elapsedSeconds}'),
              icon: const Icon(Icons.fitness_center),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Social',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Train',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Theme.of(context)
            .colorScheme
            .primary, // Use accentColor from the theme
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          switch (index) {
            case 0:
              context.go('/home');
            case 1:
              context.go('/workout');
            case 2:
              context.go('/exercise');
            case 3:
              context.go('/profile');
          }
        },
      ),
      body: widget.child,
    );
  }
}
