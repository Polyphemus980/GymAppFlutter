import 'package:flutter/cupertino.dart';
import 'package:gym_app/data/repositories/local_preferences_repository.dart';

class UnitNotifier extends ChangeNotifier {
  final LocalPreferencesRepository preferencesRepository;
  bool _isMetric = true;
  bool get isMetric => _isMetric;

  toggleUnits(String userId) {
    _isMetric = !_isMetric;
    preferencesRepository.updateUserPreferences(
        userId: userId, isMetric: _isMetric);
    notifyListeners();
  }

  void setUserUnits(bool isMetric) {
    _isMetric = isMetric;
    notifyListeners();
  }

  UnitNotifier({required this.preferencesRepository});
  String get units => _isMetric ? "kg" : "lbs";
}
