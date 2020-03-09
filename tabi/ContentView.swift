//
//  ContentView.swift
//  tabi
//
//  Created by ATSUHITO KITA on 3/4/20.
//  Copyright © 2020 ATSUHITO KITA. All rights reserved.
//

import SwiftUI

private let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    return dateFormatter
}()

struct ContentView: View {
//    @State private var dates = [Date]()
    var posts: [Post] = []
    var body: some View{
        NavigationView {
            VStack {
                List(posts){ post in
                    PostCell(post: post)
                }
                .navigationBarTitle(Text("Posts"))
            
                Button(action: {
                }) {
                    Text("Send Message")
                        .padding(.horizontal, 12.0)
                        .padding(.vertical, 6.0)
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            }
        }
        
    }
}

struct MasterView: View {
    @Binding var dates: [Date]

    var body: some View {
        List {
            ForEach(dates, id: \.self) { date in
                NavigationLink(
                    destination: DetailView(selectedDate: date)
                ) {
                    Text("\(date, formatter: dateFormatter)")
                }
            }.onDelete { indices in
                indices.forEach { self.dates.remove(at: $0) }
            }
        }
    }
}

struct DetailView: View {
    var selectedDate: Date?

    var body: some View {
        Group {
            if selectedDate != nil {
                Text("\(selectedDate!, formatter: dateFormatter)")
            } else {
                Text("Detail view content goes here")
            }
        }.navigationBarTitle(Text("Detail"))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(posts: testData)
    }
}

struct PostCell: View {
    let post: Post
    
    var body: some View {
        NavigationLink(destination: PostDetail(post: post)) {
            VStack {
                Image(post.thumbnailName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 75, height: 75)
                    .cornerRadius(128)
            }
            
            VStack(alignment: .leading) {
                Text(post.title)                
                HStack(spacing: 6.0) {
                    Text("\(post.nationality)")
                    Text("\(post.gender)")
                    Text("Age:\(post.age)")
                    Text("with \(post.party) people")
                }
                    .font(.system(size: 12.5))
                    .foregroundColor(.secondary)
                    .padding(.top, 4.0)
                Text("\(post.createdDate, formatter: dateFormatter)")
                    .font(.system(size: 11))
                    .foregroundColor(.secondary)
                    .padding(.top, 4.0)
                    .offset(x: 200)
            }
            .padding([.top, .leading], 12.0)
        }
        
    }
}
