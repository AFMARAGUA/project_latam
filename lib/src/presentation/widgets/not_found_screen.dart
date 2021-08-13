import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotFoundScreen extends StatefulWidget {
  @override
  _NotFoundPageState createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  final RelativeRectTween _relativeRectTween = RelativeRectTween(
    begin: RelativeRect.fromLTRB(24, 24, 24, 200),
    end: RelativeRect.fromLTRB(24, 24, 24, 250),
  );

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        PositionedTransition(
          rect: _relativeRectTween.animate(_controller!),
          child: Container(
            child: SvgPicture.asset('assets/images/undraw_page_not_found.svg'),
          ),
        ),
        Positioned(
          top: height * 0.20,
          bottom: width / 50,
          left: width * 0.20,
          right: width * 0.20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'ESTA SECCIÓN ESTÁ\n EN CONSTRUCCIÓN,\n¡ESPÉRALA PRONTO!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: width / 18,
                    letterSpacing: 1,
                    height: 1.5,
                    color: Color(0xff2f3640),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
      ],
    );
  }
}
