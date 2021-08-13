import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _itemCount = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
        border: Border.all(
          color: Colors.black.withOpacity(.5),
        ),
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.remove),
            onPressed:
                _itemCount == 1 ? null : () => setState(() => _itemCount--),
          ),
          Text(
            _itemCount.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => setState(() => _itemCount++),
          ),
        ],
      ),
    );
  }
}
