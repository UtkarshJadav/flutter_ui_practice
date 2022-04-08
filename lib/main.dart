import 'package:flutter_demo/state/login_provider.dart';
import 'package:flutter_demo/view/authentication/build_profile.dart';
import 'package:flutter_demo/view/authentication/setup_orchard.dart';
import 'package:flutter_demo/view/my_home_page.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/utils/helpers/api_provider.dart';
import 'package:flutter_demo/utils/helpers/shared_pref_helper.dart';
import 'package:flutter_demo/view/authentication/login_screen.dart';
import 'package:flutter_demo/view/authentication/walk_through_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:load/load.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(ProviderScope(child: LoadingProvider(
      themeData: LoadingThemeData(), loadingWidgetBuilder: (ctx, data) {
    return Center(
      child: Container(
        child: Lottie.asset(
          'assets/lottie/loading_anim.json',
          width: 200,
          height: 100,
        ),
      ),
    );},child: MyApp())));
}

final apiProvider = Provider((ref) => APIProvider(ref.read));
final prefProvider = Provider((ref) => SharedPref());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
         const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {

  bool isWalkthrough = false;
  bool isLogin = false;
  @override
  void initState() {

    super.initState();

    Future.delayed(
      const Duration(seconds: 3),
          () {
            if (isWalkthrough) {
              if(isLogin){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SetUpOrchardScreen()),
              );
              }else{
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              }
            }
            else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const WalkThroughScreen()),
              );
            }
          },
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.read(prefProvider).isWalkThroughVisited().then((value) => isWalkthrough =  value);
    ref.read(prefProvider).isLoggedIn().then((value) => isLogin =  value);
    ref.watch(prefProvider).getToken().then((value) => ref.watch(authToken.state).state = value);
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'logo',
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ic_splash.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
