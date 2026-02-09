import '../repositories/alert_repository.dart';
import '../repositories/emergency_guide_repository.dart';
import '../repositories/preparedness_checklist_repository.dart';
import 'sync_service.dart';

class OfflineFirstContentService {
  OfflineFirstContentService({
    required AlertRepository alertRepository,
    required PreparednessChecklistRepository checklistRepository,
    required EmergencyGuideRepository guideRepository,
    required SyncService syncService,
  })  : _alertRepository = alertRepository,
        _checklistRepository = checklistRepository,
        _guideRepository = guideRepository,
        _syncService = syncService;

  final AlertRepository _alertRepository;
  final PreparednessChecklistRepository _checklistRepository;
  final EmergencyGuideRepository _guideRepository;
  final SyncService _syncService;

  DateTime? _lastSyncedAt;

  /// Daima local veriyi döndürür. İstenirse arka planda sync denenebilir.
  Future<void> syncIfAvailable({required bool hasInternet}) async {
    if (!hasInternet) {
      return;
    }

    final result = await _syncService.sync(lastSyncedAt: _lastSyncedAt);

    if (result.alerts.isNotEmpty) {
      await _alertRepository.saveAlerts(result.alerts);
    }
    if (result.checklists.isNotEmpty) {
      await _checklistRepository.saveAll(result.checklists);
    }
    if (result.guides.isNotEmpty) {
      await _guideRepository.saveAll(result.guides);
    }

    _lastSyncedAt = result.syncedAt;
  }
}
