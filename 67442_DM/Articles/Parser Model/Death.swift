import Foundation

struct Death: Decodable {
  let year:String
  let person:String
  let links: [Link]
  
  enum CodingKeys:String, CodingKey {
    case year
    case person = "text"
    case links
  }
}
