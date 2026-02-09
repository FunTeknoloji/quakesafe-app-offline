import 'package:flutter/material.dart';

import '../widgets/section_card.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<String> messages = [
    'Komşu ağ bulundu: Apartman-A',
    'Konum: Güvenli toplanma alanına geçiyorum.',
  ];
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SectionCard(
          title: 'Mesh Durumu',
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.bluetooth_connected),
            title: Text('Yerel yayın aktif (simülasyon)'),
            subtitle: Text('Gerçek Bluetooth mesh entegrasyonu bir sonraki adımda eklenecek.'),
          ),
        ),
        const SizedBox(height: 12),
        SectionCard(
          title: 'Acil Mesajlar',
          child: Column(
            children: [
              ...messages.map((m) => ListTile(contentPadding: EdgeInsets.zero, title: Text(m))),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Mesaj yaz...',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      if (controller.text.trim().isEmpty) return;
                      setState(() {
                        messages.add(controller.text.trim());
                        controller.clear();
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
