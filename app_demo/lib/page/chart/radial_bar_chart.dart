import 'package:app_demo/models/chart_data.model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialChart extends StatefulWidget {
  const RadialChart({Key? key}) : super(key: key);

  @override
  _RadialChartState createState() => _RadialChartState();
}

class _RadialChartState extends State<RadialChart> {
  final List<ChartData> chartData = <ChartData>[
    ChartData('Reach', 3500, Colors.amber[300]),
    ChartData('Comment', 1000, Colors.green),
    ChartData('Like', 1500, Colors.blue),
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

    return Container(
      color: Color.fromARGB(255, 0, 62, 112),
      child: Center(
          child: Column(
        children: [
          SizedBox(
              child:
                  SfCircularChart(series: <CircularSeries<ChartData, String>>[
            RadialBarSeries<ChartData, String>(
                maximumValue: 6000,
                radius: '100%',
                gap: '3%',
                dataSource: chartData,
                cornerStyle: CornerStyle.bothCurve,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                pointColorMapper: (ChartData data, _) => data.color)
          ])),
          const SizedBox(
            height: 50.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              itemNote("reach", Colors.amber.shade300),
              itemNote("Comment", Colors.green),
              itemNote("Like", Colors.blue),
            ],
          )
        ],
      )),
    );
  }
}
