import UIKit

final class ProductsCollectionViewCell: UICollectionViewCell {
    private let productsImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let productsTitle: UILabel = {
        let view = UILabel()
        view.numberOfLines = 2
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let buyButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        view.layer.masksToBounds = true
        view.setImage(UIImage(systemName: "cart.fill"), for: .normal)
        view.tintColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        productsImage.image = nil
        productsTitle.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        buyButton.layer.cornerRadius = buyButton.frame.height / 2
    }
    
    private func setupView() {
        backgroundColor = .white
        addSubview(productsImage)
        addSubview(productsTitle)
        addSubview(buyButton)
        clipsToBounds = true
        layer.cornerRadius = 15
        layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        layer.shadowOpacity = 1
        layer.shadowOffset = .init(width: 50, height: 50)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            productsImage.topAnchor.constraint(equalTo: topAnchor),
            productsImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            productsImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            productsImage.heightAnchor.constraint(equalToConstant: contentView.frame.height*2/3),
            
            buyButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            buyButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            buyButton.widthAnchor.constraint(equalToConstant: 40),
            buyButton.heightAnchor.constraint(equalToConstant: 40),
            
            productsTitle.leadingAnchor.constraint(equalTo: leadingAnchor),
            productsTitle.trailingAnchor.constraint(equalTo: buyButton.leadingAnchor, constant: -10),
            productsTitle.centerYAnchor.constraint(equalTo: buyButton.centerYAnchor)
        ])
    }
    
    func configureCell(productImage: String, productTitle: String) {
        productsImage.image = UIImage(named: productImage)
        productsTitle.text = productTitle
    }
}
