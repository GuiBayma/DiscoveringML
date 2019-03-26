//
//  RobotView
//  View for Smarty the robot
//

import UIKit

public final class RobotView: UIView {

    private lazy var robotImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var speechBubbleView: UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()

    private lazy var speechLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.backgroundColor = .clear
        return label
    }()

    public override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViewHierarchy()
        setupConstraints()
        configureViews()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View configuration

    private func setupViewHierarchy() {
        addSubview(speechBubbleView)
        speechBubbleView.addSubview(speechLabel)
        addSubview(robotImageView)
    }

    private func setupConstraints() {
        let margin: CGFloat = 30

        NSLayoutConstraint.activate([
            speechBubbleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin),
            speechBubbleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -margin),
            speechBubbleView.bottomAnchor.constraint(equalTo: robotImageView.topAnchor, constant: -margin),
            speechBubbleView.heightAnchor.constraint(equalToConstant: 60),

            speechLabel.leadingAnchor.constraint(equalTo: speechBubbleView.leadingAnchor),
            speechLabel.topAnchor.constraint(equalTo: speechBubbleView.topAnchor),
            speechLabel.trailingAnchor.constraint(equalTo: speechBubbleView.trailingAnchor),
            speechBubbleView.bottomAnchor.constraint(equalTo: speechBubbleView.bottomAnchor),

            robotImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            robotImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            robotImageView.heightAnchor.constraint(equalToConstant: 330),
            robotImageView.widthAnchor.constraint(equalTo: robotImageView.heightAnchor, multiplier: 0.668)
        ])
    }

    private func configureViews() {
        backgroundColor = UIColor(red: 220.0/255.0, green: 245.0/255.0, blue: 246.0/255.0, alpha: 1.0)
    }

    // MARK: - Setters

    public func setLabel(_ text: String?) {
        speechLabel.text = text
    }

    public func setImage(_ image: UIImage?) {
        robotImageView.image = image
    }
}
