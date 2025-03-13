import SwiftUI

struct HomePageView: View {
    @Binding var exhibitions: [Exhibition]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Stones")
                        .font(.system(size: 36, weight: .bold))
                        .padding(.top, 30)
                    
                    NavigationLink {
                        ExhibitionListView(
                            exhibitions: $exhibitions,
                            filterType: .featured
                        )
                    } label: {
                        NavigationButton(
                            title: "Featured Shows",
                            decoration: "blue_circle",
                            color: .blue
                        )
                    }
                    
                    NavigationLink {
                        ExhibitionListView(
                            exhibitions: $exhibitions,
                            filterType: .live
                        )
                    } label: {
                        NavigationButton(
                            title: "Live Events",
                            decoration: "green_circle",
                            color: .green
                        )
                    }
                    
                    NavigationLink {
                        ExhibitionListView(
                            exhibitions: $exhibitions,
                            filterType: .favorites
                        )
                    } label: {
                        NavigationButton(
                            title: "My Favorites",
                            decoration: "red_heart",
                            color: .red
                        )
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct NavigationButton: View {
    let title: String
    let decoration: String
    let color: Color
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.top, .leading], 20)
            
            Image(decoration)
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .padding([.bottom, .trailing], 20)
        }
        .frame(minHeight: 120)
        .background(Color.white)
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.black, lineWidth: 2)
        )
        .shadow(color: color.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}
