abstract class LocalStore {
  Future<void> initialize();

  Future<List<Map<String, dynamic>>> getCollection(String name);

  Future<void> upsertCollection(String name, List<Map<String, dynamic>> payload);

  Future<bool> getBool(String key);

  Future<void> setBool(String key, bool value);
}
