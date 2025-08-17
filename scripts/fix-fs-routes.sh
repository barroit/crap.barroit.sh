#!/bin/sh
# SPDX-License-Identifier: GPL-3.0-or-later

cat <<EOF | patch -p1 -N -r /dev/null \
		  -d node_modules/@react-router/fs-routes/dist || true

--- a/index.js	2025-08-16 22:37:16.898785863 +0900
+++ b/index.js	2025-08-16 22:39:25.847309632 +0900
@@ -175,12 +175,13 @@
   let uniqueRoutes = /* @__PURE__ */ new Map();
   let routeIdConflicts = /* @__PURE__ */ new Map();
   let routeIds = /* @__PURE__ */ new Map();
+  let normalizedApp = normalizeSlashes(appDirectory);
+  let appWithPrefix = import_node_path2.default.posix.join(normalizedApp, prefix);
   for (let file of routes) {
     let normalizedFile = normalizeSlashes(file);
     let routeExt = import_node_path2.default.extname(normalizedFile);
     let routeDir = import_node_path2.default.dirname(normalizedFile);
-    let normalizedApp = normalizeSlashes(appDirectory);
-    let routeId = routeDir === import_node_path2.default.posix.join(normalizedApp, prefix) ? import_node_path2.default.posix.relative(normalizedApp, normalizedFile).slice(0, -routeExt.length) : import_node_path2.default.posix.relative(normalizedApp, routeDir);
+    let routeId = routeDir === appWithPrefix ? import_node_path2.default.posix.relative(normalizedApp, normalizedFile).slice(0, -routeExt.length) : import_node_path2.default.posix.relative(normalizedApp, routeDir);
     let conflict = routeIds.get(routeId);
     if (conflict) {
       let currentConflicts = routeIdConflicts.get(routeId);
@@ -201,7 +202,7 @@
     let [segments, raw] = getRouteSegments(routeId.slice(prefix.length + 1));
     let pathname = createRoutePath(segments, raw, index);
     routeManifest[routeId] = {
-      file: file.slice(appDirectory.length + 1),
+      file: import_node_path2.default.posix.relative(normalizedApp, file),
       id: routeId,
       path: pathname
     };
EOF
