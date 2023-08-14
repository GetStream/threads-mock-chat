//
//  ThreadsView.swift
//  ThreadsChat
//
//  Created by Jeroen Leenarts on 31/07/2023.
//

import SwiftUI

struct ThreadsView: View {
    
    @StateObject private var viewModel = ThreadsViewModel()

    var body: some View {
        
        List(viewModel.activities) { item in
            ThreadActivityRowView(model: item)
        }
        .listStyle(PlainListStyle())
    }
}


struct ThreadsView_Previews: PreviewProvider {
    static var previews: some View {
        ThreadsView()
    }
}

class ThreadsViewModel: ObservableObject {
    @Published public var activities: [ThreadActivityRowModel] = [
        ThreadActivityRowModel(id: "1", username: "nash", message: "Hello world!", image: UIImage(named: "Swift"), likeCount: 8, replyCount: 23, postAge: "10m", replies: [
            ThreadActivityRowModel(id: "5", username: "kimmy", message: "This is awesome!", image: nil, likeCount: 51, replyCount: 1, postAge: "30mh"),
            ThreadActivityRowModel(id: "6", username: "jeroen", message: "Such a cool feature.", image: nil, likeCount: 51, replyCount: 1, postAge: "10m"),
            ThreadActivityRowModel(id: "7", username: "amos", message: "Let's go!", image: nil, likeCount: 51, replyCount: 1, postAge: "1m")
        ]),
        ThreadActivityRowModel(id: "2", username: "amos", message: "Hello world too!", image: UIImage(named: "Hotel"), likeCount: 51, replyCount: 1, postAge: "1h", replies: []),
        ThreadActivityRowModel(id: "3", username: "kimmy", message: "Hello world! This is going to be a really long message. I want to see what happens with a lond message. Does it work ok?", image: UIImage(named: "React"), likeCount: 5, replyCount: 2, postAge: "2h", replies: []),
        ThreadActivityRowModel(id: "4", username: "jeroen", message: "Hello world! This is going to be a really long message. I want to see what happens with a lond message. Does it work ok?", image: nil, likeCount: 5, replyCount: 0, postAge: "2h", replies: [])

    ]

}

