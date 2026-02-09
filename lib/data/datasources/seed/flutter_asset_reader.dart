import 'package:flutter/services.dart';

import 'asset_seed_loader.dart';

AssetReader flutterAssetReader = (String path) => rootBundle.loadString(path);
