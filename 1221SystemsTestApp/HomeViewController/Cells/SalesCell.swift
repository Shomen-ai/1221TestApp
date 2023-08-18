import UIKit

final class SalesCollectionViewCell: UICollectionViewCell {
    private let salesImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
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
        salesImage.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        layer.shadowOpacity = 1
        layer.shadowOffset = .init(width: -1, height: 1)
    }
    private func setupView() {
        addSubview(salesImage)
        layer.cornerRadius = 15
        clipsToBounds = true
        layer.cornerRadius = 15
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            salesImage.topAnchor.constraint(equalTo: topAnchor),
            salesImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            salesImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            salesImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configureCell(imageName: String) {
        salesImage.image = UIImage(named: imageName)
    }
}
