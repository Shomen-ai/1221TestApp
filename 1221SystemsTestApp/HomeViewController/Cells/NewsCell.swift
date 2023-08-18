import UIKit

final class NewsCollectionViewCell: UICollectionViewCell {
    private let newsImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let newsTitle: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 12)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        newsImage.image = nil
        newsTitle.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        newsImage.layer.cornerRadius = newsImage.frame.height / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .none
        addSubview(newsImage)
        addSubview(newsTitle)
        layer.cornerRadius = 15
        clipsToBounds = true
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            newsImage.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            newsImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            newsImage.heightAnchor.constraint(equalToConstant: contentView.frame.height * 2/3 - 15),
            newsImage.widthAnchor.constraint(equalToConstant: contentView.frame.height * 2/3 - 15)
        ])
        
        NSLayoutConstraint.activate([
            newsTitle.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 5),
            newsTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            newsTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            newsTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        ])
    }
    
    func configureCell(imageName: String, title: String) {
        newsImage.image = UIImage(named: imageName)
        newsTitle.text = title
    }
}
