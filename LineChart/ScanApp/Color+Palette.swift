import SwiftUI

extension Color {
    // MARK: General
    static var pageBackground: Color { Color("dark-indigo") }
    static var panelBackground: Color { Color("midnight-express") }
    static var panelSeparator: Color { .pageBackground }
    static var title: Color { .white }
    static var subtleTitle: Color { Color("gray-7") }
    static var attention: Color { Color("cyan-6") }

    static var opaquePanelBackground: Color { Color("geekblue-4").opacity(0.03) }
    static var opaquePanelSeparator: Color { Color("geekblue-4").opacity(0.1) }

    static var headerBackground: Color { .black.opacity(0.1) }
    static var controlBackground: Color { .black.opacity(0.5) }

    // MARK: Avatar
    static var avatarText: Color { .white }
    static var avatarBackground: Color { Color("geekblue-4").opacity(0.25) }

    // MARK: Selection List
    static var radioButtonBackground: Color { .white.opacity(0.02) }
    static var rowBackground: Color { .white.opacity(0.05) }
    static var selected: Color { Color("geekblue-6") }

    // MARK: Stats List
    static var statTitle: Color { Color("geekblue-3") }
    static var statValue: Color { .white }
    static var statDeltaPositive: Color { Color("cyan-6") }
    static var statDeltaNegative: Color { Color("red-4") }
    static var statDeltaZero: Color { Color("geekblue-4").opacity(0.5) }
    static var statDeltaNeutral: Color { Color("geekblue-3") }
    static var statDeltaNeutralBackground: Color { Color("geekblue-3").opacity(0.1) }

    static var bellCurveSilhouette: Color { Color("geekblue-4").opacity(0.1) }
    static var bellCurveGradientStart: Color { Color("geekblue-5") }
    static var bellCurveGradientEnd: Color { Color("geekblue-6") }

    static var riskLow: Color { Color("cyan-7") }
    static var riskAverage: Color { Color("cyan-4") }
    static var riskHigh: Color { Color("red-4") }

    // MARK: Group
    static var groupTitle: Color { Color("geekblue-3") }
    static var groupRowBackground: Color { Color("geekblue-4").opacity(0.03) }
    static var groupAlternateRowBackground: Color { .clear }

    // MARK: Plots & Graphs
    static var graphPointer: Color { .white }
    static var plotPrimary: Color { Color("geekblue-3") }
    static var plotShadow: Color { Color("geekblue-5") }
    static var plotSecondary: Color { Color("geekblue-6") }

    static var peakHighlight: Color { Color("magenta-6") }

    // MARK: Bars
    static var jumpBar1: Color { Color("geekblue-6") }
    static var jumpBar2: Color { Color("geekblue-5") }
    static var jumpBar3: Color { Color("geekblue-4") }

    static var balanceBar1: Color { Color("cyan-7") }
    static var balanceBar2: Color { Color("cyan-4") }

    static var plankBar1: Color { Color("purple-6") }
    static var plankBar2: Color { Color("purple-4") }
    
    // MARK: Line Chart
    static var firstLine: Color { Color("geekblue-6") }
    static var secondLine: Color { Color("cyan-6") }
    static var thirdLine: Color { Color("orange-6") }
    static var axisValueLabel: Color { Color("geekblue-3") }
    static var axisGridLine: Color { Color("gridLine") }

    // MARK: Bar Chart
    static var chartGridEmphasized: Color { Color("geekblue-4").opacity(0.5) }
    static var chartGridRegular: Color { Color("geekblue-4").opacity(0.25) }
    static var chartStatScore: Color { Color("gray-1") }
    static var chartText: Color { Color("geekblue-3") }

