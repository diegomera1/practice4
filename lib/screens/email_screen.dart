import 'package:flutter/material.dart';
import '../model/email.dart';
import '../widgets/email_box_widget.dart';

class EmailScreen extends StatefulWidget {
  final Email email;
  const EmailScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  @override
  Widget build(BuildContext context) {
    final email = widget.email;
    return Scaffold(
      appBar: AppBar(
        title: Text(email.subject),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            EmailBoxWidget(
              showBorder: true,
              child: Text('From ' + email.from,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            EmailBoxWidget(
              showBorder: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(email.subject,
                      style: const TextStyle(
                        fontSize: 16,
                      )),
                  Text(
                    email.dateTime.toString().substring(0, 10),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
            EmailBoxWidget(
              child: Text(
                email.body,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
