class EmergencyGuide {
  const EmergencyGuide({
    required this.id,
    required this.title,
    required this.hazardType,
    required this.steps,
    required this.version,
    this.lastReviewedAt,
  });

  final String id;
  final String title;
  final String hazardType;
  final List<GuideStep> steps;
  final int version;
  final DateTime? lastReviewedAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'hazardType': hazardType,
        'steps': steps.map((step) => step.toJson()).toList(),
        'version': version,
        'lastReviewedAt': lastReviewedAt?.toIso8601String(),
      };

  factory EmergencyGuide.fromJson(Map<String, dynamic> json) {
    final stepsJson = (json['steps'] as List<dynamic>? ?? const []);

    return EmergencyGuide(
      id: json['id'] as String,
      title: json['title'] as String,
      hazardType: json['hazardType'] as String,
      steps: stepsJson
          .map((rawStep) => GuideStep.fromJson(rawStep as Map<String, dynamic>))
          .toList(),
      version: json['version'] as int,
      lastReviewedAt: json['lastReviewedAt'] != null
          ? DateTime.parse(json['lastReviewedAt'] as String)
          : null,
    );
  }
}

class GuideStep {
  const GuideStep({
    required this.id,
    required this.order,
    required this.instruction,
  });

  final String id;
  final int order;
  final String instruction;

  Map<String, dynamic> toJson() => {
        'id': id,
        'order': order,
        'instruction': instruction,
      };

  factory GuideStep.fromJson(Map<String, dynamic> json) => GuideStep(
        id: json['id'] as String,
        order: json['order'] as int,
        instruction: json['instruction'] as String,
      );
}
