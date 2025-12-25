class HomeStates {
  int? currIndex;
  HomeStates({this.currIndex=0});
  HomeStates copyWith({int? currIndex}){
    return HomeStates(
      currIndex: currIndex ?? this.currIndex
    );
  }
}