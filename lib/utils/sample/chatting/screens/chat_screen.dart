import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:mobileapp/utils/sample/chatting/data/color_data.dart';
import '../models/user_model.dart';
import '../models/message_model.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  const ChatScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      margin: isMe
          ? const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 80.0,
            )
          : const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              //  right: 80.0,
            ),
      width: MediaQuery.of(context).size.width * 0.75,
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
      decoration: BoxDecoration(
        color: isMe ? accentColor : const Color(0xFFFFEFEE),
        borderRadius: isMe
            ? const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              )
            : const BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.time,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.blueGrey,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            message.text,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: [
        msg,
        IconButton(
          onPressed: () {},
          iconSize: 30.0,
          color: message.isLiked ? primaryColor : Colors.blueGrey,
          icon: message.isLiked
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border),
        ),
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.photo),
            iconSize: 25.0,
            color: primaryColor,
          ),
          const Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0, color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0, color: Colors.transparent),
                ),
                hintText: 'Send a Message...'
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            color: primaryColor,
            iconSize: 25.0,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: primaryColor,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          elevation: 0.0,
          title: Text(
            widget.user.name,
            style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz),
              iconSize: 30.0,
            )
          ],
        ),
        body: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      )),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0),
                    ),
                    child: ListView.builder(
                      reverse: true,
                      padding: const EdgeInsets.only(top: 15.0),
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final Message message = messages[index];
                        final bool isMe = message.sender.id == currentUser.id;
                        return _buildMessage(message, isMe);
                      },
                    ),
                  ),
                ),
              ),
              _buildMessageComposer(),
            ],
          ),
        ));
  }
}
