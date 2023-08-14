//
//  ProfileView.swift
//  ThreadsChat
//
//  Created by Jeroen Leenarts on 03/08/2023.
//

import SwiftUI

struct ProfileView: View {

    @State private var selectedColorIndex = 0
    @StateObject private var viewModel = ThreadsViewModel()

    let titles = ["Threads", "Replies", "Reposts"]
    @State var selectedIndex: Int?

    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack {
                        Text("Neevash Ramdial")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        HStack {
                            Text("nash0x7e2")
                            Capsule()
                                .fill(.tertiary)
                                .frame(width: 80)
                                .overlay {
                                    Text("threads.net")
                                        .font(.footnote)
                                        .foregroundColor(.secondary)
                                }
                            Spacer()
                        }

                    }
                    Spacer()
                    Image(uiImage: UIImage(named: "nash")!)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                }
                Text("Leading #DevRel/Dev Marketing at @getstream_io • @GoogleDevExpert Dart & Flutter • @FlutterComm • Formula 1 fanatic • Striving for excellence")
                HStack {
                    Image(uiImage: UIImage(named: "nash")!)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                    Image(uiImage: UIImage(named: "nash")!)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .padding(EdgeInsets(top: 0, leading: -15, bottom: 0, trailing: 0))
                    Image(uiImage: UIImage(named: "nash")!)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .padding(EdgeInsets(top: 0, leading: -15, bottom: 0, trailing: 0))
                    Text("50 followers • neevash.dev")
                    Spacer()
                }
                HStack {
                    Button {
                        // TODO
                    } label: {
                        Text("Follow")
                            .frame(minWidth: 100, maxWidth: .infinity, minHeight: 40)
                            .background(Color.primary)
                            .foregroundStyle(.background)
                            .cornerRadius(10)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.gray, lineWidth: 2))
                    }

                    Button {
                        // TODO
                    } label: {
                        Text("Mention")
                            .frame(minWidth: 100, maxWidth: .infinity, minHeight: 40)
                            .background(.background)
                            .foregroundStyle(Color.primary)
                            .cornerRadius(10)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.gray, lineWidth: 2))
                    }

                    NavigationLink {
                        ThreadChatView()
                            .toolbar(.hidden, for: .tabBar)

                    } label: {
                        Text("Chat")
                            .frame(minWidth: 100, maxWidth: .infinity, minHeight: 40)
                            .background(.background )
                            .foregroundStyle(Color.primary)
                            .cornerRadius(10)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.gray, lineWidth: 2))
                    }
                }
                SegmentedPicker(
                            titles,
                            selectedIndex: Binding(
                                get: { selectedIndex },
                                set: { selectedIndex = $0 }),
                            content: { item, isSelected in
                                VStack {
                                    Text(item)
                                        .foregroundColor(isSelected ? Color("primaryThreads") : Color.gray )
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 8)
                                        .frame(maxWidth: .infinity)
                                    Color.gray.frame(height: 1)
                                }
                            },
                            selection: {
                                VStack(spacing: 0) {
                                    Spacer()
                                    Color.primary.frame(height: 1)
                                }
                            })
                            .onAppear {
                                selectedIndex = 0
                            }
                            .frame(maxWidth: .infinity)
                            .animation(.easeInOut(duration: 0.3), value: selectedIndex)

                ForEach(viewModel.activities) { item in
                        ThreadActivityRowView(model: item)
                    }
            }
        }
        .toolbar {
            Spacer()
            Image(uiImage: UIImage(named: "Instagram")!)
                .resizable()
                .frame(width: 20, height: 20)
            Image(systemName: "bell.fill")
            Image(systemName: "ellipsis.circle")
        }
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProfileView()
        }
    }
}
