import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'LaunchPad',
            style: GoogleFonts.orbitron(color: Colors.white),
          ),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
            crossAxisCount: 4,
          ),
          itemCount: 28,
          itemBuilder: (context, index) {
            final colors = [
              Color(0xffADCBFC),
              Color(0xffFF2525),
              Color(0xffADCBFC),
              Color(0xffE247FC),
            ];
            final outlines = [
              Color(0xff067CCB),
              Color(0xffC40050),
              Color(0xff067CCB),
              Color(0xffA23AB7),
            ];

            final notes = [
              '1.mp3',
              '2.mp3',
              '3.mp3',
              '4.mp3',
              '5.mp3',
              '6.mp3',
              '7.mp3',
              '8.mp3',
              '9.mp3',
              '10.mp3',
              '11.mp3',
              '12.mp3',
              '13.mp3',
              '14.mp3',
              '15.mp3',
              '16.mp3',
              '17.mp3',
              '18.mp3',
              '19.mp3',
              '20.wav',
              '21.mp3',
              '22.wav',
              '23.wav',
              '24.wav',
              '25.wav',
              '26.wav',
              '27.wav',
              '28.wav',
            ];
            return Pad(colors[index % 4], outlines[index % 4], notes[index]);
          },
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}

class Pad extends StatefulWidget {
  final Color colorCenter;
  final Color colorOutline;
  final String note;

  const Pad(this.colorCenter, this.colorOutline, this.note, {super.key});

  @override
  State<Pad> createState() => _PadState();
}

class _PadState extends State<Pad> {
  late Color _colorCenter;
  late Color _colorOutline;
  final player = AudioPlayer();

  @override
  void initState() {
    _colorOutline = widget.colorOutline;
    _colorCenter = widget.colorCenter;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          _colorCenter = Colors.white;
          _colorOutline = Colors.white;
          player.play(AssetSource(widget.note));
        });
        await Future.delayed(Duration(milliseconds: 400));
        setState(() {
          _colorCenter = widget.colorCenter;
          _colorOutline = widget.colorOutline;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.pink,
              blurRadius: 0.5,
            ),
          ],
          gradient: RadialGradient(
            radius: 0.5,
            colors: [
              _colorCenter,
              _colorOutline,
            ],
          ),
        ),
      ),
    );
  }
}
