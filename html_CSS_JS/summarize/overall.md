# HTML
## 텍스트 관련 태그
종류|설명
---|---
```<hn>```|제목. ```<h1>```~```<h6>```까지 사용할 수 있으며 숫자가 커질수록 글자 크기는 작아진다.
```<p>```|텍스트 단락. 내용이 길면 웹 브라우저 창의 너비에 맞게 자동으로 줄 바꾼다.
```<br>```|줄 바꿈. 텍스트 단락 중 원하는 위치에서 줄 바꾼다.
```<blockquote>```|내용 인용. 다른 내용보다 들여쓰고 단락으로 표시한다.
```<strong>```|중요한 텍스트를 굵게 표시, 화면 낭독기에서 강조해서 읽어준다.
```<b>```|중요하지는 않지만 굵게 표시한다.
```<em>```|중요한 텍스트를 기울게 표시(문장), 화면 낭독기에서 강조해서 읽어준다.
```<i>```|중요하지는 않지만 기울게 표시(마음속의 생각이나 용어)한다.
```<ins>```|내용을 편집할 때 추가한 내용을 표시한다.
```<del>```|내용을 편집할 때 삭제한 내용을 표시한다.
```<sup>```|위 첨자 이다.
```<sub>```|아래 첨자 이다.

## 목록 관련 태그
종류|설명
---|---
```<ol>```|순서 있는 목록의 시작과 끝을 나타낸다.
```<ul>```|순서 없는 목록의 시작과 끝을 나타낸다.
```<li>```|순서 있는 목록이나 순서 없는 목록의 각 항목을 나타낸다.
```<dl>```|설명 목록의 시작과 끝을 나타낸다.
```<dt>```|설명 목록의 이름(제목)을 나타낸다.
```<dd>```|설명 목록의 값(설명)을 나타낸다.


## 표 관련 태그
종류|설명
---|---
```<table>```|표를 나타낸다.
```<caption>```|표의 제목을 넣는다.
```<tr>```|표의 행을 만든다.
```<td>```|표의 셀을 만든다.
```<th>```|제목 셀을 만든다.
```<thead>```|표 구조에서 제목 부분을 나타낸다.
```<tbody>```|표 구조에서 본문 부분을 나타낸다.
```<tfoot>```|표 구조에서 요약이나 정리 부분을 나타낸다.
```<col>```|표에서 열의 스타일을 지정한다.
```<colgroup>```|표에서 여러 열을 함께 묶어서 스타일을 지정한다.

## 멀티미디어 관련 태그
종류|설명
---|---
```<object>```|멀티미디어, PDF 파일 등 다양한 형식의 파일을 삽입한다.
```<embed>```|```<audio>```, ```<video>```태그와 ```<object>```태그도 지원하지 않을 경우 멀티미디어 파일을 삽입한다.
```<img>```|이미지 파일을 삽입한다.
```<audio>```|오디오 파일을 삽입한다.
```<video>```|비디오 파일을 삽입한다.

<hr>

## 폼에서 사용하는 태그
종류|설명
---|---
```<form>```|폼의 시작과 끝을 만든다.
```<fieldset>```|폼 요소를 그룹으로 묶는다.
```<legend>```|필드셋에 제목을 붙인다.
```<input>```|사용자가 내용을 입력할 필드를 삽입한다.
```<select>```, ```<option>```|드롭다운 목록을 삽입한다.
```<textarea>```|텍스트를 여러 줄 입력할 수 있는 텍스트 영역을 삽입한다.
```<datalist>```|데이터 목록을 삽입한다.

