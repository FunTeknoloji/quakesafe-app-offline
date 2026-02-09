class MeshSession {
  const MeshSession({
    required this.localPeerId,
    required this.isBluetoothEnabled,
    required this.isScanning,
    required this.connectedPeerIds,
  });

  final String localPeerId;
  final bool isBluetoothEnabled;
  final bool isScanning;
  final Set<String> connectedPeerIds;

  MeshSession copyWith({
    String? localPeerId,
    bool? isBluetoothEnabled,
    bool? isScanning,
    Set<String>? connectedPeerIds,
  }) {
    return MeshSession(
      localPeerId: localPeerId ?? this.localPeerId,
      isBluetoothEnabled: isBluetoothEnabled ?? this.isBluetoothEnabled,
      isScanning: isScanning ?? this.isScanning,
      connectedPeerIds: connectedPeerIds ?? this.connectedPeerIds,
    );
  }
}
