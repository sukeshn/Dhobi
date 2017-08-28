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
    
    //Call function to return the list of months for which the payment is not done
    
    
    
    //Computed property of month
    
    var monthGiven : String{
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.setLocalizedDateFormatFromTemplate("MMMM yyyy")
            //dateFormatter.locale = Locale(identifier: "en_GB")
            return dateFormatter.string(from: dateGiven! as Date)
        }
    }
    
    public func totalClothes() -> Int
    {
        return Int(kaneeshasTops + kaneeshasBottoms + kaneeshasFrocks + kaneeshasUniforms + nehalsShirts + nehalsPants + sukeshsShirts + sukeshsPants + punjabis + sarees + blouses + others)

    }
    
    
}