## ```<input>``` 태그의 유형(type)
종류|설명
---|---
text|한 줄짜리 텍스트를 입력할 수 있는 텍스트 상자를 넣는다.
password|비밀번호를 입력할 수 있는 필드를 넣는다.
search|검색할 때 입력하는 필드를 넣는다.
url|URL 주소를 입력할 수 있는 필드를 넣는다.
email|이메일 주소를 입력할 수 있는 필드를 넣는다.
tel|전화번호를 입력할 수 있는 필드를 넣는다.
checkbox|주어진 여러 항목에서 2개 이상 선택할 수 있는 체크 박스를 넣는다.
radio|주어진 여러 항목에서 1개 이상 선택할 수 있는 라디오 버튼을 넣는다.
number|숫자를 조절할 수 있는 스판 박스를 넣는다.
range|숫자를 조절할 수 있는 슬라이드 막대를 넣는다.
date|사용자 지역을 기준으로 날짜(연, 월, 일)를 넣는다.
month|사용자 지역을 기준으로 날짜(연, 월)를 넣는다.
week|사용자 지역을 기준으로 날짜(연, 주)를 넣는다.
|time|사용자 지역을 기준으로 시간 (시, 분, 초, 분할초)을 넣는다.|
|datetime|국제 표준시(UTC) 기준으로 설정된 날짜와 시간(연, 월, 일, 시, 분, 초, 분할 초)을 넣는다.|
|datetime-local|사용자가 있는 지역을 기준으로 설정된 날짜와 시간(연, 월, 일, 시, 분, 초, 분할 초)을 넣는다.|
|submit|전송 버튼을 넣는다.|
|reset|리셋 버튼을 넣는다.|
|image|submit 버튼 대신 사용할 이미지를 넣는다.|
|button|일반 버튼을 넣는다.|
|file|파일을 첨부할 수 있는 버튼을 넣는다.|
|hidden|사용자에게는 보이지 않지만 서버로 넘겨주는 값이 있는 필드를 만든다.|

## ```<input>``` 태그의 속성
종류|설명
---|---
autofocus|웹 문서가 열리면 입력 핅드 안에 마우스 포인터를 표시한다.
placeholder|텍스트 필드에 힌트를 표시한다.
readonly|입력 필드를 읽기 전용으로 지정한다.
required|필수 입력 필드를 지정한다.
max|숫자 입력 필드에서 최댓값을 지정한다. (기본값: 100)
min|숫자 입력 필드에서 최솟값을 지정한다. (기본값: 0)
step|숫자 입력 필드에서 증감할 간격을 지정한다.
maxlength|텍스트 관련 필드에서 입력할 수 있는 최대 길이를 지정한다.
minlength|텍스트 관련 필드에서 입력할 수 있는 최소 길이를 지정한다.
size|텍스트 관련 필드에서 화면에 표시할 크기를 지정한다.
list|연결할 데이터 목록을 지정한다.

<hr>


# CSS
## 스타일 시트
종류|설명
---|---
브라우저 기본 스타일|웹 브라우저에 웹 문서를 표시할 때 기본으로 사용하는 스타일이다.
인라인 스타일|```style```속성을 사용해 필요한 요소에 스타일을 직접 지정한다.
내부 스타일 시트|문서 앞부분에 문서에서 사용하는 스타일을 모아서 함께 정의하고 관리한다.
외부 스타일 시트|문서에서 사용하는 스타일을 모아서 따로 파일로 저장한 후 연결해서 사용한다.

## CSS 기본 선택자
종류|설명|작성 예시
---|---|---
전체 선택자|문서의 모든 요소에 스타일을 적용한다.|```* { margin:0;  }```
타입 선택자|특정 태그를 사용한 모든 요소에서 스타일을 적용한다.|```p { font-style: italic; }```
클래스 선택자|특정 부분만 선택해서 문서 안에 여러 번 적용한다.마침표(.)를 붙여서 사용한다.|```.bg { background-color: #ddd; }```
id 선택자|특정 부분만 선택해서 문서 안에서 한 번만 적용한다. #을 붙여서 사용한다.|```#container { width: 500px; }```
그룹 선택자|여러 요소에 같은 스타일을 적용할 때 사용한다.|```h1, h2 { text-align: center; }```

## 스타일 우선순위
1. 얼마나 중요한가?
    * 사용자 스타일 -> 제작자 스타일 -> 브라우저 기본 스타일
2. 적용 범위는 어디까지인가?
    * !important -> 인라인 스타일 -> id 스타일 -> 클래스 스타일 -> 타입 스타일
3. 소스 작성 순서는 어떠한가?
    * 나중에 작성한 스타일이 먼저 작성한 스타일을 덮어 쓴다.

<hr>

## 글자와 관련된 속성
종류|설명
---|---
font-family|글꼴 종류를 지정한다.
font-size|글자 크기를 지정한다.
font-style|글자를 이탤릭체로 표시할지 지정한다.
font-weight|글자의 굵기를 지정한다.

