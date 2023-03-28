import Foundation
import Charts

let dataSouce = [
    chartSpartaScore,
    chartJumpHeight,
    chartBlalance,
    chartJump,
    chartBalanceLR
]

let pointsSpartaScore: [PointData] = [
    .init(date: .date(from: "2021-10-21T12:00:00+00:00"), value: 65.12195122),
    .init(date: .date(from: "2021-10-31T19:34:44+00:00"), value: 63.53658537),
    .init(date: .date(from: "2021-11-01T03:49:54+00:00"), value: 65.12195122),
    .init(date: .date(from: "2022-01-22T04:05:03+00:00"), value: 63.41463415),
    .init(date: .date(from: "2022-01-24T17:58:44+00:00"), value: 65.85365854),
    .init(date: .date(from: "2022-01-25T22:51:47+00:00"), value: 64.26829268),
    .init(date: .date(from: "2022-01-29T05:15:47+00:00"), value: 65.12195122),
    .init(date: .date(from: "2022-01-31T06:46:44+00:00"), value: 67.19512195),
    .init(date: .date(from: "2022-02-05T06:26:32+00:00"), value: 63.65853659),
    .init(date: .date(from: "2022-02-25T17:28:25+00:00"), value: 67.43902439),
    .init(date: .date(from: "2022-03-04T14:31:35+00:00"), value: 63.65853659),
    .init(date: .date(from: "2022-03-20T14:16:25+00:00"), value: 67.31707317),
    .init(date: .date(from: "2022-04-02T15:52:25+00:00"), value: 63.04878049),
    .init(date: .date(from: "2022-04-22T10:24:00+00:00"), value: 57.07317073),
    .init(date: .date(from: "2022-04-28T06:41:41+00:00"), value: 61.70731707),
    .init(date: .date(from: "2022-05-29T13:41:03+00:00"), value: 52.19512195)
]

let lineSpartaScore: LineData = .init(points: pointsSpartaScore, name: "Sparta Score")

let chartSpartaScore: LineChartData = .init(lines: [lineSpartaScore], name: "Sparta Score", header: .spartaScore, averageForAge: 61)

let pointsJumpHeight: [PointData] = [
    .init(date: .date(from: "2021-10-21T12:00:00+00:00"), value: 12.56097561),
    .init(date: .date(from: "2021-10-31T19:34:44+00:00"), value: 11.76829268),
    .init(date: .date(from: "2021-11-01T03:49:54+00:00"), value: 12.56097561),
    .init(date: .date(from: "2022-01-22T04:05:03+00:00"), value: 11.70731707),
    .init(date: .date(from: "2022-01-24T17:58:44+00:00"), value: 12.92682927),
    .init(date: .date(from: "2022-01-25T22:51:47+00:00"), value: 12.13414634),
    .init(date: .date(from: "2022-01-29T05:15:47+00:00"), value: 12.56097561),
    .init(date: .date(from: "2022-01-31T06:46:44+00:00"), value: 13.59756098),
    .init(date: .date(from: "2022-02-05T06:26:32+00:00"), value: 11.82926829),
    .init(date: .date(from: "2022-02-25T17:28:25+00:00"), value: 13.7195122),
    .init(date: .date(from: "2022-03-04T14:31:35+00:00"), value: 11.82926829),
    .init(date: .date(from: "2022-03-20T14:16:25+00:00"), value: 13.65853659),
    .init(date: .date(from: "2022-04-02T15:52:25+00:00"), value: 11.52439024),
    .init(date: .date(from: "2022-04-22T10:24:00+00:00"), value: 8.536585366),
    .init(date: .date(from: "2022-04-28T06:41:41+00:00"), value: 10.85365854),
    .init(date: .date(from: "2022-05-29T13:41:03+00:00"), value: 6.097560976)
]

let lineJumpHeight: LineData = .init(points: pointsJumpHeight, name: "Jump Height")

let chartJumpHeight: LineChartData = .init(lines: [lineJumpHeight], name: "Jump Height", header: .jumpHeight, averageForAge: 13)

let pointsBlalance: [PointData] = [
    .init(date: .date(from: "2021-10-21T12:00:00+00:00"), value: 67.12195122),
    .init(date: .date(from: "2021-10-31T19:34:44+00:00"), value: 65.53658537),
    .init(date: .date(from: "2021-11-01T03:49:54+00:00"), value: 67.12195122),
    .init(date: .date(from: "2022-01-22T04:05:03+00:00"), value: 65.41463415),
    .init(date: .date(from: "2022-01-24T17:58:44+00:00"), value: 67.85365854),
    .init(date: .date(from: "2022-01-25T22:51:47+00:00"), value: 66.26829268),
    .init(date: .date(from: "2022-01-29T05:15:47+00:00"), value: 67.12195122),
    .init(date: .date(from: "2022-01-31T06:46:44+00:00"), value: 69.19512195),
    .init(date: .date(from: "2022-02-05T06:26:32+00:00"), value: 62.65853659),
    .init(date: .date(from: "2022-02-25T17:28:25+00:00"), value: 69.43902439),
    .init(date: .date(from: "2022-03-04T14:31:35+00:00"), value: 65.65853659),
    .init(date: .date(from: "2022-03-20T14:16:25+00:00"), value: 69.31707317),
    .init(date: .date(from: "2022-04-02T15:52:25+00:00"), value: 65.04878049),
    .init(date: .date(from: "2022-04-22T10:24:00+00:00"), value: 59.07317073),
    .init(date: .date(from: "2022-04-28T06:41:41+00:00"), value: 63.70731707),
    .init(date: .date(from: "2022-05-29T13:41:03+00:00"), value: 54.19512195)
]

