// Dosa widget
import 'package:flutter/material.dart';
import '../../resources/r.dart';

class DosaWidget extends StatelessWidget {
  const DosaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 28,
          width: 65,
          decoration: BoxDecoration(
              color: R.color.homeBgColor,
              borderRadius: BorderRadius.circular(4)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Dosa",
                style: R.styles.fontPoppins
                    .merge(R.styles.fz12Fw400)
                    .copyWith(color: R.color.black),
              ),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 18,
              )
            ],
          ),
        ),
        Container(
          height: 28,
          width: 65,
          decoration: BoxDecoration(
              color: R.color.homeBgColor,
              borderRadius: BorderRadius.circular(4)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Dosa",
                style: R.styles.fontPoppins
                    .merge(R.styles.fz12Fw400)
                    .copyWith(color: R.color.black),
              ),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 18,
              )
            ],
          ),
        ),
        Container(
          height: 28,
          width: 65,
          decoration: BoxDecoration(
              color: R.color.homeBgColor,
              borderRadius: BorderRadius.circular(4)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Dosa",
                style: R.styles.fontPoppins
                    .merge(R.styles.fz12Fw400)
                    .copyWith(color: R.color.black),
              ),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 18,
              )
            ],
          ),
        )
      ],
    );
  }
}
