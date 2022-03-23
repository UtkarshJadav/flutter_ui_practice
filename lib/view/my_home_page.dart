
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../main.dart';
import '../state/login_provider.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {

   ref.watch(prefProvider).getToken().then((value) => ref.watch(authToken.state).state = value);

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            ref.read(loginProvider.notifier).loginUser(ref.read,"+911234567891");
           // ref.read(loginProvider.notifier).verfyOtp(ref.read,"+911234567891","123456");
           // ref.read(homeProvider.notifier).getMainModules(ref.read);

          },
          child: Text(ref.watch(authToken.state).state),
        )
      ),
    );
  }


}
