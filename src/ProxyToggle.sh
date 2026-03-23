#!/bin/bash

SERVICE=$(networksetup -listallnetworkservices | grep -E "Wi-Fi|Ethernet" | head -n 1)
STATUS=$(networksetup -getwebproxy "$SERVICE" | grep "^Enabled:" | awk -F": " '{print $2}')

if [ "$STATUS" = "Yes" ]; then
  CURRENT_STATUS="🟢 Proxy LIGADO"
  ACTION="Desligar"
else
  CURRENT_STATUS="🔴 Proxy DESLIGADO"
  ACTION="Ligar"
fi

CHOICE=$(osascript 2>/dev/null <<EOF
tell application "System Events"
  activate
  set theResponse to display dialog "$CURRENT_STATUS\n\nServidor: 127.0.0.1:8080\nInterface: $SERVICE" buttons {"Cancelar", "$ACTION Proxy"} default button 2 with title "Controle de Proxy"
  set theButton to button returned of theResponse
  return theButton
end tell
EOF
)

if [[ "$CHOICE" == *"$ACTION"* ]]; then
  if [ "$STATUS" = "Yes" ]; then
    networksetup -setwebproxystate "$SERVICE" off
    networksetup -setsecurewebproxystate "$SERVICE" off
    osascript -e 'display notification "Proxy desligado com sucesso" with title "Proxy Toggle" sound name "Glass"' 2>/dev/null
  else
    networksetup -setwebproxy "$SERVICE" 127.0.0.1 8080
    networksetup -setsecurewebproxy "$SERVICE" 127.0.0.1 8080
    networksetup -setwebproxystate "$SERVICE" on
    networksetup -setsecurewebproxystate "$SERVICE" on
    osascript -e 'display notification "Proxy ligado com sucesso" with title "Proxy Toggle" sound name "Glass"' 2>/dev/null
  fi
fi
