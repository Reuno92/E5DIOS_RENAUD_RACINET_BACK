//
//  PizzaRoutes.swift
//  Application
//
//  Created by Renaud Racinet on 19/03/2019.
//

import LoggerAPI
import Health
import KituraContracts
import KituraTemplateEngine

func initializePizzaRoutes(app: App) {
    
    app.router.add(templateEngine: StencilTemplateEngine())

    app.router.get("/pizza") { (respondWith: (Status?, RequestError?) -> Void) -> Void in
        if health.status.state == .UP {
            respondWith(health.status, nil)
        } else {
            respondWith(nil, RequestError(.serviceUnavailable, body: health.status))
        }
    }
    
}

