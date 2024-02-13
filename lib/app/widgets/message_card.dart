import 'package:flutter/material.dart';
import 'package:quranapp/app/data/models/message.dart';
import '../constant/theme.dart';

class MessageCard extends StatelessWidget {
  final Message message;
  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return message.msgType == MessageType.bot
        ? Row(
            children: [
              const SizedBox(width: 6),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 18,
                child: Image.asset(
                  'assets/images/muslim.png',
                  width: 30,
                ),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: mq.width * 0.6),
                margin: EdgeInsets.only(
                  bottom: mq.height * 0.02,
                  left: mq.width * 0.02,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: mq.height * 0.01,
                  horizontal: mq.width * 0.02,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: appGreen),
                  borderRadius:
                      const BorderRadius.all(Radius.circular(15)).copyWith(
                    bottomLeft: const Radius.circular(0),
                  ),
                ),
                child: Text(message.msg),
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: mq.width * 0.6),
                margin: EdgeInsets.only(
                  bottom: mq.height * 0.02,
                  left: mq.width * 0.02,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: mq.height * 0.01,
                  horizontal: mq.width * 0.02,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: appGreen),
                  borderRadius:
                      const BorderRadius.all(Radius.circular(15)).copyWith(
                    bottomRight: const Radius.circular(0),
                  ),
                ),
                child: Text(message.msg),
              ),
              const CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 18,
                child: Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 6),
            ],
          );
  }
}
