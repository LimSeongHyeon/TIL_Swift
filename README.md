#  Today I Learned
##### <shot7351@gmail.com>

## 문제
##### 원인 파악 불가
- SomeThing
<br/>

##### 원인 파악 되어짐
 - [22-08-09] RichTextView를 이용하여 동적 할당(Foreach) 사용시 문제 발생
 	- 추측 1: UIViewRepresentable에서의 NSMutableAttributedString을 바인딩 하여 사용하는 것이 필수 불가결 하다.<br/>

 	- 추측 2: UIViewRepresentable이 동적으로 할당될 때, 인덱싱이 이루어지지 않아 메인 쓰레드에 의해 UI가 보여질 때 참조되어지지 못한다. (바인딩을 걸고, .constant를 사용하여 해결한다.)
<br/>

##### 해결됨
- SomeThing
<br/>

## 참조
- [UI Representable : Using Swift UIKit](https://ally10.tistory.com/43, "UI Representable")
- [RichTextView : Example](https://iosexample.com/ios-text-view-uiview-that-properly-displays-latex-and-youtube-vimeo-links/, "RichTextView : Example")