## 텍스트 스타일 속성
종류|설명
---|---
color|글자색을 지정한다.
text-decoration|텍스트에 밑줄이나 취소선을 표시할지 여부를 지정한다.
text-transform|텍스트 전체, 또는 첫 글자를 대문자로 표시한다.
text-shadow|텍스트에 그림자를 추가한다.
letter-spacing|글자 사이의 간격을 지정한다.
word-spacing|단어 사이의 간격을 지정한다.
text-align|텍스트 정렬 방법을 지정한다.
line-height|줄 간격을 조절한다.

## 웹에서 색상을 지정하는 방법
<table>
    <tr>
        <th>방법</th>
        <th colspan="2">설명</th>
    </tr>
    <tr>
        <td>16진수</td>
        <td colspan="2">빨강, 초록, 파랑 각각 두 자리씩 총 여섯 자리의 16진수로 색상을 표현한다.</td>
    </tr>
    <tr>
        <td rowspan="2">rgb, rgba</td>
        <td>rgb(R, G, B)</td>
        <td>빨강, 초록, 하랑의 양을 0~255 사이의 숫자로 표현한다.</td>
    </tr>
    <tr>
        <td>rgba(R, G, B, a)</td>
        <td>rgb 형식에 불투명도를 함께 표현한다.</td>
    </tr>
    <tr>
        <td rowspan="2">hsl, hsla</td>
        <td>hsl(H, S, L)</td>
        <td>색상, 채도 , 명도의 값으로 색상 표현한다.</td>
    </tr>
    <tr>
        <td>hsla(H, S, L, a)</td>
        <td>hsl 형식에 불투명도를 함께 표현한다.</td>
    </tr>
    <tr>
        <td>색상 이름</td>
        <td colspan="2"> red, yellow, black과 같은 색상 이름을 사용한다.</td>
    </tr>
</table>

<hr>

## 박스 모델 속성
종류|설명
---|---
width|박스 모델의 너비를 지정한다.
height|박스 모델의 높이를 지정한다.
box-sizing|박스 모델의 크기를 계산하는 기준을 지정한다.
box-shadow|박스 모델에 그림자 효과를 추가한다.

## 테두리 속성
속성|설명
---|---
border-style|상하좌우 4개 방향의 테두리 스타일을 한꺼번에 지정한다.
border-위치-style|'위치'자리에 top, right, bottom, left 중에서 선택해서 특정 위치의 테두리 스타일만 지정한다.
border-width|상하좌우 4개 방향의 테두리 두께를 한꺼번에 지정한다.
border-위치-width|'위치'자리에 top, right, bottom, left 중에서 선택해서 특정 위치의 테두리 두께만 지정한다.
border-color|상하좌우 4개 방향의 테두리 색상을 한꺼번에 지정한다.
border-위치-color|'위치'자리에 top, right, bottom, left 중에서 선택해서 특정 위치의 테두리 색상만 지정한다.
border-radius|상하좌우 4개 방향의 꼭짓점을 한꺼번에 둥글게 만든다.
border-위치-radius|'위치'자리에 top-left, top-right, bottom-right, bottom-left 등을 선택해서 특정 꼭짓점만 둥글게 처리한다.

## 여백 속성
종류|설명
---|---
margin|상하좌우 4개 방향의 마진을 한꺼번에 지정한다.
margin-위치|'위치'자리에 top, right, bottom, left 중에서 선택해서 특정 위치의 마진만 지정한다.
padding|상하좌우 4개 방향의 패딩을 한꺼번에 지정한다.
padding-위치|'위치'자리에 top, right, bottom, left 중에서 선택해서 특정 위치의 패딩만 지정한다.

## 레이아웃 속성
종류|설명
---|---
display| 화면에서 요소를 배치할 방법을 지정한다. 자주 사용하는 속성으로 ```block```, ```inline```, ```inline-block```, ```none```등이 있다.
float|웹 요소를 왼쪽이나 오른쪽으로 배치한다. ```float```를 적용한 요소는 ```clear``` 속성으로 해제하지 않으면 뒤에 오는 요소도 계속 왼쪽이나 오른쪽으로 연결해서 배치된다.

