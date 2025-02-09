import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _callNumber(String number) async {
    final Uri phoneUri = Uri.parse("tel:$number");
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      debugPrint("Could not open $phoneUri!");
    }
  }

  void _sendEmail(String email) async {
    final Uri emailUri = Uri.parse("mailto.$email");
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      debugPrint("Could not open $emailUri!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF4A90E2),
                Color(0xFF904E95),
              ]),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // P R O F I L E  I M A G E ⭐
              Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Colors.white, Colors.grey],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 70.0,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.asset(
                      "images/Hero.jpg",
                      width: 130,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // N A M E  & T I T L E ⭐
              const SizedBox(height: 12.0),
              const Text(
                "John Doe",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.8,
                  fontFamily: 'Nunito',
                  // You can change font family between :
                  // SourceSans3 & Poppins & Roboto & Montserrat
                ),
              ),
              const SizedBox(height: 4.0),
              const Text(
                "FLUTTER DEVELOPER",
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 1.5,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'SourceSans3',
                ),
              ),
              const SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              // CONTACT INFORMATION CARD
              ContactCard(
                icon: Icons.phone,
                text: "+989876543210",
                onTap: () {
                  _callNumber("+989876543210");
                },
              ),
              const SizedBox(height: 10.0),
              ContactCard(
                icon: Icons.email,
                text: "JohnDoe@gmail.com",
                onTap: () {
                  _sendEmail("JohnDoe@gmail.com");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Contact Card Widget
class ContactCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const ContactCard(
      {required this.icon, required this.text, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 6,
        color: Colors.white.withOpacity(0.9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.blueAccent, size: 24),
              const SizedBox(width: 12),
              Text(text,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }
}
