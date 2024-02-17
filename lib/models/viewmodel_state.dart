// ignore_for_file: public_member_api_docs, sort_constructors_first
class ViewModelState<T> {
  final bool loading;
  final T data;
  final bool buttonEnabled;

  ViewModelState({
    required this.loading,
    required this.data,
    this.buttonEnabled = true,
  });

  factory ViewModelState.init(T data) =>
      ViewModelState(loading: false, data: data, buttonEnabled: false);

  ViewModelState<T> setLoading([bool loading = true]) {
    return ViewModelState<T>(
      loading: loading,
      data: data,
      buttonEnabled: buttonEnabled,
    );
  }

  ViewModelState<T> setData(
    T? data,
  ) {
    return ViewModelState<T>(
      loading: loading,
      data: data ?? this.data,
      buttonEnabled: buttonEnabled,
    );
  }

  ViewModelState<T> setButtonEnabled(
    bool buttonEnabled,
  ) {
    return ViewModelState<T>(
      loading: loading,
      data: data,
      buttonEnabled: buttonEnabled,
    );
  }

  @override
  bool operator ==(covariant ViewModelState<T> other) {
    if (identical(this, other)) return true;

    return other.loading == loading &&
        other.data == data &&
        other.buttonEnabled == buttonEnabled;
  }

  @override
  int get hashCode => loading.hashCode ^ data.hashCode ^ buttonEnabled.hashCode;
}
