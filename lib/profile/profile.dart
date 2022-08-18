import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quiz/services/auth.dart';
import 'package:quiz/services/models.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var report = Provider.of<Report>(context);
    var user = AuthService().user.currentUser;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'profile',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await AuthService().singOut();
              // ignore: use_build_context_synchronously
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: size.height * 0.3,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.deepPurple,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  user?.displayName ?? "Guest",
                                  style: const TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              Text(
                                user?.email ?? "",
                                style: const TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Container(
                              height: size.height * 0.27,
                              width: size.height * 0.27,
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple.shade400,
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Expanded(
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Icon(Icons.person),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: size.height * 0.3,
                    decoration: const BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Completed Quizzes:",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          report.total.toString(),
                          style: const TextStyle(
                            fontSize: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
