import '../../../data/repositories/alert_repository.dart';
import '../domain/alert.dart';

class OfflineAlertService {
  OfflineAlertService(this._repository);

  final AlertRepository _repository;

  Future<List<Alert>> activeAlerts() async {
    final alerts = await _repository.getAlerts();
    return alerts.where((alert) => !alert.isExpired).toList()
      ..sort((a, b) => b.publishedAt.compareTo(a.publishedAt));
  }

  Future<void> markAsRead(String alertId) => _repository.markAsRead(alertId);
}
