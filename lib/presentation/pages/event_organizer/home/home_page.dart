import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:eventpass_app/presentation/widgets/chart/bar_chart.dart';
import 'package:eventpass_app/presentation/widgets/chart/line_chart.dart';
import 'package:eventpass_app/presentation/widgets/chart/pie_chart.dart';
import 'package:eventpass_app/presentation/pages/event_organizer/home/methods/statistic_card.dart';
import 'package:eventpass_app/presentation/widgets/text/title.dart';
import 'package:eventpass_app/presentation/providers/admin/chart_data/chart_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spaceForTitle = verticalSpace(16.0);
    final spaceForCard = verticalSpace(30.0);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 80.0),
        child: SafeArea(
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(80),
                  title(context, ref, 'Dashboard'),
                  spaceForTitle,
                  statisticCard(context, ref),
                  spaceForCard,
                  lineChart(
                    context,
                    ref,
                    'Pendapatan',
                    ref.watch(revenueData),
                  ),
                  spaceForCard,
                  lineChart(
                    context,
                    ref,
                    'Penjualan Tiket',
                    ref.watch(ticketSalesData),
                  ),
                  spaceForCard,
                  barChart(
                    context,
                    ref,
                    'Kategori Acara Yang Ramai',
                    ref.watch(categorySalesData),
                  ),
                  spaceForCard,
                  barChart(
                    context,
                    ref,
                    'Rentang Umur Pengunjung',
                    ref.watch(ageGroupData),
                  ),
                  spaceForCard,
                  pieChart(
                    context,
                    ref,
                    'Presentase Pengunjung',
                    ref.watch(genderData),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
