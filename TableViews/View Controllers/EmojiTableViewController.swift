//
//  EmojiTableViewController.swift
//  TableViews
//
//  Created by Наталья Шарапова on 25.12.2021.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    
    // MARK: - Properties
    
    private let cellManager = CellManager()
    private var emojies = [Emoji]()
    
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emojies = Emoji.loadAll() ?? Emoji.loadDefaults()
        
        //Changing leftBarButtonItem
        navigationItem.leftBarButtonItem = editButtonItem
        
        //Automaic dimension of cell
        tableView.estimatedRowHeight = 75
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    //Prepare the data for AddEditTableViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "EditSegue" else { return }
        guard let selectedPath = tableView.indexPathForSelectedRow else { return }
        
        let emoji = emojies[selectedPath.row]
        let destination = segue.destination as! AddEditTableViewController
        
        //Assigning the data from the selected cell to the emoji property
        destination.emoji = emoji
    }
}

//MARK: - Extensions

extension EmojiTableViewController /*: UITableViewDataSource */ {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let emoji = emojies[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell")! as! EmojiCell
        
        //Assigning the data from the Emoji to all labels
        cellManager.configure(cell, with: emoji)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        //Moving cells
        let movedEmoji = emojies.remove(at: sourceIndexPath.row)
        emojies.insert(movedEmoji, at: destinationIndexPath.row)
        
        tableView.reloadData()
    }
}

extension EmojiTableViewController /*: UITableViewDelegate*/ {
    
    //Adding possibility to delete the cell
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        switch editingStyle {
        
        case .delete:
            //Deleting the cell
            
            emojies.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        case .insert:
            break
        case .none:
            break
            
        @unknown default:
            print("Unknown case in file \(#file)")
        }
    }
}

extension EmojiTableViewController {
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
        guard segue.identifier == "SaveSegue" else { return }
        
        //Data transmission from AddEditTableViewController
        
        let sourse = segue.source as! AddEditTableViewController
        let emoji = sourse.emoji
        
        if let selectedPath = tableView.indexPathForSelectedRow {
            
            // Edited cell
            emojies[selectedPath.row] = emoji
            
            tableView.reloadRows(at: [selectedPath], with: .left)
            
        } else {
            
            // Added cell
            let indexPath = IndexPath(row: emojies.count, section: 0)
            
            emojies.append(emoji)
            
            tableView.insertRows(at: [indexPath], with: .middle)
        }
    }
}
