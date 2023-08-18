import UIKit

final class OptionsCollectionViewCell: UICollectionViewCell {
    private let optionsImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let optionsTitle: UILabel = {
        let view = UILabel()
        view.numberOfLines = 2
        view.textAlignment = .left
        view.font = UIFont.systemFont(ofSize: 16)
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
        optionsImage.image = nil
        optionsTitle.text = nil
    }
    
    private func setupView() {
        backgroundColor = .brown
        addSubview(optionsImage)
        addSubview(optionsTitle)
        clipsToBounds = true
        layer.cornerRadius = 15
        layer.cornerRadius = 15
        layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        layer.shadowOpacity = 1
        layer.shadowOffset = .init(width: 50, height: 50)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            optionsImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            optionsImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 5),
            optionsImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5),
            optionsImage.widthAnchor.constraint(equalToConstant: contentView.frame.height * 1/2),
            optionsImage.heightAnchor.constraint(equalToConstant: contentView.frame.height * 1/2),
            optionsTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            optionsTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            optionsTitle.topAnchor.constraint(equalTo: topAnchor, constant: 5)
        ])
    }
    
    func configureCell(optionImage: String, optionTitle: String) {
        optionsImage.image = UIImage(named: optionImage)
        optionsTitle.text = optionTitle
        backgroundColor = HelpFunctions.shared.generateRandomPastelColor()
    }
}
