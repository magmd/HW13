import CoreGraphics

final class SettingsModel {

    func createModel() -> [[SettingCellType]] {
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
    }
}
