//
//  ThreadActivityRowView.swift
//  ThreadsChat
//
//  Created by Jeroen Leenarts on 13/08/2023.
//

import SwiftUI

struct ThreadActivityRowView: View {
    @StateObject
    var model: ThreadActivityRowModel
    var body: some View {
        NavigationLink {
            ThreadView(model: model)
        } label: {
            VStack {
                HStack {
                    VStack {
                        ZStack(alignment: .bottomTrailing) {
                            Image(uiImage: model.avatarImage)
                                .resizable()
                                .frame(width: 30, height: 30)
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                            ZStack {
                                Circle()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(.white)
                                Image(systemName: "heart.circle.fill")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(.red)
                            }
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: -5, trailing: -5))
                        }
                        if model.isReply {
                            Spacer()
                        } else {
                            HStack {
                                Divider()
                            }
                        }
                    }

                    VStack {
                        HStack {
                            Text(model.username)
                                .foregroundColor(.primary)

                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.blue)
                            Spacer()
                            Text(model.postAge)
                                .foregroundColor(.secondary)
                            Text("···")

                        }
                        Text(model.message)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.primary)
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
                    }
                }
                HStack {
                    if model.isReply {
                        Text(model.footer)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.secondary)
                            .padding(.leading, 40)
                    } else {
                        BubbleView(replyCount: model.replyCount)
                            .frame(width: 30, height: .infinity)

                        Text(model.footer)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.secondary)
                    }
                }
                Spacer()
            }
        }
    }
}

class ThreadActivityRowModel: ObservableObject, Identifiable {
    init(id: String,
         username: String,
         message: String,
         image: UIImage?,
         likeCount: Int,
         replyCount: Int,
         postAge: String) {
        self.id = id
        self.username = username
        self.message = message
        self.image = image
        self.likeCount = likeCount
        self.replyCount = replyCount
        self.postAge = postAge
        self.replies = []
        self.isReply = true
    }

    init(id: String,
         username: String,
         message: String,
         image: UIImage?,
         likeCount: Int,
         replyCount: Int,
         postAge: String,
         replies: [ThreadActivityRowModel]) {
        self.id = id
        self.username = username
        self.message = message
        self.image = image
        self.likeCount = likeCount
        self.replyCount = replyCount
        self.postAge = postAge
        self.replies = replies
        self.isReply = false
    }

    var id: String
    var username: String
    var message: String
    var image: UIImage?
    var likeCount: Int
    var replyCount: Int
    var postAge: String
    var isReply: Bool
    var replies: [ThreadActivityRowModel]

    private var likeString: String? {
        switch likeCount {
        case 0:
            return nil
        case 1:
            return "1 like"
        default:
            return "\(likeCount) likes"
        }
    }

    private var replyString: String? {
        switch replyCount {
        case 0:
            return nil
        case 1:
            return "1 reply"
        default:
            return "\(replyCount) replies"
        }
    }

    var footer: String {
        let footerStrings: [String] = [likeString, replyString].compactMap { $0 }
        return footerStrings.joined(separator: " • ")
    }

    var avatarImage: UIImage {
        return UIImage(named: username) ?? UIImage(systemName: "person")!
    }
}

struct ThreadActivityRowView_Previews: PreviewProvider {
    static var previews: some View {
        ThreadActivityRowView(model: ThreadActivityRowModel(id: "2", username: "amos", message: "Hello world too!", image: UIImage(named: "Hotel"), likeCount: 51, replyCount: 1, postAge: "1h", replies: []))
    }
}
