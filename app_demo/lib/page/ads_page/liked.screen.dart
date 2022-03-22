import 'package:app_demo/page/chart/dounot_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({Key? key, this.isNotActive = false}) : super(key: key);
  final bool isNotActive;
  @override
  _LikeScreenState createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  @override
  Widget build(BuildContext context) {
    Widget itemChartLine({String label = '', double valueDisplay = 0}) {
      return Row(
        children: [
          Expanded(
              flex: 2,
              child: Text(
                label,
                style: TextStyle(color: Colors.white),
              )),
          Expanded(
            flex: 5,
            child: Container(
              child: SfLinearGauge(
                showLabels: false,
                ranges: [
                  // LinearGaugeRange(
                  //   startValue: 0,
                  //   endValue: 50,
                  // ),
                ],
                // markerPointers: [
                //   LinearShapePointer(
                //     value: 50,
                //   ),
                // ],
                barPointers: [LinearBarPointer(value: valueDisplay)],
              ),
            ),
          ),
        ],
      );
    }

    return Container(
      padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Like level',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: DonoutChart(),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Social liked processing',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      itemChartLine(
                          label: 'Facebook :',
                          valueDisplay: widget.isNotActive ? 0 : 60.0),
                      const SizedBox(
                        height: 20.0,
                      ),
                      itemChartLine(
                          label: 'Google :',
                          valueDisplay: widget.isNotActive ? 0 : 40.0),
                      const SizedBox(
                        height: 20.0,
                      ),
                      itemChartLine(
                          label: 'TikTok :',
                          valueDisplay: widget.isNotActive ? 0 : 70.0),
                      const SizedBox(
                        height: 20.0,
                      ),
                      itemChartLine(
                          label: 'Twitter :',
                          valueDisplay: widget.isNotActive ? 0 : 10.0)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
