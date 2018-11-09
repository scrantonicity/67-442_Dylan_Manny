import Foundation

struct ResponseData: Decodable {
  let events: [Event]
  
  enum CodingKeys: String, CodingKey {
    case events = "Events"
  }
}
