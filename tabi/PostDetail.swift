//
//  RoomDetail.swift
//  tabi
//
//  Created by ATSUHITO KITA on 3/5/20.
//  Copyright © 2020 ATSUHITO KITA. All rights reserved.
//

import SwiftUI

struct PostDetail: View {
    let post: Post
    @State private var zoomed = false

    var body: some View {
//        let appURL = URL(string:  "instagram://user?username=\(post.usernameIG)")
//        let webURL = URL(string:  "https://instagram.com/\(post.usernameIG)")
        VStack(){
            HStack {
                Image(post.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .cornerRadius(128)
                Text("\(post.title)")
                    .font(.system(size: 24))
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.all, 30.0)
            }
            HStack(spacing: 10.0) {
                Text("\(post.nationality)")
                Text("\(post.gender)")
                Text("Age: \(post.age)")
                Text("with \(post.party) people")
            }
                .font(.system(size: 16))
                .foregroundColor(.primary)
            Divider()
                .frame(width: 200)
            Text("\(post.message)")
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Button(action: {
                // What to perform
            }) {
                Text("Send Message")
                    .padding(.horizontal, 12.0)
                    .padding(.vertical, 6.0)
                    .foregroundColor(.white)
                    .font(.system(size: 18))
                    .background(Color.blue)
                    .cornerRadius(8)
            }
                .padding(.all)
            Spacer()
        }.padding(.all)
    }
}

struct PostDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PostDetail(post: testData[0])
            PostDetail(post: testData[1])
        }
    }
}