## 위치 지정 속성
종류|설명
---|---
left, right, top, bottom|기준 위치와 요소 사이에 상하좌우 얼마나 떨어져 있는지 지정한다.
position|웹 요소의 위치를 지정한다. 속성값으로 ```static```, ```relative```, ```absolute```, ```fixed```가 있다.

<hr>

## 배경 이미지 관련 속성
종류|설명
---|---
background-color|배경색을 지정한다.
background-clip|배경색이나 이미지를 어디까지 적용할지 지정한다.
background-image|배경 이미지를 지정한다.
background-repeat|배경 이미지의 반복 방법을 지정한다.
background-position|배경 이미지의 위치를 지정한다.
background-origin|배경 이미지를 배치할 기준을 지정한다.
background-attachment|배경 이미지를 문서에 고정한다.
background|하나의 속성으로 배경 스타일을 한꺼번에 지정한다.
background-size|배경 이미지의 크기를 조절한다.

## 선형 그라데이션 관련 속성
종류|설명
---|---
방향|끝 지점을 기준으로 ```to``` 다음에 방향을 나타내는 예약어를 최대 2개까지 사용할 수 있다. 사용 가능한 예약어는 ```left```와 ```right```, ```top```과 ```bottom```이 있다.
각도|그라데이션이 끝나는 각도를 지정한다. 값은 ```deg```로 표기한다.
색상중지점|쉼표(,)로 색상을 구분하며, 색상만 지정하거나 색상과 중지점의 위치를 함께 지정한다.

## 원형 그라데이션 관련 속성
<table>
    <tr>
        <th colspan="2">종류</th>
        <th>설명</th>
    </tr>
    <tr>
        <td rowspan="2">모양</td>
        <td>ellipse</td>
        <td>타원형의 그라데이션을 나타낸다. (기본값)</td>
    </tr>
    <tr>
        <td>circle</td>
        <td>원형의 그라데이션을 나타낸다.</td>
    </tr>
    <tr>
        <td rowspan="4">크기</td>
        <td>closest-side</td>
        <td>그라데이션 가장자리가 그라데이션 중심에서 가장 가까운 측면에 닿게 한다.</td>
    </tr>
    <tr>
        <td>closest-corner</td>
        <td>그라데이션 가장자리가 그라데이션 중심에서 가장 가까운 꼭짓점에 닿게 한다.</td>
    </tr>
    <tr>
        <td>farthest-side</td>
        <td>그라데이션 가장자리가 그라데이션 중심에서 가장 멀리 떨어진 측면에 닿게 한다.</td>
    </tr>
    <tr>
        <td>farthest-corner</td>
        <td>그라데이션 가장자리가 그라데이션 중심에서 가장 멀리 떨어진 꼭짓점에 닿게 한다.</td>
    </tr>
    <tr>
        <td colspan="2">위치</td>
        <td>at를 앞에 붙인 후 키워드나 백분율을 사용한다.</td>
    </tr>
    <tr>
        <td colspan="2">색상 중지점</td>
        <td>쉼표(,)로 색상을 구분하며, 색상만 지정하거나 색상과 중지점의 위치를 함께 지정한다.</td>
    </tr>
</table>

<hr>


## 연결 선택자
종류|형식|설명
---|---|---
하위 선택자|상위요소 하위요소|상위요소에 포함된 모든 하위요소를 선택한다.
자식 선택자|부모요소 > 자식요소|부모 요소에 포함된 자식 요소만 선택한다.
인접 형제 선택자|요소1 + 요소2|요소1 이후 맨 먼저 오는 형제 요소를 선택한다.
형제 선택자|요소1 ~ 요소2|요소1과 형제인 모든 요소를 선택한다.

## 속성 선택자
종류|선택 요소|예시
---|---|---
[속성]|해당 속성이 있는 요소|```[required]```
[속성 = 값]|지정된 속성값이 있는 요소|```[target=_blank]```
[속성 ~= 값]|지정된 속성값이 포함된 요소(단어별)|```[class ~= button]```
[속성 \|= 값]|지정된 속성값이 포함된 요소(하이픈 포함, 단어별)|```[title \|= us]```
[속성 ^= 값]|지정된 속성값으로 시작하는 요소|```[title ^= eng]```
[속성 $= 값]|지정된 속성값으로 끝나는 요소|```[href $= xls]```
[속성 *= 값]|지정된 속성값의 일부가 일치하는 요소|```[href *= w3]```

