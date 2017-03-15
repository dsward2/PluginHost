//
//  PluginTestA.swift
//  PluginTestA
//
//  Created by Douglas Ward on 3/15/17.
//  Copyright © 2017 ArkPhone LLC. All rights reserved.
//

import Cocoa
import Plugin

class PluginTestA: Plugin {

    public required init(pluginHost: PluginHostDelegate) {
        super.init(pluginHost: pluginHost)

        print("Hello from PluginTestA")
    }
}
