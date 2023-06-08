import Charts

extension LineData {
    public var plottableName: PlottableValue<String> {
        .value("Name", name)
    }
}
