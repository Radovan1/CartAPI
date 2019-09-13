//
//  CartController.swift
//  App
//
//  Created by Radde on 2019-09-13.
//

import Vapor
import Fluent

struct CartController: RouteCollection {
    func boot(router: Router) throws {
        let cartRoute = router.grouped("api", "items")
        cartRoute.get(use: getAllHandler)
        cartRoute.post(CartItem.self, use: createHandler)
        cartRoute.get(CartItem.parameter, use: getHandler)
        cartRoute.delete(CartItem.parameter, use: deleteHandler)
    }
    
    func getAllHandler(_ req: Request) throws -> Future<[CartItem]> {
        return CartItem.query(on: req).all()
    }
    
    func createHandler(_ req: Request, item: CartItem) throws -> Future<CartItem> {
        return item.save(on: req)
    }
    
    func getHandler(_ req: Request) throws -> Future<CartItem> {
        return try req.parameters.next(CartItem.self)
    }
    
    func deleteHandler(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(CartItem.self).delete(on: req).transform(to: .noContent)
    }
}
