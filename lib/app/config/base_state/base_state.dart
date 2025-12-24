class BaseState<T>
{
  bool? isLoading;
  T? success;
  Exception? error;
  BaseState({this.isLoading, this.success, this.error});
}