import Foundation

struct Link: Decodable {
  let title:String
  let url:String
  
  enum CodingKeys: String, CodingKey {
    case title
    case url = "link"
  }
}
