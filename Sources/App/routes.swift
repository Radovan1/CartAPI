import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    let cartItemsController = CartController()
    try router.register(collection: cartItemsController)
}
