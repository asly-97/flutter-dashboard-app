import 'package:dashboard/widgets/charts/chart_card_header.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'bar_chart.dart';

class BarChartCard extends StatelessWidget {
  const BarChartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ChartCardHeader(
              title: 'My observations',
              subTitle: 'Statistics',
              onFilter: () {},
            ),
            BarChartSample3(),
          ],
        ),
      ),
    );
  }
}
