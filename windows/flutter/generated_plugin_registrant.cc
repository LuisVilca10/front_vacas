//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <cloud_firestore/cloud_firestore_plugin_c_api.h>
<<<<<<< HEAD
#include <firebase_core/firebase_core_plugin_c_api.h>
#include <geolocator_windows/geolocator_windows.h>
=======
#include <file_selector_windows/file_selector_windows.h>
#include <firebase_core/firebase_core_plugin_c_api.h>
#include <geolocator_windows/geolocator_windows.h>
#include <share_plus/share_plus_windows_plugin_c_api.h>
#include <url_launcher_windows/url_launcher_windows.h>
>>>>>>> 6fac0a550ff4b02b5324cf66f8273fedcd064f7c

void RegisterPlugins(flutter::PluginRegistry* registry) {
  CloudFirestorePluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("CloudFirestorePluginCApi"));
<<<<<<< HEAD
=======
  FileSelectorWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FileSelectorWindows"));
>>>>>>> 6fac0a550ff4b02b5324cf66f8273fedcd064f7c
  FirebaseCorePluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FirebaseCorePluginCApi"));
  GeolocatorWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("GeolocatorWindows"));
<<<<<<< HEAD
=======
  SharePlusWindowsPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("SharePlusWindowsPluginCApi"));
  UrlLauncherWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("UrlLauncherWindows"));
>>>>>>> 6fac0a550ff4b02b5324cf66f8273fedcd064f7c
}
