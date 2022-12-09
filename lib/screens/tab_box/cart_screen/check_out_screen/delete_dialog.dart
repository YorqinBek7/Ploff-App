import 'package:flutter/material.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/style/text_style.dart';

Future<dynamic> deleteAllDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Очистить корзину?",
            style: PloffTextStyle.w600.copyWith(fontSize: 20),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Вы уверены, что хотите очистить корзину?",
            style: PloffTextStyle.w400.copyWith(
              fontSize: 15,
              color: PloffColors.C_858585,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => {
                    Navigator.pop(context),
                  },
                  child: DialogButtons(
                    color: PloffColors.C_F0F0F0,
                    text: 'Нет',
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => {
                    Navigator.pop(context),
                  },
                  child: DialogButtons(
                    color: PloffColors.C_FFCC00,
                    text: 'Да',
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}

class DialogButtons extends StatelessWidget {
  final String text;
  final Color color;
  const DialogButtons({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: PloffTextStyle.w600.copyWith(fontSize: 15),
        ),
      ),
    );
  }
}
