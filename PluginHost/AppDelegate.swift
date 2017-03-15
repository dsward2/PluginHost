//
//  AppDelegate.swift
//  PluginHost
//
//  Created by Douglas Ward on 3/15/17.
//  Copyright © 2017 ArkPhone LLC. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    
    @IBOutlet weak var pluginHost: PluginHost!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application

        let pluginsPath = Bundle.main.bundlePath + "/Contents/Plugins"
        
        pluginHost.loadPluginsFromPath(pluginsPath)
}

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

}

