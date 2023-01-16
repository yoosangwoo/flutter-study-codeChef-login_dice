### If statement

### TextField 에 있는 데이터를 읽으려면 TextEditingController 를 사용해야한다
- TextEditingController 를 생성해서 TextField 와 연결시켜야한다
  - TextEditingController 생성자를 통해 인스턴스를 만든다
  - TextField 내 controller argument 가 포함되어있다
  - controller.text 를 사용하여 데이터를 이용할수있다
  - 
- TextEditingController 를 다 사용하고 나서는 리소스를 낭비하지않기 위해 dispose method 를 실행시켜야한다 (다이스는 많은 리소스낭비가 없어서 안해도됨)


### Focus
- FocusNode : 포커스를 받는 특정 위젯을 식별
- FocusScope : 어떤 위젯들까지 포커스를 받는지 범위를 나타냄
