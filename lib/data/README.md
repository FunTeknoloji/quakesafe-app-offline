# Data Katmanı (Offline-First)

Bu yapı tamamen yerel çalışacak şekilde tasarlandı:

- `datasources/local/local_store.dart`: Local storage sözleşmesi.
- `datasources/local/json_file_local_store.dart`: Basit JSON dosya tabanlı local store (Hive/SQLite alternatifi için örnek).
- `datasources/seed/*`: İlk kurulum seed yükleme.
- `bootstrap/first_run_initializer.dart`: JSON asset -> local DB aktarımı.
- `sync/sync_service.dart`: İnternet geldiğinde opsiyonel sync arayüzü.

> Üretimde `LocalStore` implementasyonu Drift/SQLite/Hive ile değiştirilebilir.
