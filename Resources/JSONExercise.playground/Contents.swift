import UIKit

let myJson = """
{
"fruits": [
    {
        "fruit": "Apple",
        "size": "Large",
        "color": "Red",
        "price": 2,
        "location": {
            "country": "Brazil"
        }
    },
    {
        "fruit": "Banana",
        "size": "Medium",
        "color": "Yellow",
        "price": 1,
        "location": {
            "country": "Spain"
        }
    }
    ]
}
"""

struct FruitStore: Codable {
    var fruits: [Fruit]
}

struct Fruit: Codable {
    var name: String
    var size: String
    var color: String
    var price: Int
    var country: String
    
    enum CodingKeys: String, CodingKey {
        case name = "fruit"
        case size
        case color
        case price
        case country = "location"
    }
    
    enum LocationCase: String, CodingKey {
        case country
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try values.decode(String.self, forKey: .name)
        self.size = try values.decode(String.self, forKey: .size)
        self.color = try values.decode(String.self, forKey: .color)
        self.price = try values.decode(Int.self, forKey: .price)
        
        let location = try values.nestedContainer(keyedBy: LocationCase.self, forKey: .country)
        self.country = try location.decode(String.self, forKey: .country)
    }
}

let jsonDecoder = JSONDecoder()

if let jsonData = myJson.data(using: .utf8) {
    do {
        let fruitStore = try jsonDecoder.decode(FruitStore.self, from: jsonData)
        print(fruitStore)
        
        for fruits in fruitStore.fruits {
            print(fruits)
        }
    } catch {
        print(error)
    }
}


/// Teacher's exercise

let myJsonE = """
{
    "quiz": {
        "sport": {
            "q1": {
                "question": "Which one is correct team name in NBA?",
                "options": [
                    "New York Bulls",
                    "Los Angeles Kings",
                    "Golden State Warriros",
                    "Huston Rocket"
                ],
                "answer": "Huston Rocket"
            }
        },
        "maths": {
            "q1": {
                "question": "5 + 7 = ?",
                "options": [
                    "10",
                    "11",
                    "12",
                    "13"
                ],
                "answer": "12"
            },
            "q2": {
                "question": "12 - 8 = ?",
                "options": [
                    "1",
                    "2",
                    "3",
                    "4"
                ],
                "answer": "4"
            }
        }
    }
}
"""


struct Quiz: Codable {
    var quiz: Categories
}

struct Categories: Codable {
    var sport: Sport
    var maths: Maths
}

struct Sport: Codable {
    var q1: Question
}

struct Maths: Codable {
    var q1: Question
    var q2: Question?
}

struct Question: Codable {
    var question: String
    var options: [String]
    var answer: String
}

let decoder = JSONDecoder()

if let jsonData = myJsonE.data(using: .utf8) {
    do {
        let data = try decoder.decode(Quiz.self, from: jsonData)
        print(data.quiz)
    } catch {
        print(error)
    }
}

