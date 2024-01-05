//
//  NetworkingError.swift
//  NewsApper
//
//  Created by Илья Курлович on 26.12.2023.
//

import Foundation

enum NetworkingError: Error {
    case networkingError(_ error: Error)
    case unknown
}
