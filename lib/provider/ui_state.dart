sealed class UiState {}

class UiNormalState extends UiState{}
class UiLoadingState extends UiState {}

class UiSuccessState extends UiState {
  final String success;

  UiSuccessState({required this.success});
}

class UiFailedState extends UiState {
  final String error;

  UiFailedState({required this.error});
}
