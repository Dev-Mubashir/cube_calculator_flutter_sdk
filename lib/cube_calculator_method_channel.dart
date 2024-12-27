import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'cube_calculator_platform_interface.dart';

/// An implementation of [CubeCalculatorPlatform] that uses method channels.
class MethodChannelCubeCalculator extends CubeCalculatorPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('cube_calculator');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
