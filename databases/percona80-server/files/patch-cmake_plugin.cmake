--- cmake/plugin.cmake.orig	2021-12-17 16:07:27 UTC
+++ cmake/plugin.cmake
@@ -247,15 +247,15 @@ MACRO(MYSQL_ADD_PLUGIN plugin_arg)
 
       # For testing purposes, we need
       # <...>/lib/plugin/debug/authentication_ldap_sasl_client.so
-      IF(ARG_CLIENT_ONLY)
-        INSTALL_DEBUG_TARGET(${target}
-          DESTINATION ${INSTALL_PLUGINDIR}/debug
-          COMPONENT Test)
-      ELSE()
-        INSTALL_DEBUG_TARGET(${target}
-          DESTINATION ${INSTALL_PLUGINDIR}/debug
-          COMPONENT ${INSTALL_COMPONENT})
-      ENDIF()
+#      IF(ARG_CLIENT_ONLY)
+#        INSTALL_DEBUG_TARGET(${target}
+#          DESTINATION ${INSTALL_PLUGINDIR}/debug
+#          COMPONENT Test)
+#      ELSE()
+#        INSTALL_DEBUG_TARGET(${target}
+#          DESTINATION ${INSTALL_PLUGINDIR}/debug
+#          COMPONENT ${INSTALL_COMPONENT})
+#      ENDIF()
     ENDIF()
   ELSE()
     IF(WITHOUT_${plugin})
