# PluginHost - A Swift application for macOS with a plugin framework and callbacks

This Swift language project for XCode demonstrates an application with Cocoa's plugin architecture, with a framework for the plugins, and callbacks from the plugins to the host application.

Two subprojects are included within the main project:

The Plugin subproject defines the Plugin.framework.  It includes a protocol for callbacks to the host application.

The PluginTestA subproject implements a plugin based on Plugin.framework.

Open PluginHost.xcworkspace and build the Plugin framework and PluginHost application.  The main application and plugins will send this output to the Xcode console to verify that the architecture works -

```Plugin.framework - callback to host application succeeded - aPluginHostProperty = Optional("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ")
Hello from PluginTestA
PluginHost - Loaded plugin named Optional("PluginTestA")
```

The plugin loading code is adapted from "Swift Plugins Example" by Jarek Pendowski -

https://github.com/pendowski/SwiftPluginsExample

http://blog.pendowski.com/plugin-architecture-in-swift-ish/

See Apple's 'Plugin Architectures' guide for information about Cocoa plugin bundles -

https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/LoadingCode/Concepts/Plugins.html
