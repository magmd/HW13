import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

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
        let table = UITableView(frame: view.bounds, style: .insetGrouped)
        table.sectionFooterHeight = Metric.sectionFooterHeight

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
        settingsTableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

    private func setupView() {
        view.backgroundColor = Color.mainBackgroundColor

        navigationController?.navigationBar.prefersLargeTitles = true

        title = Metric.title

        settingsTableView.register(SettingsCustomTableViewCell.self, forCellReuseIdentifier: Metric.cellId)
        settingsTableView.dataSource = self
        settingsTableView.delegate = self
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return settings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Metric.cellId, for: indexPath) as! SettingsCustomTableViewCell

        cell.settingsCell = settings[indexPath.section][indexPath.row]

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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Нажата ячейка \(settings[indexPath.section][indexPath.row].title)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SettingsViewController {

    typealias SettingCellType = (
        title: String,
        iconName: String,
        backgroundColor: UIColor,
        detailedText: String?,
        isToggle: Bool?,
        badgeCount: Int?
    )

    enum Metric {
        static let parentStackViewSpacing: CGFloat = 10
        static let sectionFooterHeight: CGFloat = 20
        static let title: String = "Settings"
        static let cellId: String = "DefaultCell"
        static let heightForRow: CGFloat = 47
    }

    enum Color {
        static let mainBackgroundColor = #colorLiteral(red: 0.949019134, green: 0.9490200877, blue: 0.9705254436, alpha: 1)
        static let orange = #colorLiteral(red: 1, green: 0.5835773945, blue: 0, alpha: 1)
        static let blue = #colorLiteral(red: 0.02692864463, green: 0.4739965796, blue: 0.998641789, alpha: 1)
        static let green = #colorLiteral(red: 0.2007317841, green: 0.7756176591, blue: 0.3500651121, alpha: 1)
        static let red = #colorLiteral(red: 0.9977579713, green: 0.1741217375, blue: 0.3346705437, alpha: 1)
        static let gray = #colorLiteral(red: 0.5529406667, green: 0.5529416203, blue: 0.5744293928, alpha: 1)
        static let darkBlue = #colorLiteral(red: 0, green: 0.251372844, blue: 0.8644900322, alpha: 1)
        static let darkViolet = #colorLiteral(red: 0.3420267105, green: 0.3371084332, blue: 0.8371117711, alpha: 1)
    }

    enum Cell {
        static let airplaneMode = SettingCellType("Airplane Mode", "airplane", Color.orange, nil, true, nil)
        static let wifi = SettingCellType(title: "Wi-Fi", iconName: "wifi", Color.blue, "Not connected", nil, nil)
        static let bluetooth = SettingCellType(title: "Bluetooth", iconName: "bluetooth", Color.blue, "On", nil, nil)
        static let mobileData = SettingCellType(title: "Mobile Data", iconName: "antenna.radiowaves.left.and.right", Color.green, nil, nil, nil)
        static let hotspot = SettingCellType(title: "Personal Hotspot", iconName: "personalhotspot", Color.green, "Off", nil, nil)
        static let vpn = SettingCellType(title: "VPN", iconName: "vpn", Color.blue, nil, true, nil)
        static let notificaitons = SettingCellType(title: "Notifications", iconName: "bell.badge.fill", Color.red, nil, nil, nil)
        static let sound = SettingCellType(title: "Sound & Haptics", iconName: "speaker.wave.3.fill", Color.red, nil, nil, nil)
        static let focus = SettingCellType(title: "Focus", iconName: "moon.fill", Color.darkViolet, nil, nil, nil)
        static let screenTime = SettingCellType(title: "Screen Time", iconName: "hourglass", Color.darkViolet, nil, nil, nil)
        static let general = SettingCellType(title: "General", iconName: "gear", Color.gray, nil, nil, 1)
        static let controlCentre = SettingCellType(title: "Control Centre", iconName: "switch.2", Color.gray, nil, nil, nil)
        static let display = SettingCellType(title: "Display & Brightness", iconName: "textformat.size", Color.blue, nil, nil, nil)
        static let home = SettingCellType(title: "Home Screen", iconName: "house.fill", Color.darkBlue, nil, nil, nil)
        static let accessibility = SettingCellType(title: "Accessibility", iconName: "person.2.circle", Color.blue, nil, nil, nil)
        static let wallpaper = SettingCellType(title: "Wallpaper", iconName: "circle.hexagonpath.fill", Color.gray, nil, nil, nil)
        static let faceid = SettingCellType(title: "FaceID & Passcode", iconName: "faceid", Color.green, nil, nil, nil)
        static let battery = SettingCellType(title: "Battery", iconName: "battery.100", Color.green, nil, nil, nil)
        static let privacy = SettingCellType(title: "Privacy", iconName: "hand.raised.fill", Color.blue, nil, nil, nil)
    }
}
