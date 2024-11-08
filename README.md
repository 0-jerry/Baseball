# 숫자 야구 게임 (Number Baseball Game)

## 프로그램 소개
이 프로그램은 Swift로 구현된 숫자 야구 게임입니다. 사용자는 컴퓨터가 무작위로 생성한 숫자를 맞추는 방식으로 게임이 진행됩니다.

## 주요 기능
1. 게임 시작하기
2. 게임 기록 보기
3. 종료하기

## 게임 규칙
- 기본적으로 3자리의 숫자를 맞추는 게임입니다.
- 각 자리는 0-9까지의 숫자를 사용할 수 있습니다.
- 첫 번째 자리에는 0이 올 수 없습니다.
- 각 자리의 숫자는 중복될 수 없습니다.
- 총 10번의 기회가 주어집니다.

### 판정 규칙
- Strike: 숫자와 위치가 모두 일치할 경우
- Ball: 숫자는 존재하지만 위치가 다를 경우
- Out: 일치하는 숫자가 하나도 없을 경우

## 프로그램 구조

### 주요 컴포넌트
1. **GameManager**
   - 전체 게임 진행을 관리
   - 게임 시작, 기록 보기, 종료 기능 제공

2. **GameRound**
   - `GameRound`가 초기화될 시 `TargetNumber`를 자동 생성해 저장
   - `JudgeResult`를 생성하여 사용자 입력 결과 판정
   - `GameResult`에 `JudgeResult`를 추가하여 판정 결과 반영

3. **GameHistory**
   - `GameResult`(게임기록)을 저장하고 관리하는 싱글톤 객체
   - 각 게임의 결과(성공/실패, 시도 횟수)를 저장

4. **Numbers**
   - `TargetNumber`: 컴퓨터가 생성하는 목표 숫자
   - `GuessNumber`: 사용자가 입력하는 추측 숫자

### 입력 처리 시스템
- `UserInputConvertible` 프로토콜을 통한 입력 검증 및 변환
- 각종 에러 처리 및 사용자 피드백 제공

## 확장 가능성
- GameStatus를 통해 게임의 난이도 조절 가능
  - `countOfNumbers`: 숫자의 자릿수 변경
  - `lifeFullCount`: 시도 횟수 변경

## 에러 처리
프로그램은 다음과 같은 상황에서 적절한 에러 메시지를 제공합니다:
- 부적절한 길이의 입력
- 첫 번째 자리에 0이 입력된 경우
- 중복된 숫자가 입력된 경우
- 숫자가 아닌 문자가 입력된 경우
- 잘못된 게임 명령이 입력된 경우

## 프로그램 실행 방법
1. 프로그램을 실행하면 메인 메뉴가 표시됩니다.
2. 원하는 메뉴의 번호를 입력하여 선택합니다.
3. 게임 시작 시 3자리의 숫자를 입력하여 게임을 진행합니다.
4. 게임 결과는 자동으로 저장되며, 기록 보기 메뉴에서 확인할 수 있습니다.

## 사용 모습

https://github.com/user-attachments/assets/7bb00014-b9ee-486c-a5d2-c29b2cd0491b
