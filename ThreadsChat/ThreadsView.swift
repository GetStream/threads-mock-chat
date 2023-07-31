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
        TabView {
            List(viewModel.activities) { item in
                ThreadActivityRowView(model: item)
            }
            .listStyle(PlainListStyle())
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
            
            Text("")
                .tabItem {
                    Image(systemName: "person")
                }
//
//            Text("")
//                .tabItem {
//                    Image(systemName: "text.bubble")
//                }
        }
    }
}

struct ThreadActivityRowView: View {
    @StateObject
    var model: ThreadActivityRowModel
    var body: some View {
        VStack {
            Spacer()
            HStack{
                VStack {
                    ZStack(alignment: .bottomTrailing) {
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 30,height: 30)
                            .aspectRatio(contentMode: .fit)
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
                    HStack {
                        Divider()
                    }
                }
                
                VStack {
                    HStack {
                        Text(model.username)
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.blue)
                        Spacer()
                        Text(model.postAge)
                            .foregroundColor(.gray)
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
                }
            }
            HStack {
                BubbleView(replyCount: model.replyCount)
                    .frame(width:30, height: .infinity)

                Text(model.footer)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
    }
}

struct ThreadsView_Previews: PreviewProvider {
    static var previews: some View {
        ThreadsView()
    }
}

private class ThreadsViewModel: ObservableObject {
    @Published public var activities: [ThreadActivityRowModel] = [
        ThreadActivityRowModel(id: "1", username: "nash", message: "Hello world!", image: UIImage(named: "Swift"), likeCount: 8, replyCount: 23, postAge: "10m"),
        ThreadActivityRowModel(id: "2", username: "nash", message: "Hello world too!", image: UIImage(named: "Hotel"), likeCount: 51, replyCount: 1, postAge: "1h"),
        ThreadActivityRowModel(id: "3", username: "nash", message: "Hello world! This is going to be a really long message. I want to see what happens with a lond message. Does it work ok?", image: UIImage(named: "React"), likeCount: 5, replyCount: 2, postAge: "2h"),
        ThreadActivityRowModel(id: "4", username: "nash", message: "Hello world! This is going to be a really long message. I want to see what happens with a lond message. Does it work ok?", image: nil, likeCount: 5, replyCount: 0, postAge: "2h")

    ]

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
    
    }
    
    var id: String
    var username: String
    var message: String
    var image: UIImage?
    var likeCount: Int
    var replyCount: Int
    var postAge: String
    
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
            return "1 like"
        default:
            return "\(replyCount) likes"
        }
    }
    
    var footer: String {
        let footerStrings: [String] = [likeString, replyString].compactMap { $0 }
        return footerStrings.joined(separator: " • ")
    }
}

