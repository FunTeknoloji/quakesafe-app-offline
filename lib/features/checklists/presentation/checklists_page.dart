import 'package:flutter/material.dart';

import '../../../shared/widgets/feature_scaffold.dart';

class ChecklistsPage extends StatelessWidget {
  const ChecklistsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FeatureScaffold(
      title: 'Checklists',
      description: 'Emergency preparation and response checklists module entry point.',
    );
  }
}
