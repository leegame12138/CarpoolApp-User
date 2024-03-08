import 'package:flutter/cupertino.dart';

class RoundContainer extends StatelessWidget {

  const RoundContainer(this.Widget, {super.key});

  @override
  final Widget;

  @override
  build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0x88FFFFFF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
        ),
      ),
      child: Widget,
    );
  }
}
