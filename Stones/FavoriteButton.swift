import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            withAnimation {
                isSet.toggle()
            }
        } label: {
            Image(systemName: isSet ? "heart.fill" : "heart")
                .foregroundColor(isSet ? .red : .gray)
                .contentTransition(.symbolEffect)
        }
    }
}
