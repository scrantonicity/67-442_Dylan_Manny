import Foundation

struct Event: Decodable {
  let year:String
  let headline:String
  let links: [Link]
  
  enum CodingKeys:String, CodingKey {
    case year
    case headline = "text"
    case links
  }
}
