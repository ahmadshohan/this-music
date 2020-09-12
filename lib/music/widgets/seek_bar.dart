// import 'dart:math';
//
// import 'package:audio_service/audio_service.dart';
// import 'package:flutter/material.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:this_music/colors.dart';
//
// class SeekBar extends StatefulWidget {
//   final MediaItem mediaItem;
//   final double position;
//   final double duration;
//   final PlaybackState playbackState;
//   final int playerId;
//
//   SeekBar(
//       {@required this.duration,
//       @required this.position,
//       this.playbackState,
//       this.mediaItem,
//       this.playerId});
//
//   @override
//   _SeekBarState createState() => _SeekBarState();
// }
//
// class _SeekBarState extends State<SeekBar> {
//   final BehaviorSubject<double> _dragPositionSubject =
//       BehaviorSubject.seeded(null);
//   double _dragValue;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Slider(
//           min: 0.0,
//           max: widget.duration.inMilliseconds.toDouble(),
//           value: min(_dragValue ?? widget.position.inMilliseconds.toDouble(),
//               widget.duration.inMilliseconds.toDouble()),
//           onChanged: (value) {
//             setState(() {
//               _dragValue = value;
//             });
//             if (widget.onChanged != null) {
//               widget.onChanged(Duration(milliseconds: value.round()));
//             }
//           },
//           onChangeEnd: (value) {
//             if (widget.onChangeEnd != null) {
//               widget.onChangeEnd(Duration(milliseconds: value.round()));
//             }
//             _dragValue = null;
//           },
//         ),
//         Positioned(
//           right: 16.0,
//           bottom: 0.0,
//           child: Text(
//               RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
//                       .firstMatch("$_remaining")
//                       ?.group(1) ??
//                   '$_remaining',
//               style: Theme.of(context).textTheme.caption),
//         ),
//       ],
//     );
//   }
//
//   Duration get _remaining => widget.duration - widget.position;
// }
