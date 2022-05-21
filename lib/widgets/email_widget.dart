import 'package:flutter/material.dart';
import 'package:practice4/model/backend.dart';
import 'package:practice4/widgets/email_box_widget.dart';
import '../model/email.dart';
import 'circle_widget.dart';
import '../screens/email_screen.dart';

class EmailWidget extends StatefulWidget {
  final Email email;
  const EmailWidget({Key? key, required this.email}) : super(key: key);

  @override
  State<EmailWidget> createState() => _EmailWidgetState();
}

class _EmailWidgetState extends State<EmailWidget> {
  @override
  Widget build(BuildContext context) {
    final email = widget.email;
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EmailScreen(email: email),
            ),
          );
          Backend().markEmailAsRead(email.id);
          setState(() {});
        },
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: email.read
                  ? Container()
                  : CircleWidget(
                      radius: 10.0,
                      color: Theme.of(context).primaryColor,
                    ),
            ),
            Expanded(
              flex: 9,
              child: EmailBoxWidget(
                showBorder: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      email.dateTime.toString().substring(0, 10),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                    Text(
                      email.from,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      email.subject,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
