//
//  planeta.swift
//  RedesSociales
//
//  Created by alumno on 4/2/25.
//

struct Planeta: Identifiable, Codable
{
    let id: Int
    let name: String
    let isDestroyed: Bool
    let description: String
    let image:String
}
struct PaginaResultadoPlaneta: Codable{ //, Identifiable
    //var id: Int = self.meta.currentPage
    let items: [Planeta]
    let meta: Meta
    let links: Enlaces
}
