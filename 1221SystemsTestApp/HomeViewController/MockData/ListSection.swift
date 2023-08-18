// List of sections

enum ListSection {
    // What sections we have
    case news ([ListItem])
    case sales ([ListItem])
    case bonus ([ListItem])
    case options ([ListItem])
    case recommendations ([ListItem])
    case sweetMood ([ListItem])
    
    // Items in section
    var items: [ListItem] {
        switch self {
        case .news(let items),
                .sales(let items),
                .bonus(let items),
                .options(let items),
                .recommendations(let items),
                .sweetMood(let items):
            return items
            
        }
    }
    
    // Count of items
    var count: Int {
        return items.count
    }
    
    // Title of section
    var title: String {
        switch self {
        case .news(_),
                .sales(_),
                .bonus(_),
                .options(_):
            return ""
        case .recommendations(_):
            return "Рекомендации"
        case .sweetMood(_):
            return "Слдакое настроение"
        }
    }
}
