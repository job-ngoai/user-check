import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y, this.size, this.color);
  final String x;
  final double y;
  final String size;
  final Color color;
}

class PieChart extends StatefulWidget {
  const PieChart({Key? key}) : super(key: key);

  @override
  _PieChartState createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  final List<ChartData> chartData = [
    ChartData('bad', 10, '70%', Colors.red.shade300),
    ChartData('good', 11, '60%', Colors.green.shade300),
    ChartData('normal', 9, '52%', Colors.yellow),
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

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SfCircularChart(series: <CircularSeries>[
          PieSeries<ChartData, String>(
              dataSource: chartData,
              pointColorMapper: (ChartData data, _) => data.color,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              // Radius for each segment from data source
              pointRadiusMapper: (ChartData data, _) => data.size)
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            itemNote("bad", Colors.red.shade300),
            const SizedBox(
              width: 10.0,
            ),
            itemNote("good", Colors.green.shade300),
            const SizedBox(
              width: 10.0,
            ),
            itemNote("normal", Colors.yellow),
          ],
        )
      ],
    );
  }
}
