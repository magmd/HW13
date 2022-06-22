import UIKit

typealias SettingCellType = (
    title: String,
    iconName: String,
    backgroundColor: UIColor,
    detailedText: String?,
    isToggle: Bool?,
    badgeCount: Int?
)

enum Metric {
    static let sectionFooterHeight: CGFloat = 20
    static let heightForRow: CGFloat = 47
}

enum Constants {
    static let title: String = "Settings"
    static let cellId: String = "DefaultCell"
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
