import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingProvider extends ConsumerWidget {
   LoadingProvider({Key? key,required this.child}) : super(key: key);
   Widget child;

  @override
  Widget build(BuildContext context,ref) {
    bool load = ref.watch(loading.state).state;
    return load ? CircularProgressIndicator() : child;
  }
}
var  loading = StateProvider<bool>((ref){
  return false;
});


void showLoader(Reader reader){

  reader(loading.state).state = true;

}

void hideProvider(Reader reader){
  reader(loading.state).state = false;
}


