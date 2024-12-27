import 'package:flutter_test/flutter_test.dart';
import 'package:cube_calculator/cube_calculator.dart';
import 'package:cube_calculator/cube_calculator_platform_interface.dart';
import 'package:cube_calculator/cube_calculator_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCubeCalculatorPlatform
    with MockPlatformInterfaceMixin
    implements CubeCalculatorPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CubeCalculatorPlatform initialPlatform = CubeCalculatorPlatform.instance;

  test('$MethodChannelCubeCalculator is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCubeCalculator>());
  });

  test('getPlatformVersion', () async {
    CubeCalculator cubeCalculatorPlugin = CubeCalculator();
    MockCubeCalculatorPlatform fakePlatform = MockCubeCalculatorPlatform();
    CubeCalculatorPlatform.instance = fakePlatform;

    expect(await cubeCalculatorPlugin.getPlatformVersion(), '42');
  });
}
