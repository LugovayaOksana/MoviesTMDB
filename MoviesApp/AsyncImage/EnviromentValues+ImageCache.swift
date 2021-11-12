//
//  EnviromentValues+ImageCache.swift
//  MoviesApp
//
//  Created by Оксана on 11.11.2021.
//

import SwiftUI

struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCach = TempImageCach()
}

extension EnvironmentValues {
    var imageCache: ImageCach {
        get {self[ImageCacheKey.self]}
        set {self[ImageCacheKey.self] = newValue}
    }
}
