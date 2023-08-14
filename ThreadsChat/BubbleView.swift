//
//  BubbleView.swift
//  ThreadsChat
//
//  Created by Jeroen Leenarts on 31/07/2023.
//

import SwiftUI

struct BubbleView: View {
    var replyCount: Int
    var body: some View {
        switch replyCount {
        case 0:
            Spacer()
        case 1:
            Image(systemName: "person")
                .resizable()
                .frame(width: 15, height: 15)
                .clipShape(Circle())
                .aspectRatio(contentMode: .fit)
        case 2:
            HStack {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .clipShape(Circle())
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .clipShape(Circle())
                    .aspectRatio(contentMode: .fit)
            }
        default:
            ZStack {
                Image(uiImage: UIImage(named: "kimmy")!)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: -30, trailing: -5))
                Image(uiImage: UIImage(named: "jeroen")!)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 30))
                Image(uiImage: UIImage(named: "amos")!)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: -20))
            }
        }
    }
}

struct BubbleView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleView(replyCount: 0)
        BubbleView(replyCount: 1)
        BubbleView(replyCount: 2)
        BubbleView(replyCount: 3)
    }
}
