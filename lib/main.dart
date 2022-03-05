import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_presenter/bloc_observer.dart';
import 'package:my_presenter/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    webRecaptchaSiteKey: '6LcEi7IeAAAAADgGd0o4vaSeUyr8s8oXwFDu26Ne',
  );
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hamza Rahimy Portfolio',
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
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Align(
              alignment: Alignment.center,
              child: Avatar(),
            ),
            Text(
              'Hamza Rahimy',
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
    return CommonPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
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
            children: const [
              SkillsCard(
                label: 'NodeJs',
                assetImagePath: 'assets/images/nodejs_logo.png',
              ),
              SkillsCard(
                label: 'NestJS',
                assetImagePath: 'assets/images/nestjs_logo.png',
              ),
              SkillsCard(
                label: 'ASP.NET Core',
                assetImagePath: 'assets/images/aspnet_core.png',
              ),
              SkillsCard(
                label: 'PostgreSQL',
                assetImagePath: 'assets/images/postgre_logo.png',
              ),
              SkillsCard(
                label: 'Apache Cassandra',
                assetImagePath: 'assets/images/cassandra_icon.png',
              ),
              SkillsCard(
                label: 'Docker',
                assetImagePath: 'assets/images/docker_logo.png',
              ),
              SkillsCard(
                label: 'Kubernetes',
                assetImagePath: 'assets/images/kubernetes_logo.png',
              ),
              SkillsCard(
                label: 'Google Cloud Platform',
                assetImagePath: 'assets/images/gcp_logo.png',
              ),
              SkillsCard(
                label: 'Firebase',
                assetImagePath: 'assets/images/firebase_logo.png',
              ),
              SkillsCard(
                label: 'Angular',
                assetImagePath: 'assets/images/angular_logo.png',
              ),
              SkillsCard(
                label: 'Flutter',
                assetImagePath: 'assets/images/flutter_logo.png',
              ),
              SkillsCard(
                label: 'GitHub',
                assetImagePath: 'assets/images/github_logo.png',
              ),
              SkillsCard(
                label: 'GitHub',
                assetImagePath: 'assets/images/gitlab_logo.png',
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 12)),
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
