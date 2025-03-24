//
//  errores.swift
//  RedesSociales
//
//  Created by alumno on 3/24/25.
//

enum ErroresDeRed: Error{
    case malaDireccionUrl
    case badUrl
    case invalidRequest
    case badResponse
    case badStatus
    case fallaAlConvertirLaRespuesta
}
