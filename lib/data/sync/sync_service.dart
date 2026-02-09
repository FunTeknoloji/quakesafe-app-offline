import '../../features/alerts/domain/alert.dart';
import '../../features/checklists/domain/emergency_guide.dart';
import '../../features/checklists/domain/preparedness_checklist.dart';

/// Offline-first senaryoda internet geldiğinde opsiyonel güncelleme için
/// uygulanacak sözleşme.
abstract class SyncService {
  Future<SyncResult> sync({required DateTime? lastSyncedAt});
}

class SyncResult {
  const SyncResult({
    required this.syncedAt,
    this.alerts = const [],
    this.checklists = const [],
    this.guides = const [],
  });

  final DateTime syncedAt;
  final List<Alert> alerts;
  final List<PreparednessChecklist> checklists;
  final List<EmergencyGuide> guides;
}

class NoopSyncService implements SyncService {
  const NoopSyncService();

  @override
  Future<SyncResult> sync({required DateTime? lastSyncedAt}) async {
    return SyncResult(syncedAt: DateTime.now());
  }
}
