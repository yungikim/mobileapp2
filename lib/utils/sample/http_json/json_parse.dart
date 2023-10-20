import 'package:flutter/material.dart';
import 'user.dart';
import 'service.dart';

class Jsonparse extends StatefulWidget {
  const Jsonparse({Key? key}) : super(key: key);

  @override
  State<Jsonparse> createState() => _JsonparseState();
}

class _JsonparseState extends State<Jsonparse> {
  List<User> _user = <User>[];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    Services.getInfo2().then((value) {
      setState(() {
        _user = value;
        loading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(loading ? "User" : "Loading..."),
      ),
      body: ListView.builder(
        itemCount: _user.length,
        itemBuilder: (context, index) {
          User user = _user[index];
          return ListTile(
            leading: Icon(
              Icons.account_circle_rounded,
              color: Colors.blue,
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(user.name),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(user.phone),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Close"),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              icon: Icon(
                Icons.phone_android_outlined,
                color: Colors.red,
              ),
            ),
            title: Text(user.name),
            subtitle: Text(user.email),
          );
        },
      ),
    );
  }
}
