import SwiftUI

enum Icons {
    static func flagScan(withColor color: Color = .iconButtonTitle) -> some View {
        Image(systemName: "flag")
            .foregroundColor(color)
            .font(.system(size: 16, weight: .semibold))
    }
    static func flagScanFilled(withColor color: Color = .bannerText) -> some View {
        Image(systemName: "flag.fill")
            .foregroundColor(color)
            .font(.system(size: 16, weight: .semibold))
    }
    static func addUser(withColor color: Color = .secondaryButtonTitle) -> some View {
        Image(systemName: "person.fill.badge.plus")
            .foregroundColor(color)
    }

    static func refresh(withColor color: Color = .white) -> some View {
        Image(systemName: "arrow.triangle.2.circlepath")
            .foregroundColor(color)
    }
    static func refreshDisabled(withColor color: Color = .subtleTitle) -> some View {
        Image(systemName: "exclamationmark.arrow.triangle.2.circlepath")
            .foregroundColor(color)
    }

    static func offline(withColor color: Color = .white) -> some View {
        Image(systemName: "icloud.slash")
            .foregroundColor(color)
    }

    static func noInternet() -> Image {
        Image(systemName: "wifi.slash")
    }

    static func close(withColor color: Color = .white) -> some View {
        Image(systemName: "xmark.circle")
            .resizable()
            .foregroundColor(color)
            .frame(width: 20.0, height: 20.0)
    }

    static func exclamation() -> Image {
        Image(systemName: "exclamationmark.circle")
    }

    static func exclamationFilled(withColor color: Color = .warning) -> some View {
        Image(systemName: "exclamationmark.circle.fill")
            .resizable()
            .foregroundColor(color)
    }

    static func done(withColor color: Color = .attention) -> some View {
        Image(systemName: "checkmark.circle.fill")
            .resizable()
            .foregroundColor(color)
    }

    static func arrowLeft() -> some View {
        Image(systemName: "arrow.left")
    }

    static func arrowRight() -> some View {
        Image(systemName: "arrow.right")
    }

    static func info(withColor color: Color = .white) -> some View {
        Image(systemName: "info.circle")
            .resizable()
            .foregroundColor(color)
    }

    static func infoFilled(withColor color: Color = .white) -> some View {
        Image(systemName: "info.circle.fill")
            .resizable()
            .foregroundColor(color)
    }

    static func checkmark(withColor color: Color = .white) -> some View {
        Image(systemName: "checkmark")
            .foregroundColor(color)
    }

    static func chevronRight(withColor color: Color = .white) -> some View {
        Image(systemName: "chevron.right.2")
            .foregroundColor(color)
    }

    #if os(iOS)
    static func arrowLeftCircle() -> some View {
        Image(systemName: "arrow.left.circle.fill")
            .foregroundColor(.red)
    }

    static func settings(withColor color: Color = .white) -> some View {
        Image(systemName: "gearshape")
            .resizable()
            .foregroundColor(color)
            .frame(width: 17.0, height: 17.0)
    }

    static func globe(withColor color: Color = .white) -> some View {
        Image(systemName: "globe")
            .resizable()
            .foregroundColor(color)
            .frame(width: 17.0, height: 17.0)
    }

    static func arrowDown() -> some View {
        Image(systemName: "chevron.down")
    }
    #endif
}

