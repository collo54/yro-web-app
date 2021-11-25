import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yro/models/messager_model.dart';
import 'package:yro/models/user_model.dart';
import 'package:yro/services/firestore_service.dart';
import 'package:yro/widgets/chat_bubble.dart';

class NewChatLayout extends StatelessWidget {
  List<Widget> pageChildren(double width, BuildContext context) {
    return <Widget>[
      Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
          width: width,
          child: _buildMessages(context),
        ),
      ),
    ];
  }

  /* Widget _buildMessages(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Container(child: _buildMessage(context))),
      ],
    );
  }*/

  Widget _buildMessages(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => _buildMessage(context),
        separatorBuilder: (_, index) => SizedBox(
              height: 15,
            ),
        itemCount: 1);
  }

  Widget _buildMessage(BuildContext context) {
    final firestoreservice =
        Provider.of<FirestoreService>(context, listen: false);
    final user = Provider.of<Userre>(context);
    return StreamBuilder<List<Messager>>(
      stream: firestoreservice.messagerStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final messager = snapshot.data!;
          if (messager.isNotEmpty) {
            final children = messager
                .map((messager) => //Row(
                        //children: [
                        ChatBubble(
                          text: messager.message,
                          name: messager.name,
                          time: messager.time!..substring(0, 16),
                          isCurrentUser:
                              user.uid == messager.userId ? true : false,
                        )
                    // ],
                    // ),
                    )
                .toList();
            return Column(
              children: children,
            );
          }
          return Row(
            children: [
              SizedBox(width: 10),
              Flexible(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Text('')
                      ],
                    ),
                    Text(
                      '',
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ],
          );
        }
        if (snapshot.hasError) {
          return Center(child: Text('error occurred'));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            children: pageChildren(constraints.biggest.width, context),
          );
        } else {
          return Flex(
            direction: Axis.vertical,
            children: pageChildren(constraints.biggest.width, context),
          );
        }
      },
    );
  }
}
