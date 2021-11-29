import 'package:flutter/material.dart';

class HeaderDays extends StatelessWidget {
  const HeaderDays({
    Key key,
  }) : super(key: key);

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
                onPressed: () {
                  //buildBody(diaAtual)
                },
                child: Text('Today', style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () {
                  //buildBody(Amanha)
                },
                child: Text('Tomorrow', style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () {
                  //else
                },
                child: Text('Later', style: TextStyle(color: Colors.white)),
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
