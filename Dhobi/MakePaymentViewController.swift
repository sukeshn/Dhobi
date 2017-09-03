//
//  MakePaymentViewController.swift
//  Dhobi
//
//  Created by Sukesh Nemane on 21/08/17.
//  Copyright © 2017 Sukesh Nemane. All rights reserved.
//

import UIKit
import CoreData

class MakePaymentViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var monthPicker: UIPickerView!
    @IBOutlet weak var amountToPay: UITextField!

    @IBAction func calculateAmount(_ sender: UIButton) {
        amountToPay.text = calculateAmount(ForMonth: pickerData[monthPicker.selectedRow(inComponent: 0)]).description
    }
    @IBAction func makePayment(_ sender: UIButton) {
    }
    
    var pickerData: [String] = [String]()
    
    //create month list, current and previous 6 months
    private func monthList()-> [String] {
        var dateForMonth = Date()
        let countOfMonthToDisplay = 6
        var monthToReturn = [String]()
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMM yyyy")
        
        for _ in 0 ..< countOfMonthToDisplay {
            monthToReturn.append(dateFormatter.string(from: dateForMonth))
            dateForMonth = dateForMonth.getPreviousMonth()!
        }
        return monthToReturn
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //connect data
        self.monthPicker.delegate = self
        self.monthPicker.dataSource = self
        
        // Do any additional setup after loading the view.
        
        pickerData = monthList() // ["August 2017", "July 2017", "June 2017", "May 2017"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func calculateAmount (ForMonth : String) -> Double {
        
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMM yyyy")
        
        //Get the first day of the month passed
        let dateFrom = dateFormatter.date(from: ForMonth)
        let dateTo = dateFrom?.getNextMonth()
        //Identify the total clothes for the whole month and then apply the rate to the clothes.
        let container: NSPersistentContainer? = AppDelegate.persistentContainer
        var amount = 0.0
        if let context = container?.viewContext {
            let request: NSFetchRequest<ClothesBundle> = ClothesBundle.fetchRequest()
            request.predicate = NSPredicate(format: "(%@ <= dateGiven) AND (dateGiven < %@)", argumentArray: [dateFrom as Any, dateTo as Any])
            
            amount = Double(try! context.count(for: request))
        }
        
        return amount
    }
    
   
}

extension Date {
    func getNextMonth() -> Date? {
        return Calendar.current.date(byAdding: .month, value: 1, to: self)
    }
    
    func getPreviousMonth() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -1, to: self)
    }
}
