import 'package:flutter/widgets.dart';

class XDashTopbar extends StatefulWidget {
  XDashTopbar({Key? key, this.leading, this.tailing, this.title})
      : super(key: key);
  final Widget? title;
  final Widget? leading;
  final List<Widget>? tailing;
  @override
  State<XDashTopbar> createState() => _XDashTopbarState();
}

class _XDashTopbarState extends State<XDashTopbar> {
  bool collapse = false;
  @override
  Widget build(BuildContext context) {
    final ratio = MediaQuery.of(context).size.aspectRatio;
    if (ratio <= 1.5) {
      collapse = true;
    } else {
      collapse = false;
    }
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: (widget.leading != null && collapse)
                ? MainAxisAlignment.spaceBetween
                : (collapse
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.spaceBetween),
            children: [
              if (widget.leading != null && collapse) widget.leading!,
              if (widget.title != null && !collapse) widget.title!,
              Container(
                width: collapse ? null : 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.tailing != null)
                      for (var item in widget.tailing!) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: item,
                        ),
                      ]
                  ],
                ),
              )
            ],
          ),
          if (widget.title != null && collapse) widget.title!,
        ],
      ),
    );
  }
}
