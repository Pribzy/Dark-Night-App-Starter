import UIKit

class InfoViewController: UIViewController {

    // MARK: - Properties
    private var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 46)
        // TODO: Makes title dynamic
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()

    private var backgroundView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        view.translatesAutoresizingMaskIntoConstraints = false
        // TODO: Make background blur effect view dynamic
        view.effect = UIBlurEffect(style: .light)
        return view
    }()

    // TODO: Make title vibrant

    override func viewDidLoad() {
        super.viewDidLoad()
        customizeViews()
        // TODO: Show VC always in Dark Mode
        //overrideUserInterfaceStyle = .dark
    }

    func setup(with title: String) {
        titleLabel.text = title.uppercased()
    }

    private func customizeViews() {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        backgroundView.contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            titleLabel.topAnchor.constraint(equalTo: backgroundView.contentView.topAnchor, constant: 32),
            titleLabel.centerXAnchor.constraint(equalTo: backgroundView.contentView.centerXAnchor)
        ])
    }
}
