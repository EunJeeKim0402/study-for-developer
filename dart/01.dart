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


// 'const' compile-time constant
// const는 compile-time에 알고 있는 값이어야 함
// const는 컴파일 할 때 알고 있는 값에 사용하는 것임
// 즉, 값을 API나 사용자에게서 받아와야 한다면 var이나 final을 써야됨
void main(){
  //const name = 'nico';
  //name = '12'; 자바의 const처럼 수정안되는건 같음
  //final API = fetchApi();
  const max_allowed_price = 120;
}


// dart의 자료형
void main(){
  String name = 'nico'; // 작은따옴표
  String name = "nico"; // 큰따옴표
  bool alive = true; // 불린
  int age = 12;
  double money = 69.99;
  // 이런 모든 dart의 자료형이 거의 object형임
  // dart는 객체지향언어
  
  // num은 int와 double의 부모클래스.
  num x = 12;
  x = 1.1;
}


void main(){
  var numbers = [1,2,3,4,5];
  List<int> numbers = [1,2,3,4,5,];
  //numbers.add('lalala');
  numbers.add(111);
  numbers.last; // 마지막 요소를 가져와야하는데 몇개나 있는지 모를 때
  // 등등 많은 메소드들이 있음.
  
  // List에서는 collection if와 collection for을 지원함
  var giveMeFive = true;
  var number = [
    1, 
    2, 
    3, 
    4,
    if(giveMeFive) 5, // 만약 giveMeFive의 값이 true일 경우
  ];
}


// String interpolation : text에 변수를 추가하는 방법
// $변수명. 이미 변수가 존재할 때 쓰는 방법.
// 계산할때는 ${변수명 + 2}과 같이할것
void main(){
  var name = 'nico';
  var age = 10;
  var greeting = "Hello, my name is $name and I'm ${age + 2}";
  print(greeting);
}


// collection for
void main(){
  var oldFriends = ['nico', 'lynn'];
  var newFriends = [
    'lewis',
    'ralph',
    'darren',
    for(var friend in oldFriends) "love $friend",
  ];
  print(newFriends);
}


// Map
void main(){
  var player = {
    'name' : 'nico',
    'wp' : 19.19,
    'superpower' : false,
  };
  // object의 타입은 anything이라고 보면 됨
  
  Map<int, bool> player = {
    1 : true,
    2 : false,
    3 : true,
  };
  Map<List<int>, bool> player = {
    [1,2,3,4] : true,
  };
  List<Map<String, Object>> players = [
    {'name': 'nico', 'xp': 199993.999},
    {'name': 'nico', 'xp': 199993.999}
  ];
}


// Set (튜플같은 개념)
// Set은 유니크설정이 있기 때문에 중복이 안됨
void main(){
  //var numbers = {1,2,3,4};
  Set<int> numbers = {1,2,3,4};
  numbers.add(1);
  numbers.add(1);
  numbers.add(1);
  numbers.add(1);
  print(numbers);
}


// Function 정의
// void는 아무것도 return하지 않는다는 뜻
//String sayHello(String potato){
//  return ("hello $potato nice to meet you");
//}
String sayHello(String potato) =>
   ("hello $potato nice to meet you");

void main(){
  print(sayHello('nico'));
}
num plus(num a, num b) => a + b;


// Parameters 정의
// 만약 sayHello값이 null이어도 기본값이 들어감
String sayHello({
  //String name = 'anon', int age = 90, String country = 'wakanda'
  required String name,
  required int age,
  required String country,
  }){
  return "hello $name, $age, $country";
}
void main(){
  print(
    sayHello(
    //'nico', 19 , 'cuba'
    age : 12,
    country : 'caba',
    name : 'nico',
  )
  );
}


// Optional Positional Parameters
// 순서에 맞춰서 입력해야 함
String sayHello(String name, 
                int age,
                [String? country = 'korea'])
                => 'Hello $name, you are $age from $country';
void main(){
  var results = sayHello('nico', 12);
  print(results);
  // country를 적지 않았는데도 문제가 없음
}


