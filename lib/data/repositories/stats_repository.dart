import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class StatsRepository {
  static const _key = 'game_stats';

  Future<Map<String, dynamic>> loadStats() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);
    if (jsonString == null) return {};
    return jsonDecode(jsonString);
  }

  Future<void> saveStats(Map<String, dynamic> stats) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, jsonEncode(stats));
  }
}
