import UIKit

class SettingsView: UIView {

    private lazy var settings = [[SettingCellType]]()

    private lazy var cellId: String = Constants.cellId

    private lazy var settingsTableView: UITableView = {
        let table = UITableView(frame: self.bounds, style: .insetGrouped)
        table.sectionFooterHeight = Metric.sectionFooterHeight

        return table
    }()

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        setupHierarchy()
        setupLayout()
        setupView()
    }

    private func setupHierarchy() {
        self.addSubview(settingsTableView)
    }

    private func setupLayout() {
        settingsTableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

    private func setupView() {
        self.backgroundColor = Color.mainBackgroundColor

        settingsTableView.register(SettingsCustomTableViewCell.self, forCellReuseIdentifier: cellId)
        settingsTableView.dataSource = self
        settingsTableView.delegate = self
    }

    func configureView(with model: [[SettingCellType]]) {
        settings = model
    }
}

// MARK: - UITableViewDataSource

extension SettingsView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: cellId, for: indexPath
        ) as? SettingsCustomTableViewCell else { return UITableViewCell() }

        cell.configure(with: settings[indexPath.section][indexPath.row])

        cell.layoutMargins = .init(top: 0, left: 63, bottom: 0, right: 0)
        cell.accessoryType = .disclosureIndicator

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Metric.heightForRow
    }
}

// MARK: - UITableViewDelegate

extension SettingsView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Нажата ячейка \(settings[indexPath.section][indexPath.row].title)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
