//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Luis Alvarez on 1/22/21.
//

import SwiftUI

//This view just outputs the emoji corresponding to the given int
// Int corresponds to rating.
// Good rating == 100 emoji etc
struct EmojiRatingView: View {
    
    let rating:Int16
    
    var body: some View {
        switch rating {
            case 1:
                return Text("😡")
            case 2:
                return Text("💩")
            case 3:
                return Text("😕")
            case 4:
                return Text("😁")
        default:
            return Text("💯")
        }
    }
}

struct EmojiRatingView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingView(rating: 3)
    }
}
