import 'package:app_demo/page/chart/radial_bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({Key? key, this.isNotActive = false}) : super(key: key);
  final bool isNotActive;
  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  Widget build(BuildContext context) {
    Widget itemChartLine({String label = '', double valueDisplay = 0}) {
      return Row(
        children: [
          Expanded(
              flex: 3,
              child: Text(
                label,
                style: TextStyle(color: Colors.white),
              )),
          Container(
            child: SfLinearGauge(
              showLabels: false,
              ranges: [],
              barPointers: [LinearBarPointer(value: valueDisplay)],
            ),
          )
        ],
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Text(
              'Overview',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
            Center(
              child: Container(
                  color: Colors.amber,
                  width: 400.0,
                  height: 400.0,
                  child: RadialChart()),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Fanpage marketing processing',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                itemChartLine(
                    label: 'Fanpage traveling:',
                    valueDisplay: widget.isNotActive ? 0 : 10.0),
                const SizedBox(
                  height: 20.0,
                ),
                itemChartLine(
                    label: 'Fanpage gaming:',
                    valueDisplay: widget.isNotActive ? 0 : 40.0),
                const SizedBox(
                  height: 20.0,
                ),
                itemChartLine(
                    label: 'Fanpage technology:',
                    valueDisplay: widget.isNotActive ? 0 : 30.0),
                const SizedBox(
                  height: 20.0,
                ),
                itemChartLine(
                    label: 'Fanpage fun:',
                    valueDisplay: widget.isNotActive ? 0 : 20.0)
              ],
            )
          ],
        ),
      ),
    );
  }
}
