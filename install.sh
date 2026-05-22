#!/usr/bin/env bash
# ===================================================================
# ตัวช่วยติดตั้ง Magic MCP เข้า Claude Code (ฉบับภาษาไทย สำหรับมือใหม่)
# วิธีใช้:  bash install.sh
# ===================================================================
set -e

echo "🪄 ตัวช่วยติดตั้ง Magic MCP เข้า Claude Code"
echo "-----------------------------------------------"
echo "ขอ API Key ของคุณก่อนได้ที่: https://21st.dev/mcp"
echo ""

# ขอ API Key จากผู้ใช้ (ไม่เก็บลงไฟล์ ไม่ฝังในโค้ด)
read -r -p "👉 วาง API Key ของคุณตรงนี้แล้วกด Enter: " API_KEY

if [ -z "$API_KEY" ]; then
  echo "❌ คุณยังไม่ได้ใส่ API Key — ยกเลิกการติดตั้ง"
  echo "   ไปขอ API Key ได้ที่ https://21st.dev/mcp แล้วลองใหม่อีกครั้ง"
  exit 1
fi

# เช็กว่ามีคำสั่ง claude ไหม
if ! command -v claude >/dev/null 2>&1; then
  echo "❌ ไม่พบโปรแกรม 'claude' (Claude Code)"
  echo "   ติดตั้งก่อนที่ https://claude.com/claude-code แล้วลองใหม่"
  exit 1
fi

echo ""
echo "⏳ กำลังติดตั้ง Magic MCP..."
claude mcp add magic --scope user --env API_KEY="$API_KEY"

echo ""
echo "✅ ติดตั้งเสร็จแล้ว! กำลังตรวจสอบรายการ MCP..."
claude mcp list

echo ""
echo "🎉 เรียบร้อย! ถ้าเห็นคำว่า 'magic' ในรายการด้านบน = ใช้งานได้แล้ว"
