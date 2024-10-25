import 'package:eventpass_app/domain/entities/chart_data.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/widgets/text/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

Widget pieChart(
    BuildContext context, WidgetRef ref, String heading, List<ChartData> data) {
  double total = data.fold(0, (sum, item) => sum + item.y);

  return Container(
    height: 300,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title(context, ref, heading),
        verticalSpace(16.0),
        Expanded(
            child: SfCircularChart(
          legend: const Legend(
            isVisible: true,
            position: LegendPosition.right,
          ),
          series: <CircularSeries>[
            DoughnutSeries<ChartData, String>(
              dataSource: data,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              pointColorMapper: (ChartData data, _) => data.color,
              dataLabelMapper: (ChartData data, _) =>
                  '${((data.y / total) * 100).toStringAsFixed(1)}%',
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                labelPosition: ChartDataLabelPosition.inside,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            )
          ],
        )),
      ],
    ),
  );
}
