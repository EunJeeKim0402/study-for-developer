void main() {
  // dart에서는 타입이 지정되지 않은 dynamic이라는 형식을 사용할 수 있음.
  // dynamic은 꼭 필요할 때만 사용해야함.
  //var name; //dynamic
  dynamic name;
  if(name is String){
    name.
  }
  if(name is int){
    name.
  }
}

// null safety란 개발자가 null값을 참조할 수 없도록 하는 것
// dart에서는 어떤 변수가 null이 될 수 있음을 정확히 표시해야 함

// null safety가 없을 때
bool isEmpty(String string) => string.length == 0;

main(){
  isEmpty(null);
}
