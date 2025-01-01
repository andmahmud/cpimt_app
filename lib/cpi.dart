import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CpiPolytechnic extends StatefulWidget {
  const CpiPolytechnic({super.key});

  @override
  State<CpiPolytechnic> createState() => _CpiPolytechnicState();
}

class _CpiPolytechnicState extends State<CpiPolytechnic> {
  _launchURL(String baseurl) async {
    final Uri url = Uri.parse(baseurl);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $baseurl');
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
      appBar: AppBar(
        backgroundColor: Colors.teal,
        actionsIconTheme: const IconThemeData(color: Colors.white),
        title: const Text('CPI Polytechnic'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Image.asset(
              'assets/images/logo_cpi.png',
              // Make sure the asset path is correct
            ),
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
                        onTap: () => _launchURL('http://cpi.edu.bd/site/login'),
                        child: Container(
                          width: 180,
                          height: 180,
                          decoration: cardDecoration,
                          child: const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person_2_sharp,
                                  color: Colors.white,
                                  size: 60,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Teacher Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            _launchURL('http://cpi.edu.bd/site/userlogin'),
                        child: Container(
                          width: 180,
                          height: 180,
                          decoration: cardDecoration,
                          child: const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.school,
                                  color: Colors.white,
                                  size: 60,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Student Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
