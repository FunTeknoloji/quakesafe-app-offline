import '../../features/checklists/domain/emergency_guide.dart';
import '../datasources/local/local_store.dart';

class EmergencyGuideRepository {
  EmergencyGuideRepository(this._localStore);

  static const String _collection = 'emergency_guides';
  final LocalStore _localStore;

  Future<List<EmergencyGuide>> getAll() async {
    final raw = await _localStore.getCollection(_collection);
    return raw.map(EmergencyGuide.fromJson).toList();
  }

  Future<void> saveAll(List<EmergencyGuide> guides) async {
    await _localStore.upsertCollection(
      _collection,
      guides.map((guide) => guide.toJson()).toList(),
    );
  }
}