let lineBlalance: LineData = .init(points: pointsBlalance, name: "Blalance")

let chartBlalance: LineChartData = .init(lines: [lineBlalance], name: "Blalance", header: .balance, averageForAge: 65)


let pointsLoad: [PointData] = [
    .init(date: .date(from: "2021-10-21T12:00:00+00:00"), value: 50.12195122),
    .init(date: .date(from: "2021-10-31T19:34:44+00:00"), value: 46.95121951),
    .init(date: .date(from: "2021-11-01T03:49:54+00:00"), value: 50.12195122),
    .init(date: .date(from: "2022-01-22T04:05:03+00:00"), value: 46.70731707),
    .init(date: .date(from: "2022-01-24T17:58:44+00:00"), value: 51.58536585),
    .init(date: .date(from: "2022-01-25T22:51:47+00:00"), value: 48.41463415),
    .init(date: .date(from: "2022-01-29T05:15:47+00:00"), value: 50.12195122),
    .init(date: .date(from: "2022-01-31T06:46:44+00:00"), value: 54.26829268),
    .init(date: .date(from: "2022-02-05T06:26:32+00:00"), value: 47.19512195),
    .init(date: .date(from: "2022-02-25T17:28:25+00:00"), value: 54.75609756),
    .init(date: .date(from: "2022-03-04T14:31:35+00:00"), value: 47.19512195),
    .init(date: .date(from: "2022-03-20T14:16:25+00:00"), value: 54.51219512),
    .init(date: .date(from: "2022-04-02T15:52:25+00:00"), value: 45.97560976),
    .init(date: .date(from: "2022-04-22T10:24:00+00:00"), value: 34.02439024),
    .init(date: .date(from: "2022-04-28T06:41:41+00:00"), value: 43.29268293),
    .init(date: .date(from: "2022-05-29T13:41:03+00:00"), value: 24.26829268)
]

let pointsExpload: [PointData] = [
    .init(date: .date(from: "2021-10-21T12:00:00+00:00"), value: 47.12195122),
    .init(date: .date(from: "2021-10-31T19:34:44+00:00"), value: 44.95121951),
    .init(date: .date(from: "2021-11-01T03:49:54+00:00"), value: 49.12195122),
    .init(date: .date(from: "2022-01-22T04:05:03+00:00"), value: 47.70731707),
    .init(date: .date(from: "2022-01-24T17:58:44+00:00"), value: 53.58536585),
    .init(date: .date(from: "2022-01-25T22:51:47+00:00"), value: 45.41463415),
    .init(date: .date(from: "2022-01-29T05:15:47+00:00"), value: 51.12195122),
    .init(date: .date(from: "2022-01-31T06:46:44+00:00"), value: 52.26829268),
    .init(date: .date(from: "2022-02-05T06:26:32+00:00"), value: 46.19512195),
    .init(date: .date(from: "2022-02-25T17:28:25+00:00"), value: 38.75609756),
    .init(date: .date(from: "2022-03-04T14:31:35+00:00"), value: 46.19512195),
    .init(date: .date(from: "2022-03-20T14:16:25+00:00"), value: 54.51219512),
    .init(date: .date(from: "2022-04-02T15:52:25+00:00"), value: 43.97560976),
    .init(date: .date(from: "2022-04-22T10:24:00+00:00"), value: 33.02439024),
    .init(date: .date(from: "2022-04-28T06:41:41+00:00"), value: 41.29268293),
    .init(date: .date(from: "2022-05-29T13:41:03+00:00"), value: 44.26829268)
]

