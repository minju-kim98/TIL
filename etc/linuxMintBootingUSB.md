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
- warning 창이 뜰 경우, "ISO 이미지 모드로 쓰기 > 예 > 확인" 을 눌러주자. 안 뜰수도 있다.

아래 상태창이 초록색으로 되고, '준비됨'이 뜨면 부팅 USB가 다 만들어진것이다! </br>
'닫기'를 누른 뒤, Linux Mint를 설치할 컴퓨터에 USB를 꽂고, 재시작 해주자. 

## Linux Mint 설치
컴퓨터를 재시작 할 때, Windows로 부팅 되기 전, F2를 누르면 BIOS Configuration이 뜬다. </br>
- 이 때 누르는 키는 F2가 아닐 수도 있다. 노트북/컴퓨터에 따라 다를 수 있으니 주의. </br>

그 다음, Boot 순서 설정에서 방금 만든 booting USB를 제일 먼저 오게 바꿔준다. </br>
저장하고 Exit하면 GRUB가 뜰 것이다. </br>
여기서 "Start Linux Mint 21 Cinnamon 64-bit" (맨 위에 있는 모드)로 들어간다.</br></br>

이 때, 바탕화면으로 들어가지는데, 여기에 "Install Linux Mint"가 보일것이다.</br>
"Install Linux Mint"를 누르고 초기 설정을 해준다. </br></br>
USB를 제거하고 재부팅하면 완성!
