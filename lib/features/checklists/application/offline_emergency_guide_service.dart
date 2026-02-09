import '../../../data/repositories/emergency_guide_repository.dart';
import '../domain/emergency_guide.dart';

class OfflineEmergencyGuideService {
  OfflineEmergencyGuideService(this._repository);

  final EmergencyGuideRepository _repository;

  Future<List<EmergencyGuide>> getGuides() async {
    final guides = await _repository.getAll();
    return guides
      ..sort((a, b) => a.hazardType.compareTo(b.hazardType));
  }

  Future<EmergencyGuide?> getGuideForHazard(String hazardType) async {
    final guides = await getGuides();
    for (final guide in guides) {
      if (guide.hazardType == hazardType) {
        return guide;
      }
    }
    return null;
  }
}
