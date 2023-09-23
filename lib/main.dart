import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hamza Yazar Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AppContent(),
    );
  }
}

class AppContent extends StatelessWidget {
  const AppContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DetailsSection(),
    );
  }
}

class DetailsSection extends StatelessWidget {
  const DetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.center,
              child: Avatar(),
            ),
            Text(
              'Hamza Yazar',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 28,
              ),
            ),
            Text(
              'Full-stack developer ⭐',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              'Making products out of ideas 💯',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Divider(),
            CardsWrap(),
            Divider(),
            CommonPadding(child: ContactDetails()),
          ],
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: Colors.black.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      padding: const EdgeInsets.all(5),
      child: const CircleAvatar(
        minRadius: 32,
        maxRadius: 64,
        backgroundImage: AssetImage('assets/images/avatar_image.jpg'),
      ),
    );
  }
}

class CommonPadding extends StatelessWidget {
  const CommonPadding({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: child,
    );
  }
}

class CardsWrap extends StatelessWidget {
  const CardsWrap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CommonPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'My skills',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Wrap(
            children: [
              SkillsCard(
                label: 'ASP.NET Core',
                assetImagePath: 'assets/images/aspnet_core.png',
              ),
              SkillsCard(
                label: 'PostgreSQL',
                assetImagePath: 'assets/images/postgre_logo.png',
              ),
              SkillsCard(
                label: 'Docker',
                assetImagePath: 'assets/images/docker_logo.png',
              ),
              SkillsCard(
                label: 'Google Cloud Platform',
                assetImagePath: 'assets/images/gcp_logo.png',
              ),
              SkillsCard(
                label: 'Angular',
                assetImagePath: 'assets/images/angular_logo.png',
              ),
              SkillsCard(
                label: 'Flutter',
                assetImagePath: 'assets/images/flutter_logo.png',
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 12)),
        ],
      ),
    );
  }
}

class SkillsCard extends StatelessWidget {
  const SkillsCard({
    Key? key,
    required this.label,
    required this.assetImagePath,
  }) : super(key: key);
  final String label;
  final String assetImagePath;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Column(
          children: [
            SizedBox(
              width: 96,
              height: 96,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image(
                  image: AssetImage(assetImagePath),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactDetails extends StatelessWidget {
  const ContactDetails({Key? key}) : super(key: key);

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  Widget emailText() {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.black,
        ),
        children: <InlineSpan>[
          const WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(Icons.email_rounded),
            ),
          ),
          const TextSpan(text: 'Email me for a full resume at '),
          TextSpan(
            style: const TextStyle(
              color: Colors.blue,
            ),
            text: 'yazar.hamza.business@gmail.com',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                final emailLaunchUrl = Uri(
                  scheme: 'mailto',
                  path: 'yazar.hamza.business@gmail.com',
                  query: encodeQueryParameters(<String, String>{
                    'subject': 'Requesting your resume',
                    'body':
                        'Hi Hamza\n\nWe found your email address from your website and wanted to request your resume.\n\n',
                  }),
                );
                launch(emailLaunchUrl.toString());
              },
          )
        ],
      ),
    );
  }

  Widget githubLink() {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.black,
        ),
        children: <InlineSpan>[
          const WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Padding(
              padding: EdgeInsets.only(right: 12),
              child: FaIcon(FontAwesomeIcons.github),
            ),
          ),
          const TextSpan(text: 'Check out my '),
          TextSpan(
            style: const TextStyle(
              color: Colors.blue,
            ),
            text: 'GitHub profile',
            recognizer: TapGestureRecognizer()
              ..onTap = () => launch('https://github.com/HRahimy'),
          ),
        ],
      ),
    );
  }

  Widget linkedIn() {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.black,
        ),
        children: <InlineSpan>[
          const WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Padding(
              padding: EdgeInsets.only(right: 12),
              child: FaIcon(FontAwesomeIcons.linkedin),
            ),
          ),
          const TextSpan(text: 'Or my '),
          TextSpan(
            style: const TextStyle(
              color: Colors.blue,
            ),
            text: 'LinkedIn',
            recognizer: TapGestureRecognizer()
              ..onTap = () =>
                  launch('https://www.linkedin.com/in/hamza-yazar-a9550a147/'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Contact',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        emailText(),
        const Padding(padding: EdgeInsets.only(top: 12)),
        githubLink(),
        const Padding(padding: EdgeInsets.only(top: 12)),
        linkedIn(),
        const Padding(padding: EdgeInsets.only(top: 30)),
      ],
    );
  }
}
