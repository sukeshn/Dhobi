//
//  ClothesBundle.swift
//  Dhobi
//
//  Created by Sukesh Nemane on 29/04/17.
//  Copyright © 2017 Sukesh Nemane. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class ClothesBundle: NSManagedObject
{
    
    public func totalClothes() -> Int
    {
        return Int(kaneeshasTops + kaneeshasBottoms + kaneeshasFrocks + kaneeshasUniforms + nehalsShirts + nehalsPants + sukeshsShirts + sukeshsPants + punjabis + sarees + blouses + others)

    }
}


