//
//  ThreadsTabView.swift
//  ThreadsChat
//
//  Created by Jeroen Leenarts on 13/08/2023.
//

import SwiftUI

struct ThreadsTabsView: View {
    var body: some View {
        TabView {
            NavigationStack {
                ThreadsView()
            }
                .tabItem {
                    Image(systemName: "house")
                }

            Text("")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }

            Text("")
                .tabItem {
                    Image(systemName: "square.and.pencil")
                }

            Text("")
                .tabItem {
                    Image(systemName: "heart")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
        }
    }
}

struct ThreadsTabView_Previews: PreviewProvider {
    static var previews: some View {
        ThreadsTabsView()
    }
}
