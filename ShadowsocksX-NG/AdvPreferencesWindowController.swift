//
//  AdvPreferencesWindowController.swift
//  ShadowsocksX-NG
//
//  Created by 邱宇舟 on 16/6/6.
//  Copyright © 2016年 qiuyuzhou. All rights reserved.
//

import Cocoa
import Alamofire

class AdvPreferencesWindowController: NSWindowController, NSWindowDelegate,NSTextFieldDelegate {
    
    
    @IBOutlet weak var accessTimeField: NSTextField!
    @IBOutlet weak var accessHostField: NSTextField!
    var originTime = PingServers.instance.accessTimeout
    
    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        self.window?.delegate = self
        self.accessTimeField.stringValue = "\(PingServers.instance.accessTimeout)"
        self.accessHostField.stringValue = PingServers.instance.accessHost
        self.accessTimeField.delegate = self
        self.accessHostField.delegate = self
        
    }
    
    
    //------------------------------------------------------------
    // NSWindowDelegate
    func windowWillClose(_ notification: Notification) {
        NotificationCenter.default
            .post(name: Notification.Name(rawValue: NOTIFY_ADV_CONF_CHANGED), object: nil)
        if originTime !=  PingServers.instance.accessTimeout{
            let configuration = URLSessionConfiguration.default
            configuration.timeoutIntervalForRequest = PingServers.instance.accessTimeout
            PingServers.instance.sharedSessionManager =  Alamofire.SessionManager(configuration: configuration)
        }
        
    }
    
    func controlTextDidChange(_ obj: Notification) {
        if let rel = obj.object as? NSTextField {
            if rel == self.accessTimeField {
                PingServers.instance.accessTimeout = TimeInterval(self.accessTimeField.stringValue)!

            }else if rel == self.accessHostField {
                PingServers.instance.accessHost = rel.stringValue
            }
        }
        

    }
    
}
