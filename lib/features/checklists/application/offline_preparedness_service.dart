import '../../../data/repositories/preparedness_checklist_repository.dart';
import '../domain/preparedness_checklist.dart';

class OfflinePreparednessService {
  OfflinePreparednessService(this._repository);

  final PreparednessChecklistRepository _repository;

  Future<List<PreparednessChecklist>> getChecklists() => _repository.getAll();

  Future<void> toggleItem({
    required String checklistId,
    required String itemId,
  }) async {
    final checklists = await _repository.getAll();
    final checklist = checklists.firstWhere((entry) => entry.id == checklistId);

    final updatedItems = checklist.items
        .map(
          (item) => item.id == itemId
              ? item.copyWith(isCompleted: !item.isCompleted)
              : item,
        )
        .toList();

    await _repository.updateChecklist(
      checklist.copyWith(
        items: updatedItems,
        lastUpdated: DateTime.now(),
      ),
    );
  }
}
