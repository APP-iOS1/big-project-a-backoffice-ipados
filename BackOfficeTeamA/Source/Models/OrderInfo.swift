import Foundation
import FirebaseFirestore

struct OrderInfo: Identifiable {
    var id: String
    var orderedUserInfo: String
    var orderTime: Date
    var orderedItems:[OrderedItemInfo]
    var orderAddress: String
    var orderMessage: String?
    //var payment
}
