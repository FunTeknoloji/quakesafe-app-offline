enum PeerConnectionState {
  disconnected,
  scanning,
  connecting,
  connected,
}

class Peer {
  const Peer({
    required this.id,
    required this.displayName,
    required this.lastSeen,
    this.rssi,
    this.connectionState = PeerConnectionState.disconnected,
  });

  final String id;
  final String displayName;
  final DateTime lastSeen;
  final int? rssi;
  final PeerConnectionState connectionState;

  Peer copyWith({
    String? id,
    String? displayName,
    DateTime? lastSeen,
    int? rssi,
    PeerConnectionState? connectionState,
  }) {
    return Peer(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      lastSeen: lastSeen ?? this.lastSeen,
      rssi: rssi ?? this.rssi,
      connectionState: connectionState ?? this.connectionState,
    );
  }
}
