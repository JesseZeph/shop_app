import 'package:flutter/material.dart';
import 'package:online_shop/views/shared/appstyle.dart';

class WaitListButton extends StatelessWidget {
  const WaitListButton({
    super.key, this.onTap, required this.label,
  });
  final void Function()? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(11),
        child: Container(
          decoration:  BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          height: 50,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Center(
            child: Text(
              label,
              style: appstyle(20, Colors.orange, FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
