import UIKit

final class SettingsController: UIViewController {

    private var settingsView: SettingsView? {
        guard isViewLoaded else { return nil }
        return view as? SettingsView
    }

    var model: SettingsModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        view = SettingsView()
        model = SettingsModel()

        configureView()
    }

}

private extension SettingsController {
    func configureView() {
        guard let models = model?.createModel() else { return }

        navigationController?.navigationBar.prefersLargeTitles = true
        title = Constants.title

        settingsView?.configureView(with: models)

    }
}
