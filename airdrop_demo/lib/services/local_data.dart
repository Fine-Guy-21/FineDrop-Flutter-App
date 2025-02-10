import 'package:airdrop_demo/model/user.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

class DatabaseFileRoutines {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/local_data.json');
  }

  // Read user profile JSON file
  Future<UserProfile> readUserProfile() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      Map<String, dynamic> jsonData = jsonDecode(contents);
      return UserProfile.fromJson(jsonData);
    } catch (e) {
      // If file doesn't exist, return a default user profile
      return UserProfile();
    }
  }

  // Write user profile to JSON file
  Future<File> writeUserProfile(UserProfile user) async {
    final file = await _localFile;
    String json = jsonEncode(user.toJson());
    return file.writeAsString(json);
  }
}
