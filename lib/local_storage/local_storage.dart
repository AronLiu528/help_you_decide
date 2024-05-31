import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveDecisions(List<String> options) async {
    String jsonString = json.encode(options);
    await _prefs?.setString('decisions_key', jsonString);
  }

  static List<String> loadDecisions() {
    String jsonString = _prefs?.getString('decisions_key') ?? '[]';
    List<String> loadedOptions = json.decode(jsonString).cast<String>();
    return loadedOptions;
  }
}



// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

// //

// class LocalStorageService {

  
//   static Future<void> saveDecisions(List<String> options) async {
//     final prefs = await SharedPreferences.getInstance();
//     String jsonString = json.encode(options);
//     await prefs.setString('decisions_key', jsonString);
//   }

//   static Future<List<String>> loadDecisions() async {
//     final prefs = await SharedPreferences.getInstance();
//     String jsonString = prefs.getString('decisions_key') ?? '[]';
//     List<String> loadedOptions = json.decode(jsonString).cast<String>();
//     return loadedOptions;
//   }
// }


