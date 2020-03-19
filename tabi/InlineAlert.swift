//
//  InlineAlert.swift
//  tabi
//
//  Created by ATSUHITO KITA on 3/18/20.
//  Copyright © 2020 ATSUHITO KITA. All rights reserved.
//

import SwiftUI

enum AlertIntent {
    case info, success, question, danger, warning
}

struct InlineAlert : View {
    
    var title: String
    var subtitle: String
    var intent: AlertIntent = .info
    
    var body: some View {
        HStack {
            Image(systemName: "exclamationmark.triangle.fill")
                .padding(.vertical)
                .foregroundColor(Color.white)
        
            VStack(alignment: .leading) {
                Text(self.title)
                    .font(.body)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                Text(self.subtitle)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
            }.padding(.leading)
        }
    }
}

#if DEBUG
struct InlineAlert_Previews : PreviewProvider {
    static var previews: some View {
        InlineAlert(
            title: "Nostrud non magna quis veniam dolore magna voluptate.",
            subtitle: "Nulla id amet reprehenderit laboris irure Lorem ex esse eiusmod eiusmod occaecat officia. Quis in reprehenderit dolor veniam id sunt mollit reprehenderit.",
            intent: .info
        ).frame(height: 300)
    }
}
#endif
