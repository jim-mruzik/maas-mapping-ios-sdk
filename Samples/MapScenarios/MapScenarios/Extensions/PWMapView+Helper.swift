//
//  PWMapView+Helper.swift
//  MapScenarios
//
//  Created by Patrick Dunshee on 2/13/19.
//  Copyright © 2019 Patrick Dunshee. All rights reserved.
//

import PWMapKit

extension PWMapView {
    
    func remainingRouteDistanceFromCurrentLocation() -> CLLocationDistance? {
        guard let route = currentRoute, let currentInstruction = currentRouteInstruction(), var instructionIndex = route.routeInstructions.index(of: currentInstruction) else {
            return nil
        }
        // Use user location for current route instruction index if possible
        if let userLocation = indoorUserLocation, let closestInstruction = route.closestInstructionTo(userLocation), let closestInstructionIndex = route.routeInstructions.index(of: closestInstruction) {
            instructionIndex = closestInstructionIndex
        }
        
        var distanceTotal = 0.0
        var numberOfFloorSwitchInstructions = 0.0 // Add distance to account for floor switch time
        for i in instructionIndex..<route.routeInstructions.count {
            let instruction = route.routeInstructions[i]
            if instruction.movementDirection == .floorChange {
                numberOfFloorSwitchInstructions += 1.0
            } else {
                distanceTotal = distanceTotal + instruction.distance
            }
        }
        return route.distance + numberOfFloorSwitchInstructions * 15.0
    }
}
