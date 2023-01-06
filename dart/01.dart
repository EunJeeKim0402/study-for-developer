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
// ?를 넣어주면 nico가 String일 수도, null일 수도 있다는걸 dart가 인지
void main(){
  String? nico = 'nico';
  nico = null;
  if(nico != null){
    nico.isNotEmpty;
  }
  nico?.isNotEmpty; // nico가 null이 아니라면 isNotEmpty속성을 달라
}


// 한번 정의된 변수를 수정하지 못하게 하려면 final
void main(){
  final /*String*/ name = 'nico';
  //name 'nico';
}


//late는 초기 데이터 없이 변수를 선언할 수 있게 해줌
//final이나 var 앞에 붙여줄 수 있는 수식어
void main(){
  late final String name;
  // 이제 여기다 무언가를 하면 됨
  // ex.API에서 데이터를 받아서 다시 작업
  name = '';
  //name = '12'; 파이널이기 때문에 한번만 선언 가능
  print(name);
  // name이 먼저 들어가야 print가 가능
}


