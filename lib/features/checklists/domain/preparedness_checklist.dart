class PreparednessChecklist {
  const PreparednessChecklist({
    required this.id,
    required this.title,
    required this.description,
    required this.items,
    this.lastUpdated,
  });

  final String id;
  final String title;
  final String description;
  final List<ChecklistItem> items;
  final DateTime? lastUpdated;

  double get completionRate {
    if (items.isEmpty) {
      return 0;
    }

    final completed = items.where((item) => item.isCompleted).length;
    return completed / items.length;
  }

  PreparednessChecklist copyWith({
    List<ChecklistItem>? items,
    DateTime? lastUpdated,
  }) {
    return PreparednessChecklist(
      id: id,
      title: title,
      description: description,
      items: items ?? this.items,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'items': items.map((item) => item.toJson()).toList(),
        'lastUpdated': lastUpdated?.toIso8601String(),
      };

  factory PreparednessChecklist.fromJson(Map<String, dynamic> json) {
    final itemsJson = (json['items'] as List<dynamic>? ?? const []);

    return PreparednessChecklist(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      items: itemsJson
          .map((rawItem) => ChecklistItem.fromJson(rawItem as Map<String, dynamic>))
          .toList(),
      lastUpdated: json['lastUpdated'] != null
          ? DateTime.parse(json['lastUpdated'] as String)
          : null,
    );
  }
}

class ChecklistItem {
  const ChecklistItem({
    required this.id,
    required this.label,
    required this.order,
    this.isCompleted = false,
  });

  final String id;
  final String label;
  final int order;
  final bool isCompleted;

  ChecklistItem copyWith({
    bool? isCompleted,
  }) {
    return ChecklistItem(
      id: id,
      label: label,
      order: order,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'label': label,
        'order': order,
        'isCompleted': isCompleted,
      };

  factory ChecklistItem.fromJson(Map<String, dynamic> json) => ChecklistItem(
        id: json['id'] as String,
        label: json['label'] as String,
        order: json['order'] as int,
        isCompleted: (json['isCompleted'] as bool?) ?? false,
      );
}
