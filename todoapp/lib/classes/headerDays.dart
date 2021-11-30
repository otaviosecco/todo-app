import 'package:flutter/material.dart';

class HeaderDays extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              TextButton(
                child: Text('Today', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  print('APERTOU AA');
                  //buildBody(diaAtual)
                },
              ),
              TextButton(
                child: Text('Tomorrow', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  //buildBody(Amanha)
                },
              ),
              TextButton(
                child: Text('Later', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  //else
                },
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text('Calendar', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