    // MARK: Symmetry Chart
    static var symmetryTitle: Color { Color("geekblue-3") }
    static var symmetryValue: Color { .white }
    static var symmetryDeltaZeroForeground: Color { .statDeltaZero }
    static var symmetryDeltaPositiveForeground: Color { .statDeltaPositive }
    static var symmetryDeltaNegativeForeground: Color { .statDeltaNegative }
    static var symmetryDeltaNeutralForeground: Color { Color("geekblue-3") }
    static var symmetryDeltaZeroBackground: Color { .statDeltaZero.opacity(0.2) }
    static var symmetryDeltaPositiveBackground: Color { .statDeltaPositive.opacity(0.1) }
    static var symmetryDeltaNegativeBackground: Color { .statDeltaNegative.opacity(0.1) }
    static var symmetryDeltaNeutralBackground: Color { Color("geekblue-3").opacity(0.1) }
    static var symmetryMarker: Color { .white }
    static var symmetryGradientRed: Color { Color("gradient-red").opacity(0.5) }
    static var symmetryGradientYellow: Color { Color("gradient-yellow").opacity(0.5) }
    static var symmetryGradientGreen: Color { Color("gradient-green").opacity(0.6) }
    static var symmetryRangeZero: Color { Color("dark-indigo") }
    static var symmetryScale: Color { Color("geekblue-4").opacity(0.5) }

    // MARK: Warnings & Errors
    static var warning: Color { Color("orange-6") }
    static var criticalError: Color { Color("red-6") }
    static var errorContext: Color { Color("gray-8") }
    static var validationError: Color { Color("red-4") }

    // MARK: Selection Header
    static var uploading: Color { Color("cyan-6") }
    static var disconnectedForcePlateBackground: Color { Color("rosewood").opacity(0.25) }
    static var disconnectedForcePlateText: Color { Color("volcano-4") }

    // MARK: Results Header
    static var inviteStatus: Color { Color("geekblue-3") }

    // MARK: Buttons
    static var iconButtonTitle: Color { Color("geekblue-3") }
    static var iconButtonBackground: Color { Color("geekblue-4").opacity(0.1) }
    static var iconButtonHoverBackground: Color { Color("geekblue-4").opacity(0.15) }
    static var iconButtonSelectedBackground: Color { Color("geekblue-4").opacity(0.2) }

    static var defaultButtonBackground: Color { Color("geekblue-6").opacity(0.8) }
    static var defaultButtonHoverBackground: Color { Color("geekblue-6").opacity(0.9) }
    static var defaultButtonSelectedBackground: Color { Color("geekblue-6") }

    static var secondaryButtonBackground: Color { Color("gray-7.5").opacity(0.75) }
    static var secondaryButtonTitle: Color { Color("gray-1") }
    static var secondaryButtonOnPressed: Color { Color("gray-8").opacity(0.25) }
    static var secondaryButtonHoverBackground: Color { Color("gray-7").opacity(0.25) }
    static var secondaryButtonBorder: Color { .white.opacity(0.12) }

    static var segmentButtonSelectedBackground: Color { Color("geekblue-4").opacity(0.25) }

    static var tooltipButtonIcon: Color { Color("geekblue-3").opacity(0.5) }

    #if os(iOS)
    static var destructiveButtonTitle: Color { Color("red-8") }
    #endif

    // MARK: Progress Bar
    static var progressBarBackground: Color { .white.opacity(0.2) }
    static var progressBarForeground: Color { Color("green-russian") }

    // MARK: Flag Scan
    static var bannerBackground: Color { .white.opacity(0.1) }
    static var bannerBorder: Color { Color("geekblue-4").opacity(0.1) }
    static var bannerText: Color { Color("gold-6") }
    static var sheetResponseBoxBorder: Color { Color("gray-9") }
    static var sheetResponseBackground: Color { Color("gray-11") }

    // MARK: Sheets
    #if os(iOS)
    static var sheetListRowBackground: Color { .white.opacity(0.05) }
    #endif

    // MARK: Add User iOS
    #if os(iOS)
    static var headerTitle: Color { Color("geekblue-5") }
    static var formBackground: Color { Color("black-russian") }
    static var formBackgroundSecondary: Color { Color("bastille") }
    static var formBackgroundTertiary: Color { Color("dolphin").opacity(0.24) }
    static var formLabelSecondary: Color { Color("lavender").opacity(0.6) }
    #endif
}

