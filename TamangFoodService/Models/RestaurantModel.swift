//
//  RestaurantModel.swift
//  TamangFoodService
//
//  Created by INVISION - 240 on 05/08/2024.
//

import Foundation

struct Restaurant: Identifiable {
    var id : Int
    var images: [String]
    var image: String
    var name: String
    let price: String
    let cuisines: [String]
    var location: String
    var rating: String
    let deliveryCost: String
    var deliveryTime: String
    var deliveryType: String
    let numberOfRatings: String
    
    init(id: Int, images: [String], name: String,image: String, price: String, cuisines: [String], location: String, rating: String, deliveryTime: String, deliveryType: String, numberOfRatings: String, deliveryCast: String) {
        self.id = id
        self.images = images
        self.image = image
        self.name = name
        self.price = price
        self.cuisines = cuisines
        self.location = location
        self.rating = rating
        self.deliveryCost = deliveryCast
        self.deliveryTime = deliveryTime
        self.deliveryType = deliveryType
        self.numberOfRatings = numberOfRatings
        
    }
    
    static func == (lhs: Restaurant, rhs: Restaurant) -> Bool {
        return lhs.id == rhs.id
    }
    
}



let dummyRestourents: [Restaurant] = [
    
    Restaurant(id: 0, images: ["BG1", "BG4", "BG3" , "BG2", "BG5", "BG6", "BG7"], name: "Krispy Creme", image: "KrispyCreme", price: "$15.3", cuisines: ["Chinese", "American", "Deshi food"] ,location: "St Georgece Terrace, Perth", rating: "4.5", deliveryTime: " 25min", deliveryType: "Free delivery", numberOfRatings: "200 + Ratings", deliveryCast: "Free"),
 
    Restaurant(id: 1, images: ["BG2", "BG4", "BG3" , "BG1", "BG5", "BG6", "BG7"], name: "Mario Italiano", image: "MarioItaliano", price: "$12.8", cuisines: ["Chinese", "American", "Deshi food"] , location: "Hay street , Perth City", rating: "4.5", deliveryTime: " 25min", deliveryType: "Free delivery", numberOfRatings: "200 + Ratings", deliveryCast: "Free"),
    
    Restaurant(id: 2, images: ["BG3", "BG1", "BG4" , "BG2", "BG5", "BG6", "BG7"], name: "McDonald’s", image: "MCDonalds", price: "$7.99", cuisines: ["Chinese", "American", "Deshi food"] , location: "Hay street , Perth City", rating: "4.5", deliveryTime: " 25min", deliveryType: "Free delivery", numberOfRatings: "200 + Ratings", deliveryCast: "Free"),
    
  
    Restaurant(id: 3, images: ["BG4", "BG3" , "BG2", "BG5", "BG6", "BG7"], name: "The Halal Guys", image: "TheHalalGuys", price: "$8.85", cuisines: ["Chinese", "American", "Deshi food"] , location: "Hay street , Perth City", rating: "4.5", deliveryTime: " 25min", deliveryType: "Free delivery", numberOfRatings: "200 + Ratings", deliveryCast: "Free")
 
]

let dummyRestourents2: [Restaurant] = [
    
    
    
    Restaurant(id: 2, images: ["BG3", "BG1", "BG4" , "BG2", "BG5", "BG6", "BG7"], name: "McDonald’s", image: "MCDonalds", price: "$7.99", cuisines: ["Chinese", "American", "Deshi food"] , location: "Hay street , Perth City", rating: "4.5", deliveryTime: " 25min", deliveryType: "Free delivery", numberOfRatings: "200 + Ratings", deliveryCast: "Free"),
    
  
    Restaurant(id: 3, images: ["BG4", "BG3" , "BG2", "BG5", "BG6", "BG7"], name: "The Halal Guys", image: "TheHalalGuys", price: "$8.85", cuisines: ["Chinese", "American", "Deshi food"] , location: "Hay street , Perth City", rating: "4.5", deliveryTime: " 25min", deliveryType: "Free delivery", numberOfRatings: "200 + Ratings", deliveryCast: "Free"),
 
    Restaurant(id: 0, images: ["BG1", "BG4", "BG3" , "BG2", "BG5", "BG6", "BG7"], name: "Krispy Creme", image: "KrispyCreme", price: "$15.3", cuisines: ["Chinese", "American", "Deshi food"] ,location: "St Georgece Terrace, Perth", rating: "4.5", deliveryTime: " 25min", deliveryType: "Free delivery", numberOfRatings: "200 + Ratings", deliveryCast: "Free"),
 
    Restaurant(id: 1, images: ["BG2", "BG4", "BG3" , "BG1", "BG5", "BG6", "BG7"], name: "Mario Italiano", image: "MarioItaliano", price: "$12.8", cuisines: ["Chinese", "American", "Deshi food"] , location: "Hay street , Perth City", rating: "4.5", deliveryTime: " 25min", deliveryType: "Free delivery", numberOfRatings: "200 + Ratings", deliveryCast: "Free")
]



