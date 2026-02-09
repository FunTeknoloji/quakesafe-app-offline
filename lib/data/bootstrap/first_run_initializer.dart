import '../datasources/local/local_store.dart';
import '../datasources/seed/asset_seed_loader.dart';
import '../repositories/alert_repository.dart';
import '../repositories/emergency_guide_repository.dart';
import '../repositories/preparedness_checklist_repository.dart';
import '../../features/alerts/domain/alert.dart';
import '../../features/checklists/domain/emergency_guide.dart';
import '../../features/checklists/domain/preparedness_checklist.dart';

class FirstRunInitializer {
  FirstRunInitializer({
    required LocalStore localStore,
    required AssetSeedLoader seedLoader,
    required AlertRepository alertRepository,
    required PreparednessChecklistRepository preparednessChecklistRepository,
    required EmergencyGuideRepository emergencyGuideRepository,
  })  : _localStore = localStore,
        _seedLoader = seedLoader,
        _alertRepository = alertRepository,
        _preparednessChecklistRepository = preparednessChecklistRepository,
        _emergencyGuideRepository = emergencyGuideRepository;

  static const _seededFlag = 'is_seeded';

  final LocalStore _localStore;
  final AssetSeedLoader _seedLoader;
  final AlertRepository _alertRepository;
  final PreparednessChecklistRepository _preparednessChecklistRepository;
  final EmergencyGuideRepository _emergencyGuideRepository;

  Future<void> initialize() async {
    await _localStore.initialize();

    final isSeeded = await _localStore.getBool(_seededFlag);
    if (isSeeded) {
      return;
    }

    final alertsRaw = await _seedLoader.loadCollection('assets/seeds/alerts.json');
    final checklistsRaw =
        await _seedLoader.loadCollection('assets/seeds/preparedness_checklists.json');
    final guidesRaw =
        await _seedLoader.loadCollection('assets/seeds/emergency_guides.json');

    await _alertRepository.saveAlerts(alertsRaw.map(Alert.fromJson).toList());
    await _preparednessChecklistRepository
        .saveAll(checklistsRaw.map(PreparednessChecklist.fromJson).toList());
    await _emergencyGuideRepository
        .saveAll(guidesRaw.map(EmergencyGuide.fromJson).toList());

    await _localStore.setBool(_seededFlag, true);
  }
}
