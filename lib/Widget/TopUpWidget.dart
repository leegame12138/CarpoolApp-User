import 'package:final_mae_3rd_wh/Data/PushData.dart';
import 'package:final_mae_3rd_wh/Design/RoundContainerWidget.dart';
import 'package:flutter/cupertino.dart';

class TopUpWidget extends StatefulWidget {
  final walletBalance;

  const TopUpWidget(this.walletBalance, {super.key});

  @override
  State<TopUpWidget> createState() => _TopUpWidgetState();
}

class _TopUpWidgetState extends State<TopUpWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      color: const Color(0x00FFFFFF),

      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.08,
          ),
          Text("Coins: ${widget.walletBalance}",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.4,
          ),
        ],
      ),
    );
  }
}
