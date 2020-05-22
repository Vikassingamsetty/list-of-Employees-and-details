//
//  ServerStruct.swift
//  Alamofire&Codable&TV
//
//  Created by Srans022019 on 06/05/20.
//  Copyright © 2020 vikas. All rights reserved.
//

import Foundation

struct Employers: Codable {
    
    let status: String
    var data: [Datsun]
    
}

struct Datsun: Codable {
    
    let id: String
    var employeeName: String
    let employeeSalary: String
    let employeeAge: String
    
    private enum CodingKeys: String, CodingKey {
        
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
    }
    
}
