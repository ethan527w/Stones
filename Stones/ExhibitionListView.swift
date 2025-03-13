import SwiftUI

struct ExhibitionListView: View {
    @Binding var exhibitions: [Exhibition]
    let filterType: FilterType
    
    enum FilterType { case featured, live, favorites }
    
    private var filteredExhibitions: [Exhibition] {
        switch filterType {
        case .featured: return exhibitions.filter { $0.isFeatured }
        case .live: return exhibitions.filter { $0.isLive }
        case .favorites: return exhibitions.filter { $0.isFavorite }
        }
    }
    
    var body: some View {
        List {
            ForEach(filteredExhibitions) { exhibition in
                NavigationLink {
                    ExhibitionDetailView(exhibition: exhibition)
                } label: {
                    HStack {
                        Text(exhibition.galleryName)
                            .font(.headline)
                        
                        Spacer()
                        
                        Button(action: {
                            if let index = exhibitions.firstIndex(where: { $0.id == exhibition.id }) {
                                exhibitions[index].isFavorite.toggle()
                            }
                        }) {
                            Image(systemName: exhibition.isFavorite ? "heart.fill" : "heart")
                                .foregroundColor(exhibition.isFavorite ? .red : .gray)
                        }
                        .buttonStyle(.plain)
                        .contentShape(Rectangle())
                    }
                    .contentShape(Rectangle())
                }
            }
        }
        .navigationTitle(filterType.title)
    }
}

extension ExhibitionListView.FilterType {
    var title: String {
        switch self {
        case .featured: return "Featured Shows"
        case .live: return "Live Events"
        case .favorites: return "My Favorites"
        }
    }
}
