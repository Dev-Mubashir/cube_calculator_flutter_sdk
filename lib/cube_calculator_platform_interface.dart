import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'cube_calculator_method_channel.dart';

abstract class CubeCalculatorPlatform extends PlatformInterface {
  /// Constructs a CubeCalculatorPlatform.
  CubeCalculatorPlatform() : super(token: _token);

  static final Object _token = Object();

  static CubeCalculatorPlatform _instance = MethodChannelCubeCalculator();

  /// The default instance of [CubeCalculatorPlatform] to use.
  ///
  /// Defaults to [MethodChannelCubeCalculator].
  static CubeCalculatorPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CubeCalculatorPlatform] when
  /// they register themselves.
  static set instance(CubeCalculatorPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
