import 'package:flutter/material.dart';

import '../../../shared/widgets/feature_scaffold.dart';

class AlertsPage extends StatelessWidget {
  const AlertsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FeatureScaffold(
      title: 'Alerts',
      description: 'Earthquake alerts and notifications module entry point.',
    );
  }
}
