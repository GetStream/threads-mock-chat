//
//  ThreadView.swift
//  ThreadsChat
//
//  Created by Jeroen Leenarts on 02/08/2023.
//

import SwiftUI

struct ThreadView: View {
    @StateObject
    var model: ThreadActivityRowModel
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        HStack {
                            ZStack(alignment: .bottomTrailing) {
                                Image(uiImage: model.avatarImage)
                                    .resizable()
                                    .frame(width: 30,height: 30)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                                ZStack {
                                    Circle()
                                        .frame(width: 15,height: 15)
                                        .foregroundColor(.white)
                                    Image(systemName: "heart.circle.fill")
                                        .resizable()
                                        .frame(width: 15,height: 15)
                                        .foregroundColor(.red)
                                }
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: -5, trailing: -5))
                            }
                            Text(model.username)
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.blue)
                        }
                    }
                    Spacer()
                    Text(model.postAge)
                        .foregroundColor(.secondary)
                    Text("···")
                    
                }
                Text(model.message)
                    .frame(maxWidth: .infinity, alignment: .leading)
                if let image = model.image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(15)
                }
                HStack {
                    Image(systemName: "heart")
                    Image(systemName: "bubble.right")
                    Image(systemName: "repeat")
                    Image(systemName: "paperplane")
                    Spacer()
                }
                .padding(.top, 10)
                Text(model.footer)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.secondary)
//                Spacer()
                ForEach(model.replies) { reply in
                    Divider()
                        .padding(.horizontal,0)
                    ThreadActivityRowView(model: reply)
                }
                .listStyle(PlainListStyle())
            }
            .padding()
        }
        .navigationTitle("Thread")
    }
}

struct ThreadView_Previews: PreviewProvider {
    static var previews: some View {
        let model = ThreadActivityRowModel(id: "1", username: "nash", message: "Hello world!", image: UIImage(named: "Swift"), likeCount: 8, replyCount: 23, postAge: "10m", replies: [
            ThreadActivityRowModel(id: "5", username: "kimmy", message: "This is awesome!", image: nil, likeCount: 51, replyCount: 1, postAge: "30mh"),
            ThreadActivityRowModel(id: "6", username: "jeroen", message: "Such a cool feature.", image: nil, likeCount: 51, replyCount: 1, postAge: "10m"),
            ThreadActivityRowModel(id: "7", username: "amos", message: "Let's go!", image: nil, likeCount: 51, replyCount: 1, postAge: "1m")])
        
        ThreadView(model: model)
    }
}
