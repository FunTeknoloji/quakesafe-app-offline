import 'package:flutter/material.dart';

import '../../../shared/widgets/feature_scaffold.dart';

class MeshChatPage extends StatelessWidget {
  const MeshChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FeatureScaffold(
      title: 'Mesh Chat',
      description: 'Bluetooth / nearby mesh communication module entry point.',
    );
  }
}
