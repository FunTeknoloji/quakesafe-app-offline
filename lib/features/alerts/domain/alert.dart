class Alert {
  const Alert({
    required this.id,
    required this.title,
    required this.body,
    required this.severity,
    required this.category,
    required this.publishedAt,
    this.expiresAt,
    this.isRead = false,
  });

  final String id;
  final String title;
  final String body;
  final AlertSeverity severity;
  final String category;
  final DateTime publishedAt;
  final DateTime? expiresAt;
  final bool isRead;

  bool get isExpired => expiresAt != null && DateTime.now().isAfter(expiresAt!);

  Alert copyWith({
    bool? isRead,
  }) {
    return Alert(
      id: id,
      title: title,
      body: body,
      severity: severity,
      category: category,
      publishedAt: publishedAt,
      expiresAt: expiresAt,
      isRead: isRead ?? this.isRead,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'body': body,
        'severity': severity.name,
        'category': category,
        'publishedAt': publishedAt.toIso8601String(),
        'expiresAt': expiresAt?.toIso8601String(),
        'isRead': isRead,
      };

  factory Alert.fromJson(Map<String, dynamic> json) => Alert(
        id: json['id'] as String,
        title: json['title'] as String,
        body: json['body'] as String,
        severity: AlertSeverity.values.byName(json['severity'] as String),
        category: json['category'] as String,
        publishedAt: DateTime.parse(json['publishedAt'] as String),
        expiresAt: json['expiresAt'] != null
            ? DateTime.parse(json['expiresAt'] as String)
            : null,
        isRead: (json['isRead'] as bool?) ?? false,
      );
}

enum AlertSeverity { low, medium, high, critical }
