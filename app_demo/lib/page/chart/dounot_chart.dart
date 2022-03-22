import 'package:app_demo/models/chart_data.model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DonoutChart extends StatefulWidget {
  const DonoutChart({Key? key}) : super(key: key);

  @override
  _DonoutChartState createState() => _DonoutChartState();
}

class _DonoutChartState extends State<DonoutChart> {
  final List<ChartData> chartData = [
    ChartData('Like', 25, Colors.blue),
    ChartData('unlike', 38, Colors.red.shade300),
  ];

  @override
  Widget build(BuildContext context) {
    Widget itemNote(String title, Color colors) {
      return Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                color: colors, borderRadius: BorderRadius.circular(40)),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      );
    }

    return SizedBox(
      width: 500.0,
      child: Column(
        children: [
          SfCircularChart(series: <CircularSeries>[
            // Renders doughnut chart
            DoughnutSeries<ChartData, String>(
                dataSource: chartData,
                pointColorMapper: (ChartData data, _) => data.color,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              itemNote("like", Colors.blue),
              itemNote("unlike", Colors.red.shade300),
            ],
          )
        ],
      ),
    );
  }
}
