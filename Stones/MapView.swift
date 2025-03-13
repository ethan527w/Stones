import SwiftUI
import MapKit

struct MapView: View {
    let exhibitions: [Exhibition]
    
    var body: some View {
        Map {
            ForEach(exhibitions) { exhibition in
                Marker(
                    exhibition.galleryName,
                    coordinate: CLLocationCoordinate2D(
                        latitude: exhibition.coordinate.latitude,
                        longitude: exhibition.coordinate.longitude
                    )
                )
                .tint(exhibition.pinColor)
            }
        }
        .mapControlVisibility(.hidden)
    }
}
