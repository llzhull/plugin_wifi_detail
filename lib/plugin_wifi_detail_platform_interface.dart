import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'plugin_wifi_detail_method_channel.dart';

abstract class PluginWifiDetailPlatform extends PlatformInterface {
  /// Constructs a PluginWifiDetailPlatform.
  PluginWifiDetailPlatform() : super(token: _token);

  static final Object _token = Object();

  static PluginWifiDetailPlatform _instance = MethodChannelPluginWifiDetail();

  /// The default instance of [PluginWifiDetailPlatform] to use.
  ///
  /// Defaults to [MethodChannelPluginWifiDetail].
  static PluginWifiDetailPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PluginWifiDetailPlatform] when
  /// they register themselves.
  static set instance(PluginWifiDetailPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
  Future<String?> getSSID() {
    throw UnimplementedError('SSID() has not been implemented.');
  }
  Future<int?> getRxLinkSpeedMbps() {
    throw UnimplementedError('rxLinkSpeedMbps() has not been implemented.');
  }
  Future<int?> getLinkSpeed() {
    throw UnimplementedError('linkSpeed() has not been implemented.');
  }
  Future<int?> getSignal() {
    throw UnimplementedError('signal() has not been implemented.');
  }
  Future<String?> getIP() {
    throw UnimplementedError('IP() has not been implemented.');
  }
  Future<String?> getHostAddress() {
    throw UnimplementedError('hostAddress() has not been implemented.');
  }
  Future<String?> getDnsServers() {
    throw UnimplementedError('dnsServers() has not been implemented.');
  }
}