## 가상 클래스
종류|설명
---|---
:link|방문하지 않은 링크에 스타일을 적용한다.
:visited|방문했던 링크에 스타일을 적용한다.
:hover|지정한 요소에 마우스 포인터를 올려놓을 때 스타일을 적용한다.
:active|지정한 요소를 활성화했을 때 스타일을 적용한다.
:focus|지정한 요소에 초점이 맞춰졌을 때 스타일을 적용한다.
:target|앵커 대상에 스타일을 적용한다.
:enabled|지정한 요소를 사용할 수 있는 상태일 때 스타일을 적용한다.
:disabled|지정한 요소를 사용할 수 없는 상태일 때 스타일을 적용한다.
:checked|선택한 요소의 스타일을 적용한다.
:not|지정한 요소가 아닐 때 선택해서 스타일을 적용한다.

## 구조 가상 클래스
선택자|설명
---|---
:only-child|부모 안에 자식요소가 하나뿐일 때 자식 요소를 선택한다.
A:only-type-of|부모 안에 A 요소가 하나 뿐일 때 선택한다.
:first-child|부모 안에 있는 모든 요소 중에서 첫 번째 자식 요소를 선택한다.
:last-child|부모 안에 있는 모든 요소 중에서 마지막 자식 요소를 선택한다.
A:first-of-type|부모 안에 있는 A 요소 중에서 첫 번째 요소를 선택한다.
A:last-of-type|부모 안에 있는 A 요소 중에서 마지막 요소를 선택한다.
:nth-child(n)|부모 안에 있는 모든 요소 중에서 n번째 자식 요소를 선택한다.
:nth-last-child(n)|부모 안에 있는 모든 요소 중에서 끝에서 n번째 자식 요소를 선택한다.
A:nth-of-type(n)|부모 안에 있는 A 요소 중에서 n번째 요소를 선택한다.
A:nth-last-of-type(n)|부모 안에 있는 A 요소 중에서 끝에서 n번째 요소를 선택한다.

## 가상 요소
선택자|설명
---|---
::first-line|첫 번째 줄을 선택한다.
::first-letter|줄에서 첫 번째 글자를 선택한다.
::before|특정 요소의 앞에 내용이나 스타일을 추가한다.
::after|특정 요소의 뒤에 내용이나 스타일을 추가한다.

<hr>

## 변형 함수
### translate() 함수: 요소 이동하기
<table>
    <tr>
        <td>transform: translate(tx, ty)</td>
        <td>지정한 크기 만큼 x축과 y축으로 이동한다.</td>
    </tr>
    <tr>
        <td>transform: translate(tx, ty, tz)</td>
        <td>지정한 크기 만큼 x축, y축, z축으로 이동한다.</td>
    </tr>
    <tr>
        <td>transform: translateX(tx)</td>
        <td>지정한 크기 만큼 x축으로 이동한다.</td>
    </tr>
    <tr>
        <td>transform: translateY(ty)</td>
        <td>지정한 크기 만큼 y축으로 이동한다.</td>
    </tr>
    <tr>
        <td>transform: translateZ(tz)</td>
        <td>지정한 크기 만큼 z축으로 이동한다.</td>
    </tr>
</table>

### scale() 함수: 요소 확대, 축소하기
<table>
    <tr>
        <td>transform: scale(sx, sy)</td>
        <td>지정한 크기 만큼 x축과 y축으로 확대, 축소한다.</td>
    </tr>
    <tr>
        <td>transform: scale(sx, sy, sz)</td>
        <td>지정한 크기 만큼 x축, y축, z축으로 확대, 축소한다.</td>
    </tr>
    <tr>
        <td>transform: scaleX(sx)</td>
        <td>지정한 크기 만큼 x축으로 확대, 축소한다.</td>
    </tr>
    <tr>
        <td>transform: scaleY(sy)</td>
        <td>지정한 크기 만큼 y축으로 확대, 축소한다.</td>
    </tr>
    <tr>
        <td>transform: scaleZ(sz)</td>
        <td>지정한 크기 만큼 z축으로 확대, 축소한다.</td>
    </tr>
