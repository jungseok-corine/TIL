#!/bin/bash

# TIL 자동화 스크립트
# 사용법: ./til.sh [Week] [Day]
# 예시: ./til.sh 1 2

# 인자 검증
if [ $# -ne 2 ]; then
    echo "사용법: ./til.sh [Week] [Day]"
    echo "예시: ./til.sh 1 2 (Week1 Day2)"
    exit 1
fi

WEEK=$1
DAY=$2

# Week/Day 범위 검증
if [ "$WEEK" -lt 1 ] || [ "$WEEK" -gt 20 ]; then
    echo "❌ Week는 1-20 사이여야 합니다."
    exit 1
fi

if [ "$DAY" -lt 1 ] || [ "$DAY" -gt 7 ]; then
    echo "❌ Day는 1-7 사이여야 합니다."
    exit 1
fi

# 날짜 계산
BASE_DATE="2025-10-27"  # Day1 기준일
DAYS_TO_ADD=$(( (WEEK - 1) * 7 + (DAY - 1) ))

# macOS date 명령어로 날짜 계산
if [[ "$OSTYPE" == "darwin"* ]]; then
    CALC_DATE=$(date -j -v+${DAYS_TO_ADD}d -f "%Y-%m-%d" "$BASE_DATE" "+%Y-%m-%d")
else
    CALC_DATE=$(date -d "$BASE_DATE + $DAYS_TO_ADD days" "+%Y-%m-%d")
fi

# Week/Day 폴더/파일명 (두 자리)
WEEK_DIR=$(printf "Week%d" $WEEK)
DAY_FILE=$(printf "Day%d.md" $DAY)
FILE_PATH="$WEEK_DIR/$DAY_FILE"

# Week 폴더 생성 (없으면)
if [ ! -d "$WEEK_DIR" ]; then
    mkdir -p "$WEEK_DIR"
    echo "📁 $WEEK_DIR 폴더 생성"
fi

# 파일 존재 확인
if [ -f "$FILE_PATH" ]; then
    echo "⚠️  $FILE_PATH 파일이 이미 존재합니다."
    exit 0
fi

# TIL 템플릿 생성
cat > "$FILE_PATH" << EOF
# $CALC_DATE iOS + AI Day $DAY

## 📚 오늘 배운 것

### iOS (3.5시간)
-

### AI (1.5시간)
-

## 💻 코드
\`\`\`swift
// 핵심 코드
\`\`\`

## 🤔 어려웠던 점
-

## 💡 해결 방법
-

## ✅ 체크리스트
- [ ]
- [ ] GitHub 커밋

## 📝 내일 할 것
-
EOF

echo "✅ $FILE_PATH 생성 완료! (날짜: $CALC_DATE)"
