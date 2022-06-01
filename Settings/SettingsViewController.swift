import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource {

    private lazy var settings: [[SettingCellType]] = {
        let settings = [
            [
                Cell.airplaneMode,
                Cell.wifi,
                Cell.bluetooth,
                Cell.mobileData,
                Cell.hotspot,
                Cell.vpn
            ],
            [
                Cell.notificaitons,
                Cell.sound,
                Cell.focus,
                Cell.screenTime
            ],
            [
                Cell.general,
                Cell.controlCentre,
                Cell.display,
                Cell.home,
                Cell.accessibility,
                Cell.wallpaper,
                Cell.faceid,
                Cell.battery,
                Cell.privacy
            ]
        ]

        return settings
    }()

    private lazy var settingsTableView: UITableView = {
        let table = UITableView(frame: CGRect.zero, style: .insetGrouped)
        table.sectionFooterHeight = 20

        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupHierarchy()
        setupLayout()
        setupView()
    }

    private func setupHierarchy() {
        view.addSubview(settingsTableView)
    }

    private func setupLayout() {
        settingsTableView.translatesAutoresizingMaskIntoConstraints = false
        settingsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        settingsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        settingsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        settingsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func setupView() {
        view.backgroundColor = Color.mainBackgroundColor

        navigationController?.navigationBar.prefersLargeTitles = true

        title = "Settings"

        settingsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        settingsTableView.dataSource = self
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return settings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)

        var content = cell.defaultContentConfiguration()

        let image = UIImage(systemName: settings[indexPath.section][indexPath.row].iconName)
        content.image = image
        content.imageProperties.maximumSize.width = 20
        content.imageProperties.maximumSize.height = 20
        content.imageProperties.reservedLayoutSize = CGSize(width: 20, height: 20)
        content.imageProperties.tintColor = .black

        content.text = settings[indexPath.section][indexPath.row].title
        content.textProperties.font = .systemFont(ofSize: 17)

        content.secondaryText = settings[indexPath.section][indexPath.row].detailedText ?? ""
        content.secondaryTextProperties.font = .systemFont(ofSize: 16)
        content.secondaryTextProperties.color = .gray
        content.prefersSideBySideTextAndSecondaryText = true

        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].count
    }
}

extension SettingsViewController {

    typealias SettingCellType = (title: String, iconName: String, backgroundColor: UIColor, detailedText: String?, isToggle: Bool?)

    enum Metric {
        static let parentStackViewSpacing: CGFloat = 10
    }

    enum Color {
        static let mainBackgroundColor = #colorLiteral(red: 0.949019134, green: 0.9490200877, blue: 0.9705254436, alpha: 1)
    }

    enum Cell {
        static let airplaneMode = SettingCellType("Airplane Mode", "airplane", .red, nil, true)
        static let wifi = SettingCellType(title: "Wi-Fi", iconName: "wifi", .red, "Not connected", nil)
        static let bluetooth = SettingCellType(title: "Bluetooth", iconName: "bold", .red, "On", nil)
        static let mobileData = SettingCellType(title: "Mobile Data", iconName: "antenna.radiowaves.left.and.right", .red, nil, nil)
        static let hotspot = SettingCellType(title: "Personal Hotspot", iconName: "personalhotspot", .red, "Off", nil)
        static let vpn = SettingCellType(title: "VPN", iconName: "lock.shield.fill", .red, nil, true)
        static let notificaitons = SettingCellType(title: "Notifications", iconName: "bell.badge.fill", .red, nil, nil)
        static let sound = SettingCellType(title: "Sound & Haptics", iconName: "speaker.wave.3.fill", .red, nil, nil)
        static let focus = SettingCellType(title: "Focus", iconName: "moon.fill", .red, nil, nil)
        static let screenTime = SettingCellType(title: "Screen Time", iconName: "hourglass", .red, nil, nil)
        static let general = SettingCellType(title: "General", iconName: "gear", .red, nil, nil)
        static let controlCentre = SettingCellType(title: "Control Centre", iconName: "switch.2", .red, nil, nil)
        static let display = SettingCellType(title: "Display & Brightness", iconName: "textformat.size", .red, nil, nil)
        static let home = SettingCellType(title: "Home Screen", iconName: "house.fill", .red, nil, nil)
        static let accessibility = SettingCellType(title: "Accessibility", iconName: "person.2.circle", .red, nil, nil)
        static let wallpaper = SettingCellType(title: "Wallpaper", iconName: "circle.hexagonpath.fill", .red, nil, nil)
        static let faceid = SettingCellType(title: "FaceID & Passcode", iconName: "faceid", .red, nil, nil)
        static let battery = SettingCellType(title: "Battery", iconName: "battery.100", .red, nil, nil)
        static let privacy = SettingCellType(title: "Privacy", iconName: "hand.raised.fill", .red, nil, nil)
    }
}
