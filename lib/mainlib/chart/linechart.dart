import 'package:charts_flutter/flutter.dart' as charts;

import 'package:flutter/cupertino.dart';

class Linesales{
  DateTime time;
  int sale;
  Linesales(this.time,this.sale);
}
Widget getline(List<Linesales>  dataline){
  var seriesLine = [
    charts.Series<Linesales,DateTime>(
      data: dataline,
      domainFn: (Linesales lines,_)=>lines.time,
      measureFn: (Linesales lines,_)=>lines.sale,
      id: "Lines",
    )
  ];
  Widget line = charts.TimeSeriesChart(seriesLine);
  return line;

}