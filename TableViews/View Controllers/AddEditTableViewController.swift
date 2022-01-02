//
//  AddEditTableViewController.swift
//  TableViews
//
//  Created by Наталья Шарапова on 25.12.2021.
//

import UIKit

class AddEditTableViewController: UITableViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var symbolTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var usageTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    //MARK: - Properties
    
    var emoji = Emoji()
    
    
    //MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Disabling the saveButton
        saveButton.isEnabled = false
        
        updateUI()
    }
    
    private func updateUI() {
        
        //Assigning the data from EmojiTableViewController
        
        symbolTextField.text = emoji.symbol
        nameTextField.text = emoji.name
        descriptionTextField.text = emoji.description
        usageTextField.text = emoji.usage
    }
    
    //Checking the symbolTextField and enabling the saveButton
    
    private func checkTextField() {
        guard let checkText = symbolTextField.text else { return }
        
        if symbolTextField.text?.count == 1 && checkText.unicodeScalars.allSatisfy({ $0.properties.isEmoji }) {
            saveButton.isEnabled = true
        }
    }
    
   private func saveEmoji() {
        
        emoji.symbol = symbolTextField.text ?? ""
        emoji.name = nameTextField.text ?? ""
        emoji.description = descriptionTextField.text ?? ""
        emoji.usage = usageTextField.text ?? ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        saveEmoji()
    }
    
    @IBAction func symbolTextFieldSelected(_ sender: UITextField) {
        checkTextField()
    }
}
