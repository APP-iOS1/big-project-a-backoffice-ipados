import Foundation
import FirebaseFirestore

struct OrderInfo: Identifiable {
    // 주문건 고유 ID
        var id: String?

        // 주문인 UID
        var orderedUserInfo: String?

        // 주문 시간
        var orderTime: Date?

        // itemUid : String - 상품 id,
        // itemName : String - 상품이름,
        // itemImage: String - 상품이미지,
        // price: Int - 가격,
        // deleveryStatus: String - 배송중, 배송완료, 배송준비중, 리뷰작성 가능, 리뷰작성 완료
        // option: [String: Any] - 기타 옵션: 색상, 재질 같은... [ 처리하기가 조금 까다로움 ]
        var orderedItems:[String: Any]?

        // 주소
        var orderAddress: String?

        // 주문메세지
        var orderMessage: String?
}
