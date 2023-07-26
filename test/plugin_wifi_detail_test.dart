import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_wifi_detail/plugin_wifi_detail.dart';
import 'package:plugin_wifi_detail/plugin_wifi_detail_platform_interface.dart';
import 'package:plugin_wifi_detail/plugin_wifi_detail_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPluginWifiDetailPlatform
    with MockPlatformInterfaceMixin
    implements PluginWifiDetailPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PluginWifiDetailPlatform initialPlatform = PluginWifiDetailPlatform.instance;

  test('$MethodChannelPluginWifiDetail is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPluginWifiDetail>());
  });

  test('getPlatformVersion', () async {
    PluginWifiDetail pluginWifiDetailPlugin = PluginWifiDetail();
    MockPluginWifiDetailPlatform fakePlatform = MockPluginWifiDetailPlatform();
    PluginWifiDetailPlatform.instance = fakePlatform;

    expect(await pluginWifiDetailPlugin.getPlatformVersion(), '42');
  });
}
