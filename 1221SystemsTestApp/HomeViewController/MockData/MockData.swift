// MockData for app

struct Mockdata {
    
    static let shared = Mockdata()
    
    private let news: ListSection = {
        .news([.init(title: "Привеегии Мой SPAR", image: "apples"),
               .init(title: "Мы в соцсетях", image: "apples"),
               .init(title: "3 рецепта коктейля", image: "apples"),
               .init(title: "Дегустации в SPAR", image: "apples"),
               .init(title: "Новинки недели", image: "apples"),
               .init(title: "Привеегии Мой SPAR", image: "apples")])
    }()
    
    private let sales: ListSection = {
        .sales([.init(title: "", image: "apples"),
                .init(title: "", image: "apples"),
                .init(title: "", image: "apples"),
                .init(title: "", image: "apples"),
                .init(title: "", image: "apples"),
                .init(title: "", image: "apples")])
    }()
    
    private let bonus: ListSection = {
        .bonus([.init(title: "0 бонусов", image: "apples")])
    }()
    
    private let options: ListSection = {
        .options([.init(title: "Абонемент на кофе", image: "apples"),
                  .init(title: "Мои скидки", image: "apples"),
                  .init(title: "Карта в подарок", image: "apples"),
                  .init(title: "Доставка за 1 час", image: "apples"),
                  .init(title: "Абонемент на кофе", image: "apples"),
                  .init(title: "Мои скидки", image: "apples")])
    }()
    
    private let recommendations: ListSection = {
        .recommendations([.init(title: "259.90 ₽/шт", image: "apples"),
                          .init(title: "99.90 ₽/шт", image: "apples"),
                          .init(title: "309.90 ₽/шт", image: "apples"),
                          .init(title: "259.90 ₽/шт", image: "apples"),
                          .init(title: "99.90 ₽/шт", image: "apples"),
                          .init(title: "309.90 ₽/шт", image: "apples")])
    }()
    
    private let sweetMood: ListSection = {
        .sweetMood([.init(title: "99.90 ₽/шт", image: "apples"),
                    .init(title: "99.90 ₽/шт", image: "apples"),
                    .init(title: "99.90 ₽/шт", image: "apples"),
                    .init(title: "99.90 ₽/шт", image: "apples"),
                    .init(title: "99.90 ₽/шт", image: "apples"),
                    .init(title: "99.90 ₽/шт", image: "apples")])
    }()
    
    var pageData: [ListSection] { [news, sales, bonus, options, recommendations, sweetMood] }
}