// QQ Operator
// ??
//String capitalizeName(String? name) => name.toUpperCase();
// ?를 붙임으로써 name은 null일 수도 있고 아닐 수도 있다. 그러나 toUpper가 적용안됨
/*
String capitalizeName(String? name){
  if(name != null){
    return name.toUpperCase();
  }
  return 'ANON';
}
*/
// 위 코드를 더 짧게
// 좌측 ?? 우측 : 좌향이 null이면 우향을 return 
String capitalizeName(String? name) => 
    //name != null ? name.toUpperCase() : 'ANON';
    name?.toUpperCase() ?? 'ANON';
void main(){
  capitalizeName('nico');
  capitalizeName(null);
}
// ??=
void main(){
  String? name;
  name ??= 'nico';
  name = null;
  name ??= 'another';
  print(name);
}


// Typedef
// 자료형이 헷갈릴 때 도움이 될 alias를 만드는 방법
/*
typedef ListOfInts = List<int>;
List<int> reverseListOfNumbers(List<int> list){
  var reversed = list.reversed;
  return reversed.toList();
}
*/
typedef UserInfo = Map<String, String>;
String sayHi(Map<String, String> userInfo){
  return 'Hi ${userInfo['name']}';
}
void main(){
  //print(reverseListOfNumbers([1,2,3]));
  sayHi({'name': 'nico'});
}


// dart와 flutter는 모두 클래스로 이루어져 있음
// Class에서 property를 선언할 때는 타입을 사용해서 정의함
// 즉, 타입이 필수라는 이야기
class Player{
  //String name = 'nico';
  //만약 Player의 이름을 못바꾸게 하고 싶다면?
  final String name = 'nico';
  int xp = 1500;
  
  void sayHello(){
    print('Hi my name is $name');
  }
}
void main(){
  var player = Player();
  print(player.name);
  player.sayHello();
  //player.name = 'lalala'; // final을 선언하는순간 에러남
  //print(player.name);
}


// Constructors메소드의 이름은 class와 같아야됨
class Player{
  // late는 변수들의 값을 나중에 받아올것이라는 의미
  final String name;
  int xp;
  
  Player(this.name, this.xp);
  
  void sayHello(){
    print('Hi my name is $name');
  }
}
void main(){
  var player = Player('nico', 1500);
  player.sayHello();
  var player2 = Player('lynn', 2500);
  player2.sayHello();
}


// Named(명명된) Constructor Parameters
// 아까 방식을 사용하면 항목이 너무 많아질 때 가독성이 안좋음
class Player{
  final String name;
  int xp;
  String team;
  int age;
  
  // name, xp... 등이 null일 수도 있으니 에러.
  //Player({this.name, this.xp, this.team, this.age});
  Player({
    required this.name, 
    required this.xp, 
    required this.team, 
    required this.age
    });
  
  void sayHello(){
    print('Hi my name is $name');
  }
}
void main(){
  // flutter에는 아래 방식이 더 많음
  var player = Player(
    name : 'nico',
    xp : 1200,
    team : 'blue',
    age : 21,
  );
  var player2 = Player(
    name : 'lynn', 
    xp : 2500, 
    team : 'blue', 
    age : 13,
  );
}


// Named(명명된) Constructor
class Player{
  final String name, team;
  int xp, age;
    
  Player({
    required this.name, 
    required this.xp, 
    required this.team, 
    required this.age
    });
  
  // : 을 사용함으로써 property들을 초기화할 수 있음
  // named parameter형식. 기본적으로 required속성이 없음.
  Player.createBluePlayer({
    required String name, 
    required int age
    }) : this.age = age,
         this.name = name,
         this.team = 'blue',
         this.xp = 0;
  // positional parameter. 기본적으로 required임
  Player.createRedPlayer(String name, int age)
       : this.age = age,
         this.name = name,
         this.team = 'red',
         this.xp = 0;
  
  void sayHello(){
    print('Hi my name is $name');
  }
}

void main(){
  // 블루팀 (named형식)
  var player = Player.createBluePlayer(
    name : 'nico',
    age : 21,
  );
  // 레드팀 (positional형식)
    var player = Player.createRedPlayer(
    'nico',
    21,
  );
}











