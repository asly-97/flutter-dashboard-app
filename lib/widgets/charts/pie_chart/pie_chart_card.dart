import 'package:dashboard/widgets/charts/chart_card_header.dart';
import 'package:dashboard/widgets/charts/pie_chart/pie_chart_sample.dart';
import 'package:flutter/material.dart';

class PieChartCard extends StatelessWidget {
  const PieChartCard({Key? key}) : super(key: key);

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
              title: 'Progress',
              subTitle: 'Today',
              onFilter: () {},
            ),
            PieChartSample(),
          ],
        ),
      ),
    );
  }
}
