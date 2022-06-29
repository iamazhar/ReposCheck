//
//  ReposCheckApp.swift
//  ReposCheck
//
//  Created by Azhar Anwar on 29/06/22.
//

import SwiftUI

@main
struct ReposCheckApp: App {
  
  @NSApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
  
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate, ObservableObject {
  
  private var statusItem: NSStatusItem!
  private var popover: NSPopover!
  
  func applicationDidFinishLaunching(_ notification: Notification) {
    statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    
    if let statusButton = statusItem.button {
      statusButton.image = NSImage(systemSymbolName: "arrow.up.forward.circle", accessibilityDescription: "Arrow up")
      statusButton.action = #selector(togglePopover)
    }
    
    self.popover = NSPopover()
    self.popover.contentSize = NSSize(width: 500, height: 800)
    self.popover.behavior = .transient
    self.popover.contentViewController = NSHostingController(rootView: ContentView())
  }
  
  @objc
  private func togglePopover() {
    if let button = statusItem.button {
      if popover.isShown {
        self.popover.performClose(nil)
      } else {
        popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
      }
    }
  }
  
}
