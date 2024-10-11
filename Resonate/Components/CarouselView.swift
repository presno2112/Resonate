//
//  CarouselView.swift
//  Resonate
//
//  Created by Gustavo Vasquez on 09/10/24.
//

import SwiftUI

struct carouselElement {
    var image: Image
    var name: String
}

struct ArtistView: View {
    var element: carouselElement
    
    var body: some View {
        VStack {
            element.image
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
    @State private var elements: [carouselElement] = []
    @State var title: String = ""
    
    var body: some View {
            HStack(alignment: .top, spacing: 10) {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                        .padding(.bottom, 5)
                    Button(action: addElement) {
                        Text("+")
                            .frame(width: 60, height: 60)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                }
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack (spacing: 5) {
                        ForEach(elements.indices, id: \.self) {
                            index in ArtistView(element: elements[index])
                                .padding(.top, 35)
                                .frame(width: 60)
                        }
                    }
                }
            }
            .padding()
        }

        private func addElement() {
            // Logic to add a new element
            let newElement = carouselElement(image: Image(systemName: "photo"), name: "\(title)\(elements.count)")
            elements.append(newElement)
        }
}

struct CarouselView: View {
    var body: some View {
        VStack {
            ArtistsCarousel(title: "Artists")
            ArtistsCarousel(title: "History")
        }
    }
}
#Preview {
    CarouselView()
}