</table>

### rotate() 함수: 요소 회전하기
<table>
    <tr>
        <td>transform: rotate(각도)</td>
        <td>지정한 각도만큼 회전한다.</td>
    </tr>
    <tr>
        <td>transform: rotateX(각도)</td>
        <td>x축을 기준으로 지정한 각도만큼 회전한다.</td>
    </tr>
    <tr>
        <td>transform: rotateY(각도)</td>
        <td>y축을 기준으로 지정한 각도만큼 회전한다.</td>
    </tr>
    <tr>
        <td>transform: rotateZ(각도)</td>
        <td>z축을 기준으로 지정한 각도만큼 회전한다.</td>
    </tr>
    <tr>
        <td>transform: rotate3d(rx, ry, rz, 각도)</td>
        <td>x축과 y축, z축을 기준으로 지정한 각도만큼 회전한다.</td>
    </tr>
</table>

### skew() 함수: 요소 비틀기
<table>
    <tr>
        <td>transform: skew(ax, ay)</td>
        <td>지정한 각도만큼 x축과 y축으로 비튼다.</td>
    </tr>
    <tr>
        <td>transform: skewX(ax)</td>
        <td>지정한 각도만큼 x축으로 비튼다.</td>
    </tr>
    <tr>
        <td>transform: skewY(ay)</td>
        <td>지정한 각도만큼 y축으로 비튼다.</td>
    </tr>
</table>


## 트랜지션 속성
종류|설명
---|---
transition-property|트랜지션의 적용 대상을 지정한다. 기본값은 all이다.
transition-duration|트랜지션의 실행 시간를 지정한다. 단위는 s(초)이고, 기본값은 0이다. 
transition-timing-function|트랜지션의 실행 형태를 지정한다.
transition-delay|트랜지션의 지연 시간을 지정한다. 단위는 s(초)이고, 기본값은 0이다.
transition|위의 4개의 속성을 한꺼번에 지정한다.

## 애니메이션 속성
종류|설명
---|---
@keyframes|애니메이션이 바뀌는 지점을 설정한다.
animation-delay|애니메이션의 시작 시간을 지정한다.
animation-direction|애니메이션을 종료한 뒤 처음부터 시작할지, 반대 방향으로 진행할지 지정한다.
animation-duration|애니메이션의 실행 시간을 지정한다. 단위는 s(초)이다.
animation-iteration-count|애니메이션의 반복 횟수를 지정한다.
animation-name|@keyframes로 설정해 놓은 중간 상태를 지정한다.
animation-timing-function|키프레임의 전환 형태를 지정한다.
animation|animation 속성을 한꺼번에 묶어서 지정한다.

<hr>

## 미디어 쿼리의 속성
종류|설명
---|---
width, height|웹 페이지의 가로 너비, 세로 높이
min-width, min-height|웹 페이지의 최소 너비, 최소 높이
max-width, max-height|웹 페이지의 최대 너비, 최대 높이
device-width, device-height|단말기의 가로 너비, 세로 높이
min-device-width, min-device-height|단말기의 최소 너비, 최소 높이
max-device-width, max-device-height|단말기의 최대 너비, 최대 높이
orientation: portrait|단말기의 세로 모드
orientation: landscape|단말기의 가로 모드

## 플렉스 박스 레이아웃의 속성
종류|설명|속성값
---|---|---
display|플렉스 컨테이너를 지정한다.|flex, inline-flex
flex-direction|플렉스 항목에서 주축과 방향을 지정한다.|row, row-reverse, column, column-reverse
flex-wrap|컨테이너 너비보다 항목이 많을 경우 줄 바꿈 여부를 지정한다.|nowrap, wrap, wrap-reverse
flex-flow|배치 방향과 줄 바꿈을 한번에 지정한다.|flex-direction 속성값과 flex-wrap 속성값사용
justify-content|주축에서 플렉스 항목 정렬 방법을 지정한다.|flex-start, flex-end, center, space-between, space-around
align-items|교차축에서 플렉스 항목 정렬 방법을 지정한다.|flex-start, flex-end, center, baseline, stretch
align-self|특정 플렉스 항목의 정렬 방법을 지정한다.|flex-start, flex-end, center, baseline, stretch
align-content|여러 줄일 때 교차축 정렬 방법을 지정한다.|flex-start, flex-end, center, space-between, space-around, stretch
flex|플렉스 항목의 너비를 줄이거나 늘린다.|1개에서 3개까지의 값, auto, initial

