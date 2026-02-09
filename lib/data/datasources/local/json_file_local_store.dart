import 'dart:convert';
import 'dart:io';

import 'local_store.dart';

class JsonFileLocalStore implements LocalStore {
  JsonFileLocalStore({required this.baseDirectoryPath});

  final String baseDirectoryPath;

  late final File _dbFile;
  Map<String, dynamic> _db = {};

  @override
  Future<void> initialize() async {
    final dir = Directory(baseDirectoryPath);
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }

    _dbFile = File('${dir.path}/offline_db.json');
    if (!await _dbFile.exists()) {
      _db = {
        'collections': <String, dynamic>{},
        'flags': <String, dynamic>{},
      };
      await _persist();
      return;
    }

    final raw = await _dbFile.readAsString();
    _db = (jsonDecode(raw) as Map<String, dynamic>);
    _db.putIfAbsent('collections', () => <String, dynamic>{});
    _db.putIfAbsent('flags', () => <String, dynamic>{});
  }

  @override
  Future<List<Map<String, dynamic>>> getCollection(String name) async {
    final collections = (_db['collections'] as Map<String, dynamic>);
    final raw = (collections[name] as List<dynamic>? ?? const []);
    return raw.map((entry) => Map<String, dynamic>.from(entry as Map)).toList();
  }

  @override
  Future<void> upsertCollection(
    String name,
    List<Map<String, dynamic>> payload,
  ) async {
    final collections = (_db['collections'] as Map<String, dynamic>);
    collections[name] = payload;
    await _persist();
  }

  @override
  Future<bool> getBool(String key) async {
    final flags = (_db['flags'] as Map<String, dynamic>);
    return (flags[key] as bool?) ?? false;
  }

  @override
  Future<void> setBool(String key, bool value) async {
    final flags = (_db['flags'] as Map<String, dynamic>);
    flags[key] = value;
    await _persist();
  }

  Future<void> _persist() async {
    await _dbFile.writeAsString(
      const JsonEncoder.withIndent('  ').convert(_db),
      flush: true,
    );
  }
}
