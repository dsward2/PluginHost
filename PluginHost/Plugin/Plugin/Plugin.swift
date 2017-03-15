//
//  Plugin.swift
//  Plugin
//
//  Created by Douglas Ward on 3/15/17.
//  Copyright © 2017 ArkPhone LLC. All rights reserved.
//

import Cocoa


/// PluginHostDelegate protocol for callback from plugins to the host application
@objc public protocol PluginHostDelegate {
    
    @objc var aPluginHostProperty: String { get set }
}


/// Description
@objc open class Plugin: NSObject {

    /// Plugin name
    @objc public var name: String!
    
    /// PluginHost main app object
    //@objc unowned(unsafe) let pluginHost: PluginHostDelegate
    @objc let pluginHost: PluginHostDelegate
    
    /// Plugin init
    ///
    /// - Parameter pluginHost: the caller, conforming to PluginHostDelegate protocol
    public required init(pluginHost: PluginHostDelegate) {
        self.name = "UnknownPlugin"     // subclasses should modify name property in init phase 2
        
        self.pluginHost = pluginHost    // the host application
        
        super.init()

        let thisClass = self.className
        let thisBundle = Bundle.init(for: NSClassFromString(thisClass)!)
        let bundleName = thisBundle.infoDictionary!["CFBundleName"] as! String
        self.name = bundleName
        
        var aPluginHostProperty: String! = pluginHost.aPluginHostProperty   // test callback to host application
        
        if (aPluginHostProperty.characters.count > 0)
        {
            print("Plugin.framework - callback to host application succeeded - aPluginHostProperty = \(aPluginHostProperty)");
        } else {
            print("Plugin.framework - callback to host application failed");
        }
    }
}