## CSS 그리드 레이아웃의 속성과 함수
종류|설명|속성값
---|---|---
display|그리드 컨테이너를 지정합니다.|grid, inline-grid
grid-template-columns|칼럼을 지정한다.|크깃값
grid-template-rows|줄 높이를 지정한다.|크깃값
grid-column-gap|칼럼과 칼럼 사이의 간격을 지정한다.|크깃값
grid-row-gap|줄과 줄 사이의 간격을 지정한다.|크깃값
grid-gap|칼럼과 줄 사이의 간격을 한꺼번에 지정한다.|크깃값
grid-column-start|칼럼 시작의 라인 번호를 지정한다.|숫자
grid-column-end|칼럼 마지막의 라인 번호를 지정한다.|숫자
grid-column|칼럼 시작 번호와 끝 번호 사이에 슬래시(/)를 넣어 사용한다.|숫자
grid-row-start|줄 시작의 라인 번호를 지정한다.|숫자
grid-row-end|줄 마지막의 라인 번호를 지정한다.|숫자
grid-row|줄 시작 번호와 줄 끝 번호 사이에 슬래시(/)를 넣어 사용한다.|숫자
grid-area|템플릿 이름을 지정한다.|
grid-template-areas|grid-area를 사용해 템플릿 그리드를 만든다.|
minmax()|최솟값과 최댓값을 지정하는 함수이다.|크깃값, auto
repeat()|같은 값을 여러 번 반복할 때 사용하는 함수이다.|크깃값, auto-fill, auto-fit

<hr>


# JavaScript
## 변수
* 변수(variable)란 프로그램을 실행하는 동안 값이 여러 번 달라질 수 있는 데이터를 말한다.
* 변수 작성 규칙
    1. 변수의 이름은 대소문자를 구별하여 작성한다.
    2. 영문자와 숫자, 언더스토어(_)만 사용하며, 숫자로 시작할 수 없다.
## 자료형
<table>
    <tr>
        <th colspan="2">종류</th>
        <th>설명</th>
    </tr>
    <tr>
        <td rowspan="3">기본 유형</td>
        <td>숫자형</td>
        <td>따옴표 없이 숫자로만 표시한다.</td>
    </tr>
    <tr>
        <td>문자열</td>
        <td>작은따옴표('')나 큰따옴표("")로 묶어서 나타낸다.</td>
    </tr>
    <tr>
        <td>논리형</td>
        <td>참(true)과 거짓(false)이란 2가지 값만 가진다.</td>
    </tr>
    <tr>
        <td rowspan="2">복합 유형</td>
        <td>배열</td>
        <td>하나의 변수에 여러 개의 값을 저장한다.</td>
    </tr>
    <tr>
        <td>객체</td>
        <td>함수와 속성들이 함께 포함된 자료형이다.</td>
    </tr>
    <tr>
        <td rowspan="2">특수 유형</td>
        <td>undefined</td>
        <td>데이터 유형이 지정되지 않았을 때의 상태를 나타낸다.</td>
    </tr>
    <tr>
        <td>null</td>
        <td>데이터 값이 유효하지 않은 상태를 나타낸다.</td>
    </tr>
</table>

## 연산자
종류|설명
---|---
산술 연산자|+, - *, /, %, ++, --
할당 연산자|=, +=, -=, *=, /=, %=
비교 연산자|==, !=. ===. !==. <, <=, >, >=
논리 연산자|!, &&, ||
조건 연산자|(조건) ? true일 때 실행할 명령 : false일 때 실행할 명령

## 조건문
* if 문
* if~else 문
* switch 문

## 반복문
* for 문
* while 문
* do~while 문
* break 문
* continue 문

<hr>

## 함수 선언하고 호출하기
```JavaScript
function 함수명(){
    명령
}

함수명() 또는 함수명(변수)
```
## var, let, const로 선언한 변수 비교
구분|var|let|const
---|---|---|---
스코프|함수 레벨|블록 레벨|블록 레벨
재할당|가능|가능|불가능
재선언|가능|불가능|불가능

