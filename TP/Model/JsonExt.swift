//
//  JsonExt.swift
//  TP
//
//  Created by Infxit-08893 on 07/01/19.
//  Copyright © 2019 infinx. All rights reserved.
//

import Foundation
import SwiftyJSON

public protocol JSONDeserializable {
   static func deserialize(_ element: JSON) -> Self
}

extension JSON {
    public func value<T : JSONDeserializable>() -> [T]? {
        return self.array?.map{ T.deserialize($0) }
    }

    public func value<T : JSONDeserializable>() -> T {
        return T.deserialize(self)
    }
}
