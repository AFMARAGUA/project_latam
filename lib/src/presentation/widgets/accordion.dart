import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Accordion extends StatefulWidget {
  final String title, content;
  bool showContent;

  Accordion({
    required this.title,
    required this.content,
    this.showContent = false,
  });
  @override
  _AccordionState createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  @override
  Widget build(BuildContext context) {
    final bool _showContent = widget.showContent;
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(children: [
        GestureDetector(
          onTap: () => setState(() => widget.showContent = !widget.showContent),
          child: ListTile(
            title: Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Icon(
              _showContent ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              color: Colors.black,
            ),
          ),
        ),
        _showContent
            ? Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Text(widget.content),
              )
            : Container()
      ]),
    );
  }
}