## 함수 표현식
* 익명 함수: 이름 없이 선언한 함수
```JavaScript
function(매개변수) {명령}
```
* 즉시 실행 함수: 함수를 정의하는 것과 동시에 실행
```JavaScript
(function() {명령}());
또는
(function(매개변수) {명령}(인수));
```
* 화살표 함수: ES6부터 지원하는 방법으로 화살표 기호(=>) 왼쪽에는 매개변수를, 오른쪽에는 함수를 작성함. 익명 함수일 경우에만 사용 가능
```JavaScript
(매개변수) => {함수 내용}
```

## 이벤트와 이벤트 처리기
* 이벤트: 키보드에서 키를 누르거나 브라우저가 웹페이지를 불러오는 것처럼 웹 브라우저나 사용자가 행하는 동작
* 이벤트 처리기: 웹 문서에서 이벤트가 발생할 때 그 이벤트에 반응해서 실행하는 함수

<hr>

## 객체 알아보기
* 객체(object): 프로그램에서 인식할 수 있는 모든 대상
* 프로퍼티(property): 객체의 특징이나 속성
* 메서드(method): 객체에서 할 수 있는 동작
* 객체 인스턴스 만들기
    * new 객체명
* 객체의 프로퍼티와 메서드 사용하기
    * 객체.프로퍼티
    * 객체.메서드

## 자바스크립트의 내장 객체
종류|설명
---|---
window|브라우저 창이 열릴 때마다 하나씩 만들어진다. 브라우저 창 안의 요소 중에서 최상위에 있다.
document| 웹 페이지마다 하나씩 있으며 ```<body>``` 태그를 만나면 만들어진다. HTML 문서의 정보가 담겨있다.
navigator|현재 사용하는 브라우저의 정보가 들어있다.
history|현재 창에서 사용자의 방문 기록을 저장한다.
location|현재 페이지의 URL 정보가 담겨있다.
screen|현재 사용하는 화면 정보를 다룬다.

<hr>

## DOM 트리의 노드
* 요소 노드: 모든 HTML 태그를 의미한다.
* 텍스트 노드: 태그의 텍스트 내용이다.
* 속성 노드: 태그의 속성이다.
* 주석 노드: 주석이다.


## DOM에 접근하기
* ```getElementByID(id)```: id명으로 접근한다.
* ```getElementByClassName(class)```: 클래스명으로 접근하며 여러 요소가 배열 형태로 저장된다.
* ```getElementByTagName(tag)```: 태그명으로 접근하며 여러 요소가 배열 형태로 저장된다.
* ```querySelector()```: id명이나 선택자를 사용해 접근한다.
* ```querySelectorAll()```: 클래스명이나 태그명의 선택자를 사용해 접근한다. 여러 노드가 노드 리스트 형태로 저장된다.
* 속성 가져오기 및 수정하기
    * getAttribute(속성)
    * setAttribute(속성, 값)
* 이벤트 처리하기
    * 요소.addEventListener(이벤트, 함수, 캡처 여부)
* CSS 속성에 접근하기
    * document.요소명.style.속성명

## 텍스트 노드를 사용하는 새로운 요소 추가하기
순서|메서드|설명
---|---|---
1|createElement()|새로운 요소 노드를 만든다.
2|createTextNode()|새로운 텍스트 노드를 만든다.
3|appendChild()|텍스트 노드를 요소 노드의 자식으로 연결한다.
4|appendChild()|요소 노드를 DOM에 연결한다.

## 속성값이 있는 새로운 요소 추가하기
순서|메서드|설명
---|---|---
1|createElement()|새로운 요소 노드를 추가한다.
2|createAttribute()|새로운 속성 노드를 추가한다.
3|속성값 지정하기|속성값을 프로퍼티로 지정한다.
4|setAttributeNode()|속성 노드를 요소 노드의 자식으로 연결한다.
5|appendChild()|요소 노드를 DOM에 연결한다.

## 노드 삭제
* parentNode 프로퍼티로 부모 노드를 찾아서 부모 노드에서 삭제한다.
* 부모노드.removeChild(자식노드)