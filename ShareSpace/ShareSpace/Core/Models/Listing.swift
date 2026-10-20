import Foundation

struct Listing: Identifiable {
    var id: String
    var ownerId: String
    var title: String
    var description: String
    var quantity: Int
    var pricePerDay: Double
    var address: Address
    var imageURLs: [URL]
//    var status: ListingStatus     //.active, .paused, .rented
    var createdAt: Date
    var updatedAt: Date
}

struct Address: Codable, Hashable {
    var line1: String
    var city: String
    var postalCode: String
    var latitude: Double?
    var longitude: Double?
}
