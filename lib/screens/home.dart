import 'package:cpimt_app/screens/cpi.dart';
import 'package:cpimt_app/screens/hostel.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  final String facebookUrl = 'https://www.facebook.com/CPIMT';
  final String youtubeUrl = 'https://www.youtube.com/@cpimt';

  _launchURL(String baseUrl) async {
    final Uri url = Uri.parse(baseUrl);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $baseUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    const BoxDecoration cardDecoration = BoxDecoration(
      color: Colors.teal,
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0, 3),
          blurRadius: 6,
        ),
      ],
      borderRadius: BorderRadius.all(Radius.circular(16)),
    );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Image.asset(
              'assets/images/logo_cpi.png',
              fit: BoxFit.contain,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Welcome to CPI Polytechnic \n              Mirpur, Dhaka',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
          ),
          // const Divider(),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CpiPolytechnic()),
                          );
                        },
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: cardDecoration,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.cast_for_education,
                                  color: Colors.white, size: 60),
                              SizedBox(height: 8),
                              Text(
                                'CPI Polytechnic',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Hostel()),
                          );
                        },
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: cardDecoration,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.hotel, color: Colors.white, size: 60),
                              SizedBox(height: 8),
                              Text(
                                'CPI Hostel',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => _launchURL('http://cpi.edu.bd'),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 50,
                      decoration: cardDecoration,
                      child: const Center(
                        child: Text(
                          'CPI Website',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => _launchURL(facebookUrl),
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.facebook,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _launchURL(youtubeUrl),
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.video_library,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   height: 3,
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
