import '../datasources/local/json_file_local_store.dart';
import '../datasources/seed/asset_seed_loader.dart';
import '../datasources/seed/flutter_asset_reader.dart';
import '../repositories/alert_repository.dart';
import '../repositories/emergency_guide_repository.dart';
import '../repositories/preparedness_checklist_repository.dart';
import 'first_run_initializer.dart';

class OfflineDataModule {
  OfflineDataModule({required String localPath})
      : localStore = JsonFileLocalStore(baseDirectoryPath: localPath),
        seedLoader = AssetSeedLoader(reader: flutterAssetReader) {
    alertRepository = AlertRepository(localStore);
    checklistRepository = PreparednessChecklistRepository(localStore);
    guideRepository = EmergencyGuideRepository(localStore);
  }

  final JsonFileLocalStore localStore;
  final AssetSeedLoader seedLoader;
  late final AlertRepository alertRepository;
  late final PreparednessChecklistRepository checklistRepository;
  late final EmergencyGuideRepository guideRepository;

  FirstRunInitializer initializer() => FirstRunInitializer(
        localStore: localStore,
        seedLoader: seedLoader,
        alertRepository: alertRepository,
        preparednessChecklistRepository: checklistRepository,
        emergencyGuideRepository: guideRepository,
      );
}
