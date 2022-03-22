import 'package:app_demo/page/chart/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key, this.isNotActive = false}) : super(key: key);
  final bool isNotActive;
  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
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
            const Text(
              'Comment level',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: PieChart(),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Fanpage Comment processing',
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
            )
          ],
        ),
      ),
    );
  }
}
