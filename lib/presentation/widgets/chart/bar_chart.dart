import 'package:eventpass_app/domain/entities/chart_data.dart';
import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/widgets/text/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

Widget barChart(BuildContext context, WidgetRef ref, String heading,
        List<ChartData> data) =>
    Container(
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title(context, ref, heading),
          verticalSpace(16.0),
          Expanded(
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                labelRotation: -90,
                labelIntersectAction: AxisLabelIntersectAction.none,
                interval: 1,
                axisLine: const AxisLine(
                  width: 0,
                ),
                labelStyle: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 12,
                ),
                majorGridLines: MajorGridLines(
                  width: 0.5,
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                ),
                majorTickLines: MajorTickLines(
                  width: 0,
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                ),
              ),
              primaryYAxis: NumericAxis(
                majorTickLines: MajorTickLines(
                  width: 0,
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                ),
                labelStyle: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 12,
                ),
                axisLine: const AxisLine(
                  width: 0,
                ),
                majorGridLines: MajorGridLines(
                  width: 0.5,
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                ),
              ),
              borderColor: Colors.transparent,
              plotAreaBorderColor: Colors.transparent,
              series: <CartesianSeries>[
                ColumnSeries<ChartData, String>(
                  dataSource: data,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  color: softPurple,
                  trendlines: [
                    Trendline(
                        type: TrendlineType.movingAverage,
                        color: Theme.of(context).colorScheme.secondary,
                        opacity: 0.1),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
