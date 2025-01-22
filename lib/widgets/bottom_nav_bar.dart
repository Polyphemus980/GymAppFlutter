import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/get_it_dependency_injection.dart';
import 'package:gym_app/network_connectivity_notifier.dart';
import 'package:gym_app/offline_user_data_singleton.dart';
import 'package:provider/provider.dart';

import '../timer_notifier.dart';
import '../workout_bloc.dart';

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
              label: Text(
                  '${Provider.of<TimerNotifier>(context).elapsedSeconds} + ${getIt.get<OfflineUserDataSingleton>().hasUser}+ ${context.watch<NetworkConnectivityNotifier>().isOnline}'),
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