let pointsDrive: [PointData] = [
    .init(date: .date(from: "2021-10-21T12:00:00+00:00"), value: 44.12195122),
    .init(date: .date(from: "2021-10-31T19:34:44+00:00"), value: 42.95121951),
    .init(date: .date(from: "2021-11-01T03:49:54+00:00"), value: 48.12195122),
    .init(date: .date(from: "2022-01-22T04:05:03+00:00"), value: 48.70731707),
    .init(date: .date(from: "2022-01-24T17:58:44+00:00"), value: 55.58536585),
    .init(date: .date(from: "2022-01-25T22:51:47+00:00"), value: 42.41463415),
    .init(date: .date(from: "2022-01-29T05:15:47+00:00"), value: 52.12195122),
    .init(date: .date(from: "2022-01-31T06:46:44+00:00"), value: 50.26829268),
    .init(date: .date(from: "2022-02-05T06:26:32+00:00"), value: 45.19512195),
    .init(date: .date(from: "2022-02-25T17:28:25+00:00"), value: 52.75609756),
    .init(date: .date(from: "2022-03-04T14:31:35+00:00"), value: 44.19512195),
    .init(date: .date(from: "2022-03-20T14:16:25+00:00"), value: 52.51219512),
    .init(date: .date(from: "2022-04-02T15:52:25+00:00"), value: 45.97560976),
    .init(date: .date(from: "2022-04-22T10:24:00+00:00"), value: 35.02439024),
    .init(date: .date(from: "2022-04-28T06:41:41+00:00"), value: 41.29268293),
    .init(date: .date(from: "2022-05-29T13:41:03+00:00"), value: 42.26829268)
]

let lineLoad: LineData = .init(points: pointsLoad, name: "Load")
let lineExpload: LineData = .init(points: pointsExpload, name: "Expload")
let lineDrive: LineData = .init(points: pointsDrive, name: "Drive")

let chartJump: LineChartData = .init(lines: [lineLoad, lineExpload, lineDrive], name: "Jump", header: .jump)

let pointsLeft: [PointData] = [
    .init(date: .date(from: "2021-10-21T12:00:00+00:00"), value: 70.12195122),
    .init(date: .date(from: "2021-10-31T19:34:44+00:00"), value: 66.95121951),
    .init(date: .date(from: "2021-11-01T03:49:54+00:00"), value: 70.12195122),
    .init(date: .date(from: "2022-01-22T04:05:03+00:00"), value: 66.70731707),
    .init(date: .date(from: "2022-01-24T17:58:44+00:00"), value: 71.58536585),
    .init(date: .date(from: "2022-01-25T22:51:47+00:00"), value: 68.41463415),
    .init(date: .date(from: "2022-01-29T05:15:47+00:00"), value: 70.12195122),
    .init(date: .date(from: "2022-01-31T06:46:44+00:00"), value: 74.26829268),
    .init(date: .date(from: "2022-02-05T06:26:32+00:00"), value: 67.19512195),
    .init(date: .date(from: "2022-02-25T17:28:25+00:00"), value: 74.75609756),
    .init(date: .date(from: "2022-03-04T14:31:35+00:00"), value: 67.19512195),
    .init(date: .date(from: "2022-03-20T14:16:25+00:00"), value: 74.51219512),
    .init(date: .date(from: "2022-04-02T15:52:25+00:00"), value: 65.97560976),
    .init(date: .date(from: "2022-04-22T10:24:00+00:00"), value: 54.02439024),
    .init(date: .date(from: "2022-04-28T06:41:41+00:00"), value: 63.29268293),
    .init(date: .date(from: "2022-05-29T13:41:03+00:00"), value: 44.26829268)
]

let pointsRight: [PointData] = [
    .init(date: .date(from: "2021-10-21T12:00:00+00:00"), value: 67.12195122),
    .init(date: .date(from: "2021-10-31T19:34:44+00:00"), value: 64.95121951),
    .init(date: .date(from: "2021-11-01T03:49:54+00:00"), value: 69.12195122),
    .init(date: .date(from: "2022-01-22T04:05:03+00:00"), value: 67.70731707),
    .init(date: .date(from: "2022-01-24T17:58:44+00:00"), value: 73.58536585),
    .init(date: .date(from: "2022-01-25T22:51:47+00:00"), value: 65.41463415),
    .init(date: .date(from: "2022-01-29T05:15:47+00:00"), value: 71.12195122),
    .init(date: .date(from: "2022-01-31T06:46:44+00:00"), value: 72.26829268),
    .init(date: .date(from: "2022-02-05T06:26:32+00:00"), value: 66.19512195),
    .init(date: .date(from: "2022-02-25T17:28:25+00:00"), value: 58.75609756),
    .init(date: .date(from: "2022-03-04T14:31:35+00:00"), value: 66.19512195),
    .init(date: .date(from: "2022-03-20T14:16:25+00:00"), value: 74.51219512),
    .init(date: .date(from: "2022-04-02T15:52:25+00:00"), value: 63.97560976),
    .init(date: .date(from: "2022-04-22T10:24:00+00:00"), value: 53.02439024),
    .init(date: .date(from: "2022-04-28T06:41:41+00:00"), value: 61.29268293),
    .init(date: .date(from: "2022-05-29T13:41:03+00:00"), value: 64.26829268)
]

let lineLeft: LineData = .init(points: pointsLeft, name: "Left")
let lineRight: LineData = .init(points: pointsRight, name: "Right")

let chartBalanceLR: LineChartData = .init(lines: [lineLeft, lineRight], name: "BalanceLR", header: .balanceLR)
