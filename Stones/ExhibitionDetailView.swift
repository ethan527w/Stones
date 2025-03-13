import SwiftUI

struct ExhibitionDetailView: View {
    let exhibition: Exhibition
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // 画廊信息
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(exhibition.galleryName)
                            .font(.title)
                            .bold()
                        
                        Text(exhibition.address)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                }
                
                // 图片画廊
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(exhibition.imageURLs, id: \.self) { image in
                            Image(image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 150)
                                .cornerRadius(10)
                        }
                    }
                }
                
                // 展览信息
                VStack(alignment: .leading, spacing: 15) {
                    Text(exhibition.artistName)
                        .font(.title2)
                        .bold()
                    
                    Text(exhibition.exhibitionTitle)
                        .font(.headline)
                    
                    Text(exhibition.pressRelease)
                        .font(.body)
                        .lineSpacing(6)
                }
                
                // 外部链接
                Button(action: {
                    guard let url = URL(string: exhibition.externalLink) else { return }
                    UIApplication.shared.open(url)
                }) {
                    Text("Learn More")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("Details")
    }
}
