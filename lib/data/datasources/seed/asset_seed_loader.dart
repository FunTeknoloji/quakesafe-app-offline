import 'dart:convert';

typedef AssetReader = Future<String> Function(String assetPath);

class AssetSeedLoader {
  AssetSeedLoader({required this.reader});

  final AssetReader reader;

  Future<List<Map<String, dynamic>>> loadCollection(String assetPath) async {
    final raw = await reader(assetPath);
    final decoded = jsonDecode(raw) as List<dynamic>;

    return decoded
        .map((entry) => Map<String, dynamic>.from(entry as Map))
        .toList();
  }
}
