import 'package:flutter/material.dart';

import '../../domain/entities/message.dart';
import '../../domain/entities/peer.dart';

class MeshChatScreen extends StatelessWidget {
  const MeshChatScreen({
    required this.peers,
    required this.messages,
    required this.onConnectPeer,
    super.key,
  });

  final List<Peer> peers;
  final List<Message> messages;
  final ValueChanged<String> onConnectPeer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mesh Chat')),
      body: Column(
        children: [
          _PeerList(peers: peers, onConnectPeer: onConnectPeer),
          const Divider(height: 1),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final timestamp = TimeOfDay.fromDateTime(message.createdAt).format(context);
                final emergency = message.priority == MessagePriority.emergency;

                return ListTile(
                  leading: emergency
                      ? const Icon(Icons.warning_amber_rounded, color: Colors.red)
                      : const Icon(Icons.message_outlined),
                  title: Text(message.content),
                  subtitle: Text('Hop: ${message.hopCount} • $timestamp'),
                  trailing: emergency
                      ? Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.red.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'ACIL',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        )
                      : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _PeerList extends StatelessWidget {
  const _PeerList({required this.peers, required this.onConnectPeer});

  final List<Peer> peers;
  final ValueChanged<String> onConnectPeer;

  Color _statusColor(PeerConnectionState state) {
    switch (state) {
      case PeerConnectionState.connected:
        return Colors.green;
      case PeerConnectionState.connecting:
        return Colors.orange;
      case PeerConnectionState.scanning:
        return Colors.blue;
      case PeerConnectionState.disconnected:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        itemCount: peers.length,
        itemBuilder: (context, index) {
          final peer = peers[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: _statusColor(peer.connectionState),
              child: Text(peer.displayName.isEmpty ? '?' : peer.displayName[0]),
            ),
            title: Text(peer.displayName),
            subtitle: Text('Durum: ${peer.connectionState.name}'),
            trailing: OutlinedButton(
              onPressed: peer.connectionState == PeerConnectionState.connected
                  ? null
                  : () => onConnectPeer(peer.id),
              child: const Text('Bağlan'),
            ),
          );
        },
      ),
    );
  }
}
