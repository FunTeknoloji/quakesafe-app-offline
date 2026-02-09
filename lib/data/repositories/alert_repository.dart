import '../../features/alerts/domain/alert.dart';
import '../datasources/local/local_store.dart';

class AlertRepository {
  AlertRepository(this._localStore);

  static const String _collection = 'alerts';
  final LocalStore _localStore;

  Future<List<Alert>> getAlerts() async {
    final raw = await _localStore.getCollection(_collection);
    return raw.map(Alert.fromJson).toList();
  }

  Future<void> saveAlerts(List<Alert> alerts) async {
    await _localStore.upsertCollection(
      _collection,
      alerts.map((alert) => alert.toJson()).toList(),
    );
  }

  Future<void> markAsRead(String id) async {
    final alerts = await getAlerts();
    final updated = alerts
        .map((alert) => alert.id == id ? alert.copyWith(isRead: true) : alert)
        .toList();
    await saveAlerts(updated);
  }
}
