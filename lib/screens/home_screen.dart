import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:response_flutter/google_signin.dart';
import 'package:response_flutter/list_tile_pages/new_voting.dart';
import 'package:response_flutter/list_tile_pages/results.dart';
import 'package:response_flutter/screens/welcome_page.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_screen";
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Response'),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                'Welcome to Response',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
              height: 150.0,
              decoration: BoxDecoration(
                color: const Color(0xff2a9d8f),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Number of Votes Polled',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '5',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.teal,
                child: MaterialButton(
                  minWidth: 200,
                  height: 44.0,
                  onPressed: () {
                    Navigator.pushNamed(context, NewVoting.id);
                  },
                  child: const Text(
                    'Enter a Voting',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.teal,
                child: MaterialButton(
                  minWidth: 200,
                  height: 44.0,
                  onPressed: () {},
                  child: const Text(
                    'View Responses',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.teal,
            ),
            accountName: const Text('Harry Potter'),
            accountEmail: const Text('harrypotter123@gmail.com'),
            currentAccountPicture: ClipOval(
              child: Image.asset('assets/img3.jpg'),
            ),
          ),
          ListTile(
            title: const Text('Your Profile'),
            leading: const Icon(Icons.person),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Create new Voting'),
            leading: const Icon(Icons.pan_tool),
            onTap: () {
              Navigator.pushNamed(context, NewVoting.id);
            },
          ),
          ListTile(
            title: const Text('Results'),
            leading: const Icon(Icons.reviews),
            onTap: () {
              Navigator.pushNamed(context, ResultPage.id);
            },
          ),
          ListTile(
            title: const Text('Past Feedbacks'),
            leading: const Icon(Icons.feedback),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Settings'),
            leading: const Icon(Icons.settings),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Share with Friends'),
            leading: const Icon(Icons.share),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Logout'),
            leading: const Icon(Icons.logout),
            onTap: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
              Navigator.pushNamed(context, WelcomePage.id);
            },
          ),
        ],
      ),
    );
  }
}
