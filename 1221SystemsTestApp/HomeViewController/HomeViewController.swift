import UIKit

final class HomeViewController: UIViewController {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.bounces = false
        view.backgroundColor = .white
        view.showsVerticalScrollIndicator = false
        view.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: NewsCollectionViewCell.identifier)
        view.register(SalesCollectionViewCell.self, forCellWithReuseIdentifier: SalesCollectionViewCell.identifier)
        view.register(BonusCollectionViewCell.self, forCellWithReuseIdentifier: BonusCollectionViewCell.identifier)
        view.register(OptionsCollectionViewCell.self, forCellWithReuseIdentifier: OptionsCollectionViewCell.identifier)
        view.register(ProductsCollectionViewCell.self,
                      forCellWithReuseIdentifier: ProductsCollectionViewCell.identifier)
        view.register(HeaderSupplementaryView.self,
                      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                      withReuseIdentifier: "HeaderSupplementaryView")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let sections = Mockdata.shared.pageData
    
    private let searchBar: UISearchBar = {
        let view = UISearchBar()
        view.setImage(UIImage(named: "mappin.and.ellipse"), for: .search, state: .normal)
        view.placeholder = "Найти магазин..."
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupCollectionView()
        setupCollectionViewDelegate()
    }
    
    private func setupView() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(collectionView)
        navigationItem.titleView = searchBar
        collectionView.collectionViewLayout = createLayout()
    }
    
    private func setupCollectionView() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    private func setupCollectionViewDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupSearchBarDelegate() {
        searchBar.delegate = self
    }
}

// MARK: - Create layout
extension HomeViewController {
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else { return nil }
            let section = self.sections[sectionIndex]
            switch section {
            case .news(_):
                return self.createNewsSection()
            case .sales(_):
                return self.createSalesSection()
            case .bonus(_):
                return self.createBonusSection()
            case .options(_):
                return self.createOptionsSection()
            case .recommendations(_):
                return self.createProductsSection()
            case .sweetMood(_):
                return self.createProductsSection()
            }
        }
    }
    
    private func createNewsSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension:
                .fractionalWidth(0.26),
                                                                       heightDimension: .absolute(150)),
                                                     subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 10
        section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        return section
    }
    
    private func createSalesSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.9),
                                                                         heightDimension: .fractionalHeight(0.3)),
                                                       subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.interGroupSpacing = 10
        section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        return section
    }
    
    private func createBonusSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                       heightDimension: .fractionalHeight(0.2)),
                                                     subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
        section.interGroupSpacing = 10
        section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        return section
    }
    
    private func createOptionsSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.35),
                                                                         heightDimension: .absolute(130)),
                                                       subitems: [item])
        group.interItemSpacing = .fixed(10)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 10
        section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        return section
    }
    
    private func createProductsSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(
            widthDimension: .fractionalWidth(0.4),
            heightDimension: .absolute(200)),
                                                     subitems: [item])
        group.interItemSpacing = .fixed(10)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 10
        section.boundarySupplementaryItems = [supplementaryHeaderItem()]
        section.supplementariesFollowContentInsets = false
        section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        return section
    }
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(30)),
              elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
}


// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
        case .news(let news):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.identifier,
                                                                for: indexPath) as? NewsCollectionViewCell
            else { return UICollectionViewCell() }
            cell.configureCell(imageName: news[indexPath.row].image, title: news[indexPath.row].title)
            return cell
        case .sales(let sales):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SalesCollectionViewCell.identifier,
                                                                for: indexPath) as? SalesCollectionViewCell
            else { return UICollectionViewCell() }
            cell.configureCell(imageName: sales[indexPath.row].image)
            return cell
        case .bonus(let bonus):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BonusCollectionViewCell.identifier,
                                                                for: indexPath) as? BonusCollectionViewCell
            else { return UICollectionViewCell() }
            cell.configureCell(QRCodeString: "https://1221systems.ru/", bonuses: bonus[indexPath.row].title,
                               backgroundImage: bonus[indexPath.row].image)
            return cell
        case .options(let options):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: OptionsCollectionViewCell.identifier,
                for: indexPath) as? OptionsCollectionViewCell
            else { return UICollectionViewCell() }
            cell.configureCell(optionImage: options[indexPath.row].image, optionTitle: options[indexPath.row].title)
            return cell
        case .recommendations(let reccomendations):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ProductsCollectionViewCell.identifier,
                for: indexPath) as? ProductsCollectionViewCell
            else { return UICollectionViewCell() }
            cell.configureCell(productImage: reccomendations[indexPath.row].image,
                               productTitle: reccomendations[indexPath.row].title)
            return cell
        case .sweetMood(let sweets):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsCollectionViewCell.identifier,
                                                                for: indexPath) as? ProductsCollectionViewCell
            else { return UICollectionViewCell() }
            cell.configureCell(productImage: sweets[indexPath.row].image,
                               productTitle: sweets[indexPath.row].title)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: "HeaderSupplementaryView",
                                                                               for: indexPath) as? HeaderSupplementaryView
            else { return UICollectionReusableView() }
            header.configureHeader(title: sections[indexPath.section].title)
            return header
        default:
            return UICollectionReusableView()
        }
    }
}


// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    
}

extension HomeViewController: UISearchBarDelegate {
    
}
