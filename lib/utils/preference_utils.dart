import 'package:fgpt_ai/config/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static Future<bool> getLuanchStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(PreferenceConstants.isLaunchedBefore) ?? false;
  }
}
