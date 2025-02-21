import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils/map_extensions.dart';
import 'cart_source.dart';

@Injectable(as: CartSource)
class CartSourceSharedPreferences implements CartSource {
  static const _key = 'cart';
  SharedPreferences? _prefs;
  CartSourceSharedPreferences();

  @override
  Future<Map<int, int>> load() async {
    _prefs ??= await SharedPreferences.getInstance();
    final val = _prefs!.getString(_key);
    return val != null ? (jsonDecode(val) as Map<String, dynamic>).toInt() : {};
  }

  @override
  Future<void> save(Map<int, int> items) async {
    _prefs ??= await SharedPreferences.getInstance();
    final res = await _prefs!.setString(
      _key,
      jsonEncode(items.keyToString()),
    );
    if (!res) {
      throw Exception('Failed to save to SharedPreferences');
    }
    debugPrint("Cart saved to SharedPreferences");
  }
}
