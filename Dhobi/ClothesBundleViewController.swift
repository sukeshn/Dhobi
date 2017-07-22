//
//  ViewController.swift
//  Dhobi
//
//  Created by Sukesh Nemane on 03/12/16.
//  Copyright © 2016 Sukesh Nemane. All rights reserved.
//

import UIKit
import CoreData

class ClothesBundleViewController: UIViewController
{
    
    // MARK: Model
    var ClothesBundle: ClothesBundle?
    //initiatlize all the counters
   /* var NumberOfKaneeshaTops = 0
    var NumberOfKaneeshaBottoms = 0
    var NumberOfKaneeshaFrocks = 0
    var NumberOfKaneeshaUniforms = 0
    var NumberOfNehalShirts = 0
    var NumberOfNehalPants = 0
    var NumberOfPunjabis = 0
    var NumberOfSukeshShirts = 0
    var NumberOfSukeshPants = 0
    var NumberOfSarees = 0
    var NumberOfBlouse = 0
    var NumberOfOthers = 0*/
    //create a reference to the context

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Initialise the counters
        if (ClothesBundle != nil)
        {
            DateGivenDisplay.date = ClothesBundle!.dateGiven! as Date
            
            KaneeshaTopsCounter.text = "KT = " + String(ClothesBundle!.kaneeshasTops)
            KaneeshaTopStepper.value = Double(ClothesBundle!.kaneeshasTops)
            
            KaneeshaBottomsCounter.text = "KB = " + String(ClothesBundle!.kaneeshasBottoms)
            KaneeshaBottomStepper.value = Double(ClothesBundle!.kaneeshasBottoms)
            
            KaneeshaFrocksCounter.text = "KF = " + String(ClothesBundle!.kaneeshasFrocks)
            KaneeshaFrockStepper.value = Double(ClothesBundle!.kaneeshasFrocks)
            
            KaneeshaUniformsCounter.text = "KU = " + String(ClothesBundle!.kaneeshasUniforms)
            KaneeshaUniformStepper.value = Double(ClothesBundle!.kaneeshasUniforms)
            
            NehalShirtsCounter.text = "NS = " + String(ClothesBundle!.nehalsShirts)
            NehalShirtStepper.value = Double(ClothesBundle!.nehalsShirts)
            
            NehalPantsCounter.text = "NP = " + String(ClothesBundle!.nehalsPants)
            NehalPantStepper.value = Double(ClothesBundle!.nehalsPants)
            
            PunjabisCounter.text = "PU = " + String(ClothesBundle!.punjabis)
            PunjabiStepper.value = Double(ClothesBundle!.punjabis)
            
            SukeshShirtsCounter.text = "SS = " + String(ClothesBundle!.sukeshsShirts)
            SukeshShirtStepper.value = Double(ClothesBundle!.sukeshsShirts)
            
            SukeshPantsCounter.text = "SP = " + String(ClothesBundle!.sukeshsPants)
            SukeshPantStepper.value = Double(ClothesBundle!.sukeshsShirts)
            
            SareesCounter.text = "S = " + String(ClothesBundle!.sarees)
            SareeStepper.value = Double(ClothesBundle!.sarees)
            
            BlousesCounter.text = "B = " + String(ClothesBundle!.blouses)
            BlouseStepper.value = Double(ClothesBundle!.blouses)
            
            OthersCounter.text = "OT = " + String(ClothesBundle!.others)
            OtherStepper.value = Double(ClothesBundle!.others)
            
            CalculateTotal()
        }
    }

    @IBOutlet weak var DateGivenDisplay: UIDatePicker!
    
    @IBOutlet weak var KaneeshaTopsCounter: UILabel!

    @IBOutlet weak var KaneeshaBottomsCounter: UILabel!
   
    @IBOutlet weak var KaneeshaFrocksCounter: UILabel!
    
    @IBOutlet weak var KaneeshaUniformsCounter: UILabel!
    
    @IBOutlet weak var NehalShirtsCounter: UILabel!
    
    @IBOutlet weak var NehalPantsCounter: UILabel!
    
    @IBOutlet weak var PunjabisCounter: UILabel!
    
    @IBOutlet weak var SukeshShirtsCounter: UILabel!
    
    @IBOutlet weak var SukeshPantsCounter: UILabel!
    
    @IBOutlet weak var SareesCounter: UILabel!
    
    @IBOutlet weak var BlousesCounter: UILabel!
    
    @IBOutlet weak var OthersCounter: UILabel!
    
    @IBOutlet weak var TotalCounter: UILabel!
    
    
    @IBOutlet weak var KaneeshaTopStepper: UIStepper!
    @IBOutlet weak var KaneeshaBottomStepper: UIStepper!
    @IBOutlet weak var KaneeshaFrockStepper: UIStepper!
    @IBOutlet weak var KaneeshaUniformStepper: UIStepper!
    @IBOutlet weak var NehalShirtStepper: UIStepper!
    @IBOutlet weak var NehalPantStepper: UIStepper!
    @IBOutlet weak var SukeshPantStepper: UIStepper!
    @IBOutlet weak var SukeshShirtStepper: UIStepper!
    @IBOutlet weak var PunjabiStepper: UIStepper!
    @IBOutlet weak var SareeStepper: UIStepper!
    @IBOutlet weak var BlouseStepper: UIStepper!
    @IBOutlet weak var OtherStepper: UIStepper!
    
    
   
    
    func CalculateTotal() {
        var total = 0
        if (ClothesBundle != nil)
        {
            total = Int(ClothesBundle!.kaneeshasTops + ClothesBundle!.kaneeshasBottoms + ClothesBundle!.kaneeshasFrocks + ClothesBundle!.kaneeshasUniforms + ClothesBundle!.nehalsShirts + ClothesBundle!.nehalsPants + ClothesBundle!.punjabis + ClothesBundle!.sukeshsShirts + ClothesBundle!.sukeshsPants + ClothesBundle!.sarees + ClothesBundle!.blouses + ClothesBundle!.others)
        }
        let CounterLabel = "Total = " +  String(total)
        TotalCounter.text = CounterLabel
    }
    
    @IBAction func DateGivenDateSelected(_ sender: UIDatePicker) {
        if (ClothesBundle != nil)
        {
            ClothesBundle!.dateGiven = DateGivenDisplay.date as NSDate
        }
    }
    
    @IBAction func KaneeshaTopClicked(_ sender: UIStepper) {
        if (ClothesBundle != nil)
        {
            ClothesBundle!.kaneeshasTops = Int16(sender.value)
            let CounterLabel = "KT =" + String(ClothesBundle!.kaneeshasTops)
            KaneeshaTopsCounter.text = CounterLabel
            CalculateTotal()
        }
        
    }

    @IBAction func KaneeshaBottomStepperClicked(_ sender: UIStepper) {
        if (ClothesBundle != nil)
        {
            ClothesBundle!.kaneeshasBottoms = Int16(sender.value)
            let CounterLabel = "KB =" + String(ClothesBundle!.kaneeshasBottoms)
            KaneeshaBottomsCounter.text = CounterLabel
            CalculateTotal()
        }
    }
    
    @IBAction func KaneeshaFrockStepperClicked(_ sender: UIStepper) {
        if (ClothesBundle != nil)
        {
            ClothesBundle!.kaneeshasFrocks = Int16(sender.value)
            let CounterLabel = "KF =" + String(ClothesBundle!.kaneeshasFrocks)
            KaneeshaFrocksCounter.text = CounterLabel
            CalculateTotal()
        }
    }
    
    @IBAction func KaneeshaUniformStepperChanged(_ sender: UIStepper) {
        if (ClothesBundle != nil)
        {
            ClothesBundle!.kaneeshasUniforms = Int16(sender.value)
            let CounterLabel = "KU =" + String(ClothesBundle!.kaneeshasUniforms)
            KaneeshaUniformsCounter.text = CounterLabel
            CalculateTotal()
        }
    }
    
    @IBAction func NehalShirtStepperChanged(_ sender: UIStepper) {
        if (ClothesBundle != nil)
        {
            ClothesBundle!.nehalsShirts = Int16(sender.value)
            let CounterLabel = "NS =" + String(ClothesBundle!.nehalsShirts)
            NehalShirtsCounter.text = CounterLabel
            CalculateTotal()
        }
    }
    
    @IBAction func NehalPantStepperChanged(_ sender: UIStepper) {
        if (ClothesBundle != nil) {
            ClothesBundle!.nehalsPants = Int16(sender.value)
            let CounterLabel = "NP =" + String(ClothesBundle!.nehalsPants)
            NehalPantsCounter.text = CounterLabel
            CalculateTotal()
        }
    }
    
    @IBAction func PunjanbiStepperChanged(_ sender: UIStepper) {
        if (ClothesBundle != nil) {
            ClothesBundle!.punjabis = Int16(sender.value)
            let CounterLabel = "PU =" + String(ClothesBundle!.punjabis)
            PunjabisCounter.text = CounterLabel
            CalculateTotal()
        }
    }
    
    @IBAction func SukeshShirtStepperChanged(_ sender: UIStepper) {
        if (ClothesBundle != nil) {
            ClothesBundle!.sukeshsShirts = Int16(sender.value)
            let CounterLabel = "SS =" + String(ClothesBundle!.sukeshsShirts)
            SukeshShirtsCounter.text = CounterLabel
            CalculateTotal()
        }
    }
    
    @IBAction func SukeshPantStepperChanged(_ sender: UIStepper) {
        if (ClothesBundle != nil) {
            ClothesBundle!.sukeshsPants = Int16(sender.value)
            let CounterLabel = "SP =" + String(ClothesBundle!.sukeshsPants)
            SukeshPantsCounter.text = CounterLabel
            CalculateTotal()
        }
    }
    
    @IBAction func SareeStepperChanged(_ sender: UIStepper) {
        if (ClothesBundle != nil) {
            ClothesBundle!.sarees = Int16(sender.value)
            let CounterLabel = "S =" + String(ClothesBundle!.sarees)
            SareesCounter.text = CounterLabel
            CalculateTotal()
        }
    }
    
    @IBAction func BlouseStepperChanged(_ sender: UIStepper) {
        if (ClothesBundle != nil) {
            ClothesBundle!.blouses = Int16(sender.value)
            let CounterLabel = "B =" + String(ClothesBundle!.blouses)
            BlousesCounter.text = CounterLabel
            CalculateTotal()
        }
    }
    
    @IBAction func OtherStepperChanged(_ sender: UIStepper) {
        if (ClothesBundle != nil) {
            ClothesBundle!.others = Int16(sender.value)
            let CounterLabel = "OT =" + String(ClothesBundle!.others)
            OthersCounter.text = CounterLabel
            CalculateTotal()
        }
    }
    
    @IBAction func GiveClothesBundle(_ sender: UIButton) {
        if (ClothesBundle != nil)
        {
            ClothesBundle!.dateGiven = DateGivenDisplay.date as NSDate
        }
        try? AppDelegate.viewContext.save()
        navigationController?.popViewController(animated: true)
    }

    @IBAction func ReceiveClothesBundle(_ sender: UIButton) {
        if (ClothesBundle != nil)
        {
            ClothesBundle!.dateReceived = Date() as NSDate
            ClothesBundle!.isReceived = true
        }
        try? AppDelegate.viewContext.save()
        navigationController?.popViewController(animated: true)
    }
    
}

