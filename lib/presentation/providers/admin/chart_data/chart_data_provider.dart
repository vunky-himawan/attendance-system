import 'dart:ffi';

import 'package:eventpass_app/domain/entities/chart_data.dart';
import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final revenueData = Provider((ref) => [
      ChartData('Jan', 100),
      ChartData('Feb', 1100),
      ChartData('Mar', 300),
      ChartData('Apr', 1500),
      ChartData('May', 500),
      ChartData('Jun', 2000),
      ChartData('Jul', 700),
      ChartData('Aug', 800),
      ChartData('Sep', 900),
      ChartData('Oct', 1000),
      ChartData('Nov', 1100),
      ChartData('Dec', 1200),
    ]);

final ticketSalesData = Provider((ref) => [
      ChartData('Jan', 100),
      ChartData('Feb', 1100),
      ChartData('Mar', 300),
      ChartData('Apr', 1500),
      ChartData('May', 500),
      ChartData('Jun', 2000),
      ChartData('Jul', 700),
      ChartData('Aug', 800),
      ChartData('Sep', 900),
      ChartData('Oct', 1000),
      ChartData('Nov', 1100),
      ChartData('Dec', 1200),
    ]);

final categorySalesData = Provider((ref) => [
      ChartData('Seminar', 100),
      ChartData('Conference', 1100),
      ChartData('Workshop', 300),
    ]);

final ageGroupData = Provider((ref) => [
      ChartData('18-24', 100),
      ChartData('25-34', 1100),
      ChartData('35-44', 300),
      ChartData('45-54', 1500),
      ChartData('55-64', 500),
      ChartData('65-74', 2000),
      ChartData('75-84', 700),
      ChartData('85+', 800),
    ]);

final genderData = Provider((ref) => [
      ChartData('Laki-laki', 100, softPink),
      ChartData('Perempuan', 1100, softPurple),
    ]);
