import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_ui_state_with_provider/provider/ui_provider.dart';
import 'package:learn_ui_state_with_provider/provider/ui_state.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(uiProvider);
    final provider = ref.read(uiProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn RiverPod'),
      ),
      body: Center(
        child: Column(
          children: [
            _stateWidget(uiState,provider),
           
          ],
        ),
      ),
    );
  }

  Widget _stateWidget(UiState uiState,UiProvider provider) {
    return switch (uiState) {
      UiNormalState()=> ElevatedButton(
                onPressed: () {
                  provider.getData();
                },
                child: Text('get data')),
      UiLoadingState()=>const CircularProgressIndicator(),
      UiFailedState(error:String e) =>Text(e),
      UiSuccessState(success:String success)=>Text(success)
    };
  }
}
