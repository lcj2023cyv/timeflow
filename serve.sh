#!/bin/bash
PORT=8080
cd "$(dirname "$0")"

# Get local IP
if command -v ipconfig &> /dev/null; then
  IP=$(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null)
else
  IP=$(hostname -I 2>/dev/null | awk '{print $1}')
fi

clear
echo ""
echo "  ┌──────────────────────────────────────┐"
echo "  │         ⏱  TimeFlow PWA Demo         │"
echo "  ├──────────────────────────────────────┤"
echo "  │                                      │"
echo "  │  1. Öffne Safari auf dem iPhone      │"
echo "  │                                      │"
echo "  │  2. Gib ein:                         │"
printf "  │     http://%-25s│\n" "${IP}:${PORT}"
echo "  │                                      │"
echo "  │  3. Warte bis Seite geladen ist      │"
echo "  │                                      │"
echo "  │  4. Teilen (⬆️) → Zum Home-Bildschirm │"
echo "  │                                      │"
echo "  │  5. Vom Home-Bildschirm öffnen       │"
echo "  │     → läuft ab jetzt OFFLINE!        │"
echo "  │                                      │"
echo "  │  Beenden: Ctrl+C                     │"
echo "  └──────────────────────────────────────┘"
echo ""
echo "  Server läuft auf http://${IP}:${PORT}"
echo ""

python3 -m http.server $PORT