struct FeaturPartnerModel: Identifiable {
    let id : Int
    let name: String
    let deliveryTime: String
    let delivery: String
    let rating: String
    let cuisines: [String]
    let imageName: String
    
    init(id: Int, name: String, deliveryTime: String, delivery: String, rating: String, cuisines: [String], imageName: String) {
        self.id = id
        self.name = name
        self.deliveryTime = deliveryTime
        self.delivery = delivery
        self.rating = rating
        self.cuisines = cuisines
        self.imageName = imageName
    }
    
    static func == (lhs: FeaturPartnerModel, rhs: FeaturPartnerModel) -> Bool {
        return lhs.id == rhs.id
    }
    
}


let dummyFeatureRestaurants = [
    FeaturPartnerModel(
        id: 1,
        name: "Tacos Nanchas",
        deliveryTime: "25 Min",
        delivery: "Free",
        rating: "4.5",
        cuisines: ["Chinese", "American"],
        imageName: "TacosNanchas"
    ),
    
    FeaturPartnerModel(
        id: 2,
        name: "MCDonald's",
        deliveryTime: "25 Min",
        delivery: "Free",
        rating: "4.5",
        cuisines: ["Chinese", "American"],
        imageName: "MCDonalds1" 
    ),
    
    FeaturPartnerModel(
        id: 3,
        name: "KFC Foods",
        deliveryTime: "25 Min",
        delivery: "Free",
        rating: "4.5",
        cuisines: ["Chinese", "American"],
        imageName: "KFCFoods" 
    ),
    
    FeaturPartnerModel(
        id: 4,
        name: "Cafe MayField's",
        deliveryTime: "25 Min",
        delivery: "Free",
        rating: "4.5",
        cuisines: ["Chinese", "American"],
        imageName: "CafeMayFields" 
    ),
    
    FeaturPartnerModel(
        id: 5,
        name: "MCDonald's",
        deliveryTime: "25 Min",
        delivery: "Free",
        rating: "4.5",
        cuisines: ["Chinese", "American"],
        imageName: "MCDonalds1" 
    ),
    
    FeaturPartnerModel(
        id: 6,
        name: "MCDonald's",
        deliveryTime: "25 Min",
        delivery: "Free",
        rating: "4.5",
        cuisines: ["Chinese", "American"],
        imageName: "MCDonaldsTee" 
    )
]


struct FeaturedListModel: Identifiable {
    let id : Int
    let name: String
    let cuisines: [String]
    let imageName: String
    let address : String
    let price : String
    init(id: Int, name: String, cuisines: [String], imageName: String, address: String, price: String) {
        self.id = id
        self.name = name
        self.cuisines = cuisines
        self.imageName = imageName
        self.address = address
        self.price = price
    }
    
    static func == (lhs: FeaturedListModel, rhs: FeaturedListModel) -> Bool {
        return lhs.id == rhs.id
    }
    
}


let featuredListItemDummyData = [

    FeaturedListModel(id: 1, name: "Cookie", cuisines: ["Chinese"], imageName: "CookieSandWich", address: "Shortbread, chocolat turle cookies, and red vlvet.", price: "AUD$ 7.4"),
    FeaturedListModel(id: 2, name: "Chow Fun", cuisines: ["Chinese"], imageName: "ChowFun",address: "Shortbread, chocolat turle cookies, and red vlvet.", price: "AUD$ 7.4"),
    FeaturedListModel(id: 3, name: "Dim SUm", cuisines: ["Chinese"], imageName: "DimSUm",address: "Shortbread, chocolat turle cookies, and red vlvet.", price: "AUD$ 7.4")
]



let featuredListItemDummyDataMostPopular = [

    FeaturedListModel(id: 1, name: "Cookie Sandwich", cuisines: ["Chinese"], imageName: "CookieSandWitch2", address: "Shortbread, chocolat turle cookies, and red vlvet.", price: "AUD$10"),
    FeaturedListModel(id: 2, name: "Combo Burger", cuisines: ["Chinese"], imageName: "Combo Burger",address: "Shortbread, chocolat turle cookies, and red vlvet.", price: "AUD$ 7.4"),
    FeaturedListModel(id: 3, name: "Combo SandWitch", cuisines: ["Chinese"], imageName: "Combo SandWitch",address: "Shortbread, chocolat turle cookies, and red vlvet.", price: "AUD$ 9.5")
]


let featuredListItemDummyDataSeaFood = [

    FeaturedListModel(id: 1, name: "Oyster Dish", cuisines: ["Chinese"], imageName: "OysterDish", address: "Shortbread, chocolat turle cookies, and red vlvet.", price: "AUD$10"),
    FeaturedListModel(id: 2, name: "Oyster On Ice", cuisines: ["Chinese"], imageName: "OysterOnIce", address: "Shortbread, chocolat turle cookies, and red vlvet.", price: "AUD$ 7.4"),
    FeaturedListModel(id: 3, name: "Fried Rice nn Pot", cuisines: ["Chinese"], imageName: "FriedRiceOnPot", address: "Shortbread, chocolat turle cookies, and red vlvet.", price: "AUD$ 9.5")
]


