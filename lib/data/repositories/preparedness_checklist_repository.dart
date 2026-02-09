import '../../features/checklists/domain/preparedness_checklist.dart';
import '../datasources/local/local_store.dart';

class PreparednessChecklistRepository {
  PreparednessChecklistRepository(this._localStore);

  static const String _collection = 'preparedness_checklists';
  final LocalStore _localStore;

  Future<List<PreparednessChecklist>> getAll() async {
    final raw = await _localStore.getCollection(_collection);
    return raw.map(PreparednessChecklist.fromJson).toList();
  }

  Future<void> saveAll(List<PreparednessChecklist> checklists) async {
    await _localStore.upsertCollection(
      _collection,
      checklists.map((checklist) => checklist.toJson()).toList(),
    );
  }

  Future<void> updateChecklist(PreparednessChecklist checklist) async {
    final all = await getAll();
    final updated = all
        .map((existing) => existing.id == checklist.id ? checklist : existing)
        .toList();
    await saveAll(updated);
  }
}
