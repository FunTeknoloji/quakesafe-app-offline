import 'dart:async';

import '../domain/entities/message.dart';
import '../domain/entities/peer.dart';
import '../domain/repositories/message_store.dart';
import '../domain/services/mesh_transport_service.dart';

class MeshChatController {
  MeshChatController({
    required MeshTransportService transport,
    required MessageStore store,
  })  : _transport = transport,
        _store = store;

  final MeshTransportService _transport;
  final MessageStore _store;

  StreamSubscription<Message>? _inboundSub;

  Stream<List<Peer>> get peers => _transport.watchDiscoveredPeers();
  Stream<List<Message>> get messages => _store.watchConversation();

  Future<void> initialize() async {
    _inboundSub = _transport.watchInboundMessages().listen((message) async {
      await _store.save(message);
      await _attemptForward(message);
    });

    await _transport.startScanning();
    await retryPendingMessages();
  }

  Future<void> dispose() async {
    await _inboundSub?.cancel();
    await _transport.stopScanning();
  }

  Future<void> connectToPeer(String peerId) => _transport.pairWithPeer(peerId);

  Future<void> sendMessage(Message message) async {
    await _store.save(message);

    final delivered = await _transport.relayMessage(message: message);
    if (delivered) {
      await _store.markAsDelivered(message.id);
      return;
    }

    await _store.markAsFailed(message.id);
  }

  Future<void> retryPendingMessages() async {
    final pending = await _store.loadPendingForForwarding();
    for (final message in pending) {
      await _attemptForward(message);
    }
  }

  Future<void> _attemptForward(Message message) async {
    if (!message.canRelay) {
      return;
    }

    final relayed = await _transport.relayMessage(message: message.withRelayHop());
    if (relayed) {
      await _store.markAsDelivered(message.id);
    }
  }
}
