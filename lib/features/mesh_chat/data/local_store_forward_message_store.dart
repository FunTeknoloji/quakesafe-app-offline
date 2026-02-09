import 'dart:async';

import '../domain/entities/message.dart';
import '../domain/repositories/message_store.dart';

class LocalStoreForwardMessageStore implements MessageStore {
  final _messages = <Message>[];
  final _controller = StreamController<List<Message>>.broadcast();

  @override
  Future<List<Message>> loadPendingForForwarding() async {
    return _messages
        .where((message) => message.status == MessageDeliveryStatus.pending)
        .toList(growable: false);
  }

  @override
  Future<void> markAsDelivered(String messageId) async {
    _updateStatus(messageId, MessageDeliveryStatus.delivered);
  }

  @override
  Future<void> markAsFailed(String messageId) async {
    _updateStatus(messageId, MessageDeliveryStatus.failed);
  }

  @override
  Future<void> save(Message message) async {
    final index = _messages.indexWhere((item) => item.id == message.id);
    if (index == -1) {
      _messages.add(message);
    } else {
      _messages[index] = message;
    }
    _controller.add(List.unmodifiable(_messages));
  }

  @override
  Stream<List<Message>> watchConversation() => _controller.stream;

  void _updateStatus(String messageId, MessageDeliveryStatus status) {
    final index = _messages.indexWhere((item) => item.id == messageId);
    if (index < 0) {
      return;
    }

    _messages[index] = _messages[index].copyWith(status: status);
    _controller.add(List.unmodifiable(_messages));
  }
}
