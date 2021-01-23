//
//  RatingView.swift
//  Bookworm
//
//  Created by Luis Alvarez on 1/22/21.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating:Int
    
    var label = ""
    var maximumRating = 5

    var onImage = Image(systemName: "star.fill")
    var offImage:Image?
    
    var onColor = Color.yellow
    var offColor = Color.gray
    
    var body: some View{
        HStack{
            Text("\(label)")
            
            ForEach(1..<maximumRating + 1){ num in
                imageType(for: num)
                    .foregroundColor(num <= rating ? onColor : offColor)
                    .onTapGesture {
                        self.rating = num
                    }
            }
        }
    }
    
    // Returns the custom offImage if it exists or the default star.
    func imageType(for num:Int) -> Image{
        if num > rating {
            return offImage ?? onImage
        } else{
            return onImage
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4))
    }
}
