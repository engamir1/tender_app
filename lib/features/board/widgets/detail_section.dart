import 'package:flutter/material.dart';

class DataRowWidget extends StatefulWidget {
  const DataRowWidget({
    super.key,
    this.color = const Color(0xFFF3F4F6),
    this.dataRecieved,
    required this.field_name,
    this.icon = Icons.check,
  });
  final Color color;
  final String? dataRecieved;
  final String field_name;
  final IconData? icon;

  @override
  State<DataRowWidget> createState() => _DataRowWidgetState();
}

class _DataRowWidgetState extends State<DataRowWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            // color: Color(0xffff3f4f6),
            color: widget.color,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    "${widget.dataRecieved} :",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        // fontWeight: FontWeight.w600,
                        fontFamily: "Cairo"),
                    // overflow: TextOverflow.clip,
                    maxLines: 3,
                    softWrap: true,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  // the name of field
                  ' ${widget.field_name}',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xff006D94),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Cairo"),
                ),
                const SizedBox(width: 10),
                Icon(
                  widget.icon,
                  color: const Color(0xff006D94),
                  size: 30,
                ),
              ],
            ),
          ]),
        ),
      ],
    );
  }
}
