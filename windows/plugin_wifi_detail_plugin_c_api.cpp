#include "include/plugin_wifi_detail/plugin_wifi_detail_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "plugin_wifi_detail_plugin.h"

void PluginWifiDetailPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  plugin_wifi_detail::PluginWifiDetailPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
