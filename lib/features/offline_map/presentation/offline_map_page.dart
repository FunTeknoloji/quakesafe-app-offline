import 'package:flutter/material.dart';

import '../../../shared/widgets/feature_scaffold.dart';

class OfflineMapPage extends StatelessWidget {
  const OfflineMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FeatureScaffold(
      title: 'Offline Map',
      description: 'Offline map tiles and geolocation module entry point.',
    );
  }
}
