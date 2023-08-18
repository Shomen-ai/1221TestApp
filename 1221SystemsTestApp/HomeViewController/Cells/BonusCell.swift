import UIKit

final class BonusCollectionViewCell: UICollectionViewCell {
    private let QRCodeImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let bonusesCount: UILabel = {
        let view = UILabel()
        view.numberOfLines = 2
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 24)
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
        QRCodeImage.image = nil
        bonusesCount.text = nil
    }
    
    private func setupView() {
        backgroundColor = .none
        addSubview(QRCodeImage)
        addSubview(bonusesCount)
        clipsToBounds = true
        layer.cornerRadius = 15
        layer.cornerRadius = 15
        layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        layer.shadowOpacity = 1
        layer.shadowOffset = .init(width: 50, height: 50)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            QRCodeImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            QRCodeImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            QRCodeImage.heightAnchor.constraint(equalToConstant: contentView.frame.height - 10),
            QRCodeImage.widthAnchor.constraint(equalToConstant: contentView.frame.height - 10),
            bonusesCount.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            bonusesCount.topAnchor.constraint(equalTo: topAnchor, constant: 10)
        ])
    }
    
    func configureCell(QRCodeString: String, bonuses: String, backgroundImage: String) {
        QRCodeImage.image = HelpFunctions.shared.generateQRCode(from: QRCodeString)
        bonusesCount.text = bonuses
        let backgroundImage = UIImage(named: backgroundImage)
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundView = backgroundImageView
    }
}
