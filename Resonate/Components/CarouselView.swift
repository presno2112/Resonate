//
//  CarouselView.swift
//  Resonate
//
//  Created by Gustavo Vasquez on 09/10/24.
//

import SwiftUI


struct ArtistView: View {
    var element: ArtistSwiftData
    
    var body: some View {
        VStack {
            Image(element.image!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            Text(element.name)
                .font(.caption)
                .lineLimit(1)
                .frame (width: 60)
        }
    }
}

struct ArtistsCarousel: View {
    var title: String
    @Binding var show: Bool
    var artists: [ArtistSwiftData]
    
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .top, spacing: 10) {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    Button {
                        show = true
                    } label: {
                        Text("+")
                            .font(.largeTitle)
                            .bold()
                            .frame(width: 60, height: 60)
                            .background(Color("aux1"))
                            .foregroundStyle(Color("terciary"))
                            .clipShape(Circle())
                    }
                }
                Spacer()
                
                // Make the ScrollView take the full available width
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 5) {
                        ForEach(artists.indices, id: \.self) { index in
                            ArtistView(element: artists[index])
                                .padding(.top, 35)
                                .frame(width: geometry.size.width / 5) // Dynamically size based on screen width
                        }
                    }
                }
            }
            .frame(minWidth: geometry.size.width)
            .padding()
        }
    }
}


//struct CarouselView: View {
//    var body: some View {
//        VStack {
//            ArtistsCarousel(title: "Artists", show: .constant(false))
//            ArtistsCarousel(title: "History", show: .constant(false))
//        }
//    }
//}
//#Preview {
//    CarouselView()
//}
