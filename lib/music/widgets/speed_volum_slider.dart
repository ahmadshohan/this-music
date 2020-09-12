// import 'package:flutter/material.dart';
//
// class SpeedVolumeSlider extends StatefulWidget {
//   var currentValue;
//   final min;
//   final max;
//   final valueSuffix;
//   final divisions;
//   final onChanged;
//
//   SpeedVolumeSlider(
//       {this.currentValue,
//       this.valueSuffix,
//       this.divisions,
//       this.min,
//       this.max,
//       this.onChanged});
//
//   @override
//   _SpeedVolumeSliderState createState() => _SpeedVolumeSliderState();
// }
//
// class _SpeedVolumeSliderState extends State<SpeedVolumeSlider> {
//   double speed = 1.0;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 100.0,
//         child: Column(children: [
//           Text(
//               '${widget.currentValue?.toStringAsFixed(1)}${widget.valueSuffix}',
//               style: TextStyle(
//                   fontFamily: "permanentmarker",
//                   fontWeight: FontWeight.bold,
//                   fontSize: 24.0)),
//           Slider(
//             divisions: widget.divisions,
//             min: widget.min,
//             max: widget.max,
//             value: speed,
//             onChanged: (value) async {
//               await widget.onChanged(value);
//               setState(() {
//                 widget.currentValue = value;
//               });
//             },
//           )
//         ]));
//   }
// }
