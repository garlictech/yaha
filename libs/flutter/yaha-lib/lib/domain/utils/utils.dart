class LoadableState<T> {
  final bool loading;
  final String? error;
  final T? data;

  LoadableState({this.loading = true, this.error, this.data});
}
