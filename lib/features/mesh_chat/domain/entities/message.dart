enum MessagePriority {
  normal,
  emergency,
}

enum MessageDeliveryStatus {
  pending,
  relaying,
  delivered,
  failed,
}

class Message {
  const Message({
    required this.id,
    required this.senderPeerId,
    required this.content,
    required this.createdAt,
    required this.hopCount,
    this.priority = MessagePriority.normal,
    this.status = MessageDeliveryStatus.pending,
    this.maxHopCount = 6,
  });

  final String id;
  final String senderPeerId;
  final String content;
  final DateTime createdAt;
  final int hopCount;
  final int maxHopCount;
  final MessagePriority priority;
  final MessageDeliveryStatus status;

  bool get canRelay => hopCount < maxHopCount;

  Message withRelayHop() {
    return Message(
      id: id,
      senderPeerId: senderPeerId,
      content: content,
      createdAt: createdAt,
      hopCount: hopCount + 1,
      maxHopCount: maxHopCount,
      priority: priority,
      status: MessageDeliveryStatus.relaying,
    );
  }

  Message copyWith({
    String? id,
    String? senderPeerId,
    String? content,
    DateTime? createdAt,
    int? hopCount,
    int? maxHopCount,
    MessagePriority? priority,
    MessageDeliveryStatus? status,
  }) {
    return Message(
      id: id ?? this.id,
      senderPeerId: senderPeerId ?? this.senderPeerId,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      hopCount: hopCount ?? this.hopCount,
      maxHopCount: maxHopCount ?? this.maxHopCount,
      priority: priority ?? this.priority,
      status: status ?? this.status,
    );
  }
}
