//
//  CartItem.swift
//  App
//
//  Created by Radde on 2019-09-13.
//

import Vapor
import FluentSQLite

final class CartItem: Codable {
    var id: Int?
    var name: String
    var description: String
    var price: Double
    var quantity: Int
    
    init(id: Int? = nil, name: String, description: String, price: Double, quantity: Int) {
        self.name = name
        self.description = description
        self.price = price
        self.quantity = quantity
    }
}

extension CartItem: SQLiteModel {}
extension CartItem: Migration {}
extension CartItem: Content {}
extension CartItem: Parameter {}
