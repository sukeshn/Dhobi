//
//  ClothesBundleTableViewController.swift
//  Dhobi
//
//  Created by Sukesh Nemane on 29/04/17.
//  Copyright © 2017 Sukesh Nemane. All rights reserved.
//

import UIKit
import CoreData

class ClothesBundleTableViewController: UITableViewController {
    
    //MARK Properties
    //var request: NSFetchRequest<ClothesBundle>
    var container: NSPersistentContainer? = AppDelegate.persistentContainer { didSet { updateUI() } }
    
    var fetchedResultsController: NSFetchedResultsController<ClothesBundle>?
    
    
    
    //MARK Private Methods
    private func updateUI()
    {
        if let context = container?.viewContext {
            let request: NSFetchRequest<ClothesBundle> = ClothesBundle.fetchRequest()
            request.sortDescriptors = [NSSortDescriptor(key: "dateGiven", ascending: true, selector: nil)]
            
            fetchedResultsController = NSFetchedResultsController<ClothesBundle>(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: "monthGiven", cacheName: nil)
            //fetchedResultsController?.delegate = self
            try? fetchedResultsController?.performFetch()
            tableView.reloadData()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return fetchedResultsController?.sections?.count ?? 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchedResultsController?.sections, sections.count > 0
        {
            return sections[section].numberOfObjects
        }
        else
        {
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Table view cells are reused and should be dequeued using a cell identifier
        let cellIdentifier = "ClothesBundleTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ClothesBundleTableViewCell else {
            fatalError("The dequeued cell is not an instance of ClothesBundleTableViewCell.")
        }
        
        //Fetches the appropriate clothesBundle for the data source layout
        let clothesBundle = fetchedResultsController?.object(at: indexPath)

        // Configure the cell...
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        //dateFormatter.locale = Locale(identifier: "en_GB")
        
        if let date = clothesBundle?.dateGiven {
            cell.dateLabel.text = dateFormatter.string(from: date as Date)
        }
        cell.totalClothesLabel.text = clothesBundle?.totalClothes().description
        if (clothesBundle?.isReceived)! {
            cell.recievedOrGivenLabel.text = "✓"
        } else {
            cell.recievedOrGivenLabel.text = "x"
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let sections = fetchedResultsController?.sections, sections.count > 0
        {
            return sections[section].name
        }
        else
        {
            return "None"
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let identifier = segue.identifier {
            switch identifier {
            case "Give New Clothes Bundle": // handle this segue here
                //Create a new model object and provide the same to the view
                if let seguedToMVC = segue.destination as? ClothesBundleViewController {
                    seguedToMVC.ClothesBundle = ClothesBundle(context: AppDelegate.viewContext)
                    seguedToMVC.ClothesBundle?.dateGiven = Date() as NSDate
                }
            case "Details Of Given Clothes Bundle": // handle this segue here
                //fetch the data and create a model object from existing data and provide the same to the view
                if let cell = sender as? ClothesBundleTableViewCell,
                    let indexPath = tableView.indexPath(for: cell),
                    let seguedToMVC = segue.destination as? ClothesBundleViewController {
                    seguedToMVC.ClothesBundle = fetchedResultsController?.object(at: indexPath)
                }
            default: break
            }
        }
    }
    

}