let featuredListSearchDummyData = [
    
    FeaturedListModel(id: 1, name: "The Halal Guys", cuisines: ["Chinese"], imageName: "sbg1", address: "Shortbread, chocolat turle cookies, and red vlvet.", price: "AUD$10"),
    FeaturedListModel(id: 2, name: "Popeyes 1426 Flmst", cuisines: ["Chinese"], imageName: "CookieSandWich", address: "Shortbread, chocolat turle cookies, and red vlvet.", price: "AUD$ 7.4"),
    FeaturedListModel(id: 3, name: "Mixt - Yerba Buena", cuisines: ["Chinese"], imageName: "sbg2", address: "Shortbread, chocolat turle cookies, and red vlvet.", price: "AUD$ 9.5"),
    
    FeaturedListModel(id: 4, name: "Split Bread - Russian", cuisines: ["Chinese"], imageName: "sbg3", address: "Shortbread, chocolat turle cookies, and red vlvet.", price: "AUD$ 9.5"),
    
    FeaturedListModel(id: 5, name: "Cookie Sandwich", cuisines: ["Chinese"], imageName: "sbg3", address: "Shortbread, chocolat turle cookies, and red vlvet.", price: "AUD$ 9.5"),
    
    FeaturedListModel(id: 6, name: "Cookie Sandwich", cuisines: ["Chinese"], imageName: "sbg4", address: "Shortbread, chocolat turle cookies, and red vlvet.", price: "AUD$ 9.5"),


]


let featuredListSearchGategaryDummyData = [
    
    FeaturedListModel(id: 1, name: "The Halal Guys", cuisines: ["Chinese"], imageName: "xsmall1", address: "Shortbread, chocolat turle cookies, and red vlvet.", price: "AUD$10"),
    
    FeaturedListModel(id: 2, name: "Popeyes 1426 Flmst", cuisines: ["Chinese"], imageName: "xsmall2", address: "Shortbread, chocolat turle cookies, and red vlvet.", price: "AUD$ 7.4"),
    
    FeaturedListModel(id: 3, name: "Mixt - Yerba Buena", cuisines: ["Chinese"], imageName: "xsmall3", address: "Shortbread, chocolat turle cookies, and red vlvet.", price: "AUD$ 9.5"),
    
    FeaturedListModel(id: 4, name: "Split Bread - Russian", cuisines: ["Chinese"], imageName: "xsmall5", address: "Shortbread, chocolat turle cookies, and red vlvet.", price: "AUD$ 9.5"),
    
    FeaturedListModel(id: 5, name: "Cookie Sandwich", cuisines: ["Chinese"], imageName: "xsmall6", address: "Shortbread, chocolat turle cookies, and red vlvet.", price: "AUD$ 9.5"),
    
    FeaturedListModel(id: 6, name: "Cookie Sandwich", cuisines: ["Chinese"], imageName: "xsmall7", address: "Shortbread, chocolat turle cookies, and red vlvet.", price: "AUD$ 9.5"),
    
FeaturedListModel(id: 7, name: "Cookie Sandwich", cuisines: ["Chinese"], imageName: "xsmall4", address: "Shortbread, chocolat turle cookies, and red vlvet.", price: "AUD$ 9.5"),
    
    FeaturedListModel(id: 8, name: "Cookie Sandwich", cuisines: ["Chinese"], imageName: "xsmall1", address: "Shortbread, chocolat turle cookies, and red vlvet.", price: "AUD$ 9.5"),



]



struct ReviewModel: Identifiable {
    var id : Int
    var resturtImages: [String]
    var userImage: String
    var name: String
    var rating: String
    let comment: String
    
    init(id: Int, resturtImages: [String], userImage: String, name: String, rating: String, comment: String) {
        self.id = id
        self.resturtImages = resturtImages
        self.userImage = userImage
        self.name = name
        self.rating = rating
        self.comment = comment
    }
    
    static func == (lhs: ReviewModel, rhs: ReviewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
}


let reviewDummyData = [
    ReviewModel(id: 1, resturtImages: ["BG2", "BG4", "BG3" , "BG1", "BG5", "BG6", "BG7"], userImage: "SusieBridges", name: "Susie Bridges", rating: "5.0", comment: "Great food I like this place, I think best place of Colarodo. Chilling with Friends :)"),

    ReviewModel(id: 2, resturtImages: [], userImage: "RodneyMiller", name: "Rodney Miller", rating: "4.8", comment: "One of the best and so much good food corner in Colarodo. Specially the burger, Lemonade."),

    ReviewModel(id: 4, resturtImages: ["sbg3", "sbg2", "sbg1" , "sbg4", "BG4", "sbg5", "BG7"], userImage: "LarryBowers", name: "Larry Bowers", rating: "4.2", comment: "Great food I like this place, I think best place of Colarodo. Chilling with Friends :)"),

    ReviewModel(id: 3, resturtImages: ["BG7", "BG5", "BG4" , "BG6", "BG2", "BG3", "BG7"], userImage: "SusieBridges", name: "Susie Bridges", rating: "5.0", comment: "Great food I like this place, I think best place of Colarodo. Chilling with Friends :)")

    
]
