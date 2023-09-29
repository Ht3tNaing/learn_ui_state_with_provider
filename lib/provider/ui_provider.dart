import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_ui_state_with_provider/model/service.dart';
import 'package:learn_ui_state_with_provider/provider/ui_state.dart';

class UiProvider extends Notifier<UiState> {
  final UiState _uiState = UiNormalState();
  @override
  UiState build() {
    return _uiState;
  }

  void getData() async {
    try {
      state = UiLoadingState();
      String data = await Services().getData();
      state = UiSuccessState(success: data);
    } catch (e) {
      state = UiFailedState(error: e.toString());
    }
  }
}

NotifierProvider<UiProvider, UiState> uiProvider = NotifierProvider(() {
  return UiProvider();
});
