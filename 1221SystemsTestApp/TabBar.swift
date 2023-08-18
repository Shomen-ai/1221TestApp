import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateTabBar()
        tabBar.backgroundColor = #colorLiteral(red: 0.9686275125, green: 0.9686275125, blue: 0.9686275125, alpha: 1)
        tabBar.tintColor = #colorLiteral(red: 0.3711325526, green: 0.7229725718, blue: 0.2689653039, alpha: 1)
        tabBar.unselectedItemTintColor = #colorLiteral(red: 0.5067252517, green: 0.5093545318, blue: 0.5058791637, alpha: 1)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -5)
        tabBar.layer.shadowColor = UIColor.darkGray.cgColor
        tabBar.layer.shadowRadius = 0.5
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(
                viewController: HomeViewController(),
                image: UIImage(systemName: "house"),
                title: "Главная"
            ),
            generateVC(
                viewController: CatalogViewController(),
                image: UIImage(systemName: "square.grid.2x2"),
                title: "Каталог"
            ),
            generateVC(
                viewController: CartViewController(),
                image: UIImage(systemName: "cart.fill"),
                title: "Корзина"
            ),
            generateVC(
                viewController: ProfileViewController(),
                image: UIImage(systemName: "person.crop.circle"),
                title: "Профиль"
            )
        ]
    }
    
    private func generateVC(viewController: UIViewController, image: UIImage?, title: String) -> UIViewController {
        viewController.tabBarItem.image = image
        viewController.tabBarItem.title = nil
        viewController.title = title
        return UINavigationController(rootViewController: viewController)
    }
}
