//
//  Emoji.swift
//  TableViews
//
//  Created by Наталья Шарапова on 25.12.2021.
//

struct Emoji {
    
    var name: String
    var description: String
    var symbol: String
    var usage: String
    
    init(symbol: String = "", description: String = "", name: String = "", usage: String = "") {
        self.name = name
        self.description = description
        self.usage = usage
        self.symbol = symbol
    }
}

extension Emoji {
    
    static var all: [Emoji] {
        
        return [
            Emoji(symbol: "💯", description: "100 %", name: "Сто процентов", usage: "Используем, когда с чем - то согласны"),
            Emoji(symbol: "😛", description: "Дразнящая мордочка", name: "Показываем язык", usage: "Используем, когда кого - то дразним"),
            Emoji(symbol: "🥶", description: "Синяя замерзшая мордочка", name: "Замерзаю", usage: "Используем, когда очень холодно"),
            Emoji(symbol: "😧", description: "Удивленная мордочка", name: "Удивление", usage: "Используем, когда что - то удивило"),
        ]
    }
    
    static func loadAll() -> [Emoji]? {
        return nil
    }
    
    static func loadDefaults() -> [Emoji] {
        return all
    }
}

