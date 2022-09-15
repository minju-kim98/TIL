# Windows에서 Linux Mint Booting USB를 만들어보자

## Linux Mint iso 다운받기
구글에서 Linux Mint iso를 검색하면 Linux Mint 공식 홈페이지에서 iso를 다운받을 수 있다. </br>
* Cinnamon Edition </br>
 휘뚜루 마뚜루 사용할꺼라면 Cinnamon Edition을 다운받자.
* MATE Edition </br>
 좀 더 안정적이고 빠르다고 한다. 그놈2(GNOME 2) 기반이라고 한다.
* Xfce Edition </br>
 가장 가볍고, 가장 안정적이라고 한다. 하지만 지원하는 기능은 Cinnamon이나 Mate보다 적다. </br>
 </br>
 
 Edition 선택을 했으면 download에 들어간 뒤, 아래 Download Mirrors에서 Korea-KAIST를 찾아서 iso를 다운받아줬다.
 
 
 ## 부팅 USB 만들기
 https://rufus.ie/ko/ 에 들어가서 rufus를 다운받는다. </br>
 ![image](https://user-images.githubusercontent.com/59169458/190451216-5f61be37-865c-40c1-a7b7-f4de1ed673f9.png) </br>
위 이미지와 같이 설정을 완료한 뒤, (장치 - 설치할 USB, 부트 유형 - iso, 부트 유형 옆의 선택 - 다운받은 iso 파일) 시작을 누른다. </br>
- warning 창이 뜰 경우, "ISO 이미지 모드로 쓰기 > 예 > 확인" 을 눌러주자. 안 뜰수도 있다. </br>
아래 상태창이 초록색으로 되고, '준비됨'이 뜨면 부팅 USB가 다 만들어진것이다!
