import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Week 4',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  List<Widget> widgets = [
    Text("koks"),
    WorkoutPlanWidget(
        WorkoutPlan('koks', [Exercise('bp'), Exercise('sq'), Exercise('dl')])),
    WorkoutScreen()
  ];
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: Center(
        child: widgets.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Train',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
      ),
    );
  }
}

class WorkoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
      body: Expanded(
        child: Column(
          children: [
            const Text("Quick start"),
            ElevatedButton(
              onPressed: () {},
              child: const Expanded(
                child: Row(
                  children: [Icon(Icons.add), Text("Start Workout")],
                ),
              ),
            ),
            const Text("Routines")
          ],
        ),
      ),
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MainScreen(),
    ),
  ],
);

class Exercise {
  Exercise(this.name);
  final String name;
}

class WorkoutPlan {
  WorkoutPlan(this.title, this.exercises);

  final String title;
  final List<Exercise> exercises;
}

class WorkoutPlanWidget extends StatelessWidget {
  @override
  WorkoutPlanWidget(this.data);

  final WorkoutPlan data;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsetsDirectional.all(16),
            sliver: SliverList.separated(
              itemCount: data.exercises.length,
              separatorBuilder: (context, _) => const SizedBox(height: 16),
              itemBuilder: (context, index) => Text(
                  "Exercise $index: ${data.exercises.elementAt(index).name}"),
            ),
          ),
        ],
      ),
    );
  }
}
