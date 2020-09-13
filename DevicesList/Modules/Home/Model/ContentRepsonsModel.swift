//
//  ContentRepsonseModel.swift
//  MobileNoc
//
//  Created by prog_zidane on 9/10/20.
//  Copyright © 2020 Zidane. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct BaseReponse: Codable {
    var content: [Content]?
}

// MARK: - TargetMachine
struct TargetMachine: Codable {
    var id, sourceMachineID: Int?
    var targetMachine: Content?
    var circuitStatusID: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case sourceMachineID = "sourceMachineId"
        case targetMachine
        case circuitStatusID = "circuitStatusId"
    }
}

// MARK: - Content
struct Content: Codable {
    var id: Int?
    var name: String?
    var ipAddress: String?
    var ipSubnetMask: String?
    var model: Model?
    var locationID: Int?
    var status: Status?
    var type: TypeClass?
    var serialNumber, version: String?
    var communicationProtocols: [CommunicationProtocol]?
    var targetMachines: [TargetMachine]?
    var location: Int?
    var serialNum: String?

    enum CodingKeys: String, CodingKey {
        case id, name, ipAddress, ipSubnetMask, model
        case locationID = "locationId"
        case status, type, serialNumber, version, communicationProtocols, targetMachines, location, serialNum
    }
}

// MARK: - CommunicationProtocol
struct CommunicationProtocol: Codable {
    var id: Int?
    var name: String?
    var defaultPort: Int?
}

// MARK: - Model
struct Model: Codable {
    var id: Int?
    var name: String?
}



// MARK: - TypeClass
struct TypeClass: Codable {
    var id: Int?
    var name: String?
}
