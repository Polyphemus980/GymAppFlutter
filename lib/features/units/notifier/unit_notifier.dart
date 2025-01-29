import 'package:flutter/cupertino.dart';
import 'package:gym_app/data/repositories/user/local_preferences_repository.dart';

class UnitNotifier extends ChangeNotifier {
  UnitNotifier({required this.preferencesRepository});
  final LocalPreferencesRepository preferencesRepository;
  bool _isMetric = true;
  bool get isMetric => _isMetric;

  void toggleUnits(String userId) {
    _isMetric = !_isMetric;
    preferencesRepository.updateUserPreferences(
      userId: userId,
      isMetric: _isMetric,
    );
    notifyListeners();
  }

  void setUserUnits(bool isMetric) {
    _isMetric = isMetric;
    notifyListeners();
  }

  String get units => _isMetric ? 'kg' : 'lbs';
}
