//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <gstmobieservice_marketplace/gstmobileservices_plugin.h>
#include <webcrypto/webcrypto_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) gstmobieservice_marketplace_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "GstmobileservicesPlugin");
  gstmobileservices_plugin_register_with_registrar(gstmobieservice_marketplace_registrar);
  g_autoptr(FlPluginRegistrar) webcrypto_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "WebcryptoPlugin");
  webcrypto_plugin_register_with_registrar(webcrypto_registrar);
}
