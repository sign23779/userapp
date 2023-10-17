import 'package:flutter/material.dart';
import 'package:noduster/const/color.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget(
      {Key? key, this.onPressAdd, this.onPressSub, this.quantity, this.color})
      : super(key: key);

  final Function()? onPressAdd;
  final Function()? onPressSub;
  final String? quantity;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: color ?? kblue[200], borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: onPressSub,
              icon: const Icon(
                Icons.remove,
                color: kwhitecolor,
              )),
          Text(
            "$quantity",
            style: const TextStyle(color: kwhitecolor),
          ),
          IconButton(
              onPressed: onPressAdd,
              icon: const Icon(
                Icons.add,
                color: kwhitecolor,
              )),
        ],
      ),
    );
  }
}
