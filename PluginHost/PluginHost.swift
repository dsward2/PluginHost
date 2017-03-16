//
//  PluginHost.swift
//  PluginHost
//
//  Created by Douglas Ward on 3/15/17.
//  Copyright © 2017 ArkPhone LLC. All rights reserved.
//

import Cocoa
import Plugin


@objc open class PluginHost: NSObject, PluginHostDelegate {

    /// aPluginHostProperty is a string property in PluginHost to test callbacks from a Plugin object
    @objc public var aPluginHostProperty = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    /// plugins is an array of Plugin objects loaded from embedded bundles
    var plugins: [Plugin] = []
    
    /// loadPluginsFromPath - Plugin loading code adapted from "Swift Plugins Example" by Jarek Pendowski - https://github.com/pendowski/SwiftPluginsExample

    ///
    /// - Parameter path: path to plugin folder for bundles embedded in the app
    func loadPluginsFromPath(_ path: String)
    {
        let fileManager = FileManager.default
        
        let pluginsPathURL = URL(fileURLWithPath: path)
        
        guard let enumerator = fileManager.enumerator(at: pluginsPathURL, includingPropertiesForKeys: [ URLResourceKey.nameKey, URLResourceKey.isDirectoryKey ], options: [ .skipsHiddenFiles, .skipsSubdirectoryDescendants ], errorHandler: nil) else {
            
            return
        }
        
        while let item = enumerator.nextObject() as? URL {
            do {
                var isDirectory: AnyObject?
                try (item as NSURL).getResourceValue(&isDirectory, forKey: URLResourceKey.isDirectoryKey)
                
                if let urlPath = (item as NSURL).path, urlPath.hasSuffix("plugin"),
                    let isDirectory = isDirectory as? NSNumber, isDirectory.boolValue,
                    let bundle = Bundle(url: item), bundle.load() {
                        let pluginMetatype = bundle.principalClass as? Plugin.Type
                        if (pluginMetatype != nil) {
                            let plugin = pluginMetatype?.init(pluginHost:self)
                            if (plugin != nil) {
                                plugins.append(plugin!)
                                print("PluginHost - Loaded plugin named \(plugin!.name)")
                            }
                        }
                }
                else { print("PluginHost - loadPluginsFromPath .plugin bundle file name extension error") }
                
            } catch _ { print("PluginHost - loadPluginsFromPath failed") }
        }
    }
}
