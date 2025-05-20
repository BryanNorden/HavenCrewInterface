//
//  CrewMember.swift
//  HavenVitals
//
//  Created by Bryan Norden on 5/14/25.
//

import Foundation

struct CrewMember: Identifiable {
    let id: UUID
    let name: String
    var vitals: VitalSigns
    var status: String
}
