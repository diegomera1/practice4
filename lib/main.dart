import 'package:flutter/material.dart';
import './model/backend.dart';
import './widgets/email_widget.dart';
import './model/backend.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: Colors.pink,
      ),
      home: const MyHomePage(title: 'Mock Mail'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final emails = Backend().getEmails();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: emails.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              onDismissed: (_) {
                Backend().deleteEmail(emails[index].id);
                setState(() {});
              },
              child: EmailWidget(email: emails[index]),
              background: Container(
                padding: const EdgeInsets.only(right: 30.0),
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                color: Colors.red,
                alignment: Alignment.centerRight,
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
