//
//  CellManager.swift
//  TableViews
//
//  Created by Наталья Шарапова on 25.12.2021.
//

import UIKit

class CellManager {
    
    func configure(_ cell: EmojiCell, with emoji: Emoji) {
        
        cell.symbolLabel.text = emoji.symbol
        cell.nameLabel.text = emoji.name
        cell.descriptionLabel.text = emoji.description
    }
}
