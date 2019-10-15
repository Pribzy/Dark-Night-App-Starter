import UIKit

class MainViewController: UIViewController {

    // MARK: - Constants
    private enum LocalConstants {
        enum KnightType {
            static let dark = "dark"
            static let light = "light"
        }
        enum Container {
            static let movies = "Movies"
            static let tvShows = "TV Shows"
            static let games = "Games"
            static let comics = "Comics"
        }
        static let batColor = "BatColor"
        static let cornerRadius: CGFloat = 15
    }

    // MARK: - Outlets
    @IBOutlet weak var moviesContainer: UIView!
    @IBOutlet weak var tvContainer: UIView!
    @IBOutlet weak var gamesContainer: UIView!
    @IBOutlet weak var comicsContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var batImageView: UIImageView!
    @IBOutlet weak var separatorLine: UIView!

    // MARK: - Properties
    private var titleLabelString: String {
        // TODO: Makes title dynamic
        return ("The light knight app").uppercased()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        customizeViews()
        localizeViews()
    }

    // MARK: - Actions
    @IBAction func moviesTapGestureRecognizer(_ sender: Any) {
        animateTap(view: moviesContainer) {
            self.presentInfoViewController(with: LocalConstants.Container.movies)
        }
    }

    @IBAction func tvShowsTapGestureRecognizer(_ sender: Any) {
        animateTap(view: tvContainer) {
            self.presentInfoViewController(with: LocalConstants.Container.tvShows)
        }
    }

    @IBAction func gamesTapGestureRecognizer(_ sender: Any) {
        animateTap(view: gamesContainer) {
            self.presentInfoViewController(with: LocalConstants.Container.games)
        }
    }

    @IBAction func comicsTapGestureRecognizer(_ sender: Any) {
        animateTap(view: comicsContainer) {
            self.presentInfoViewController(with: LocalConstants.Container.comics)
        }
    }

    // MARK: - Private functions
    private func customizeViews() {
        setupCornerRadius(with: LocalConstants.cornerRadius)
        setupColors()
    }

    private func localizeViews() {
        titleLabel.text = titleLabelString
    }

    private func presentInfoViewController(with title: String) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InfoViewController") as? InfoViewController {
            vc.setup(with: title)
            present(vc, animated: true, completion: nil)
        }
    }

    private func animateTap(view: UIView, completion: @escaping () -> Void ) {
        UIView.animate(withDuration: 0.2, animations: {
            view.transform = CGAffineTransform(scaleX: 0.975, y: 0.96)
        }, completion: { _ in
            UIView.animate(withDuration: 0.2, animations: {
                view.transform = CGAffineTransform.identity
            }, completion: { _ in
                completion()
            })
        })
    }

    private func setupCornerRadius(with cornerRadius: CGFloat) {
        moviesContainer.layer.cornerRadius = cornerRadius
        tvContainer.layer.cornerRadius = cornerRadius
        gamesContainer.layer.cornerRadius = cornerRadius
        comicsContainer.layer.cornerRadius = cornerRadius
    }

    private func setupColors() {
        // TODO: Make title color dynamic
        titleLabel.textColor = .black
        // TODO: Make line color dynamic
        separatorLine.backgroundColor = .black
        batImageView.tintColor = UIColor(named: LocalConstants.batColor)
        // TODO: Make containers color dynamic
        setupContainersColors(with: .gray)
    }

    private func setupContainersColors(with color: UIColor) {
        moviesContainer.backgroundColor = color
        tvContainer.backgroundColor = color
        gamesContainer.backgroundColor = color
        comicsContainer.backgroundColor = color
    }

}

