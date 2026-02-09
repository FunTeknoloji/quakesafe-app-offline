import '../entities/message.dart';
import '../entities/peer.dart';

abstract class MeshTransportService {
  Stream<List<Peer>> watchDiscoveredPeers();
  Stream<String> watchConnectedPeerIds();
  Stream<Message> watchInboundMessages();

  Future<void> startScanning();
  Future<void> stopScanning();
  Future<void> pairWithPeer(String peerId);
  Future<void> disconnectPeer(String peerId);

  Future<bool> relayMessage({
    required Message message,
    String? onlyToPeerId,
  });
}
