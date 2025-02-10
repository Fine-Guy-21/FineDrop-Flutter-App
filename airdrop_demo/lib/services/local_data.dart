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
    return File('$path/local_persistence.json');
  }

  // Read the journals JSON file
  Future<String> readJournals() async {
    try {
      final file = await _localFile;
      return await file.readAsString();
    } catch (e) {
      // If file doesn't exist, return an empty JSON structure
      return '{"user": []}';
    }
  }

  // Write to the journals JSON file
  Future<File> writeJournals(String json) async {
    final file = await _localFile;
    return file.writeAsString(json);
  }
}