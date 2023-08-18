//
//  ThreadsChatApp.swift
//  ThreadsChat
//
//  Created by Jeroen Leenarts on 31/07/2023.
//

import SwiftUI
import StreamChat
import StreamChatSwiftUI

@main
struct ThreadsChatApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ThreadsTabView()
        }
    }
}
