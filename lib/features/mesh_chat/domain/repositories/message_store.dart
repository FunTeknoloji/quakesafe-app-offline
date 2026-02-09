import '../entities/message.dart';

abstract class MessageStore {
  Stream<List<Message>> watchConversation();

  Future<void> save(Message message);
  Future<void> markAsDelivered(String messageId);
  Future<void> markAsFailed(String messageId);

  Future<List<Message>> loadPendingForForwarding();
}
