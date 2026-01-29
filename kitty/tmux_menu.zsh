_sanitize_tmux_name() {
  local n="$1"
  n="${n//[^A-Za-z0-9._-]/-}"
  [[ -z "$n" ]] && n="session"
  echo "$n"
}

_tmux_sessions() {
  tmux ls -F '#S' 2>/dev/null || true
}

tmux_menu_run() {
  local mode="${TMUX_MENU_MODE:-chooser}"

  case "$mode" in
    chooser)
      local sessions menu choice
      sessions="$(_tmux_sessions)"
      menu=$(
        echo "[new] 新建 session（输入名称）"
        echo "[pwd] 新建 session（按当前目录）"
        [[ -n "$sessions" ]] && echo "$sessions"
      )

      choice="$(echo "$menu" | fzf --prompt='TMUX > ' --height=60% --reverse --border \
        --header='Enter=确认 | ESC=退出（不进入 tmux）')"

      [[ -z "$choice" ]] && return 0

      case "$choice" in
        *"[pwd]"*)
          local name="${PWD:t}"
          name="$(_sanitize_tmux_name "$name")"
          exec tmux new -A -s "$name" -c "$PWD"
          ;;
        *"[new]"*)
          echo -n "Session name: "
          local input_name
          read -r input_name
          input_name="$(_sanitize_tmux_name "$input_name")"
          exec tmux new -A -s "$input_name" -c "$PWD"
          ;;
        *)
          exec tmux attach -t "$choice"
          ;;
      esac
      ;;
    new)
      echo -n "Session name: "
      local input_name
      read -r input_name
      input_name="$(_sanitize_tmux_name "$input_name")"
      exec tmux new -A -s "$input_name" -c "$PWD"
      ;;
    pwd)
      local name="${PWD:t}"
      name="$(_sanitize_tmux_name "$name")"
      exec tmux new -A -s "$name" -c "$PWD"
      ;;
    attach)
      local session
      session="$(_tmux_sessions | fzf --prompt='attach > ' --height=60% --reverse --border)"
      [[ -z "$session" ]] && return 0
      exec tmux attach -t "$session"
      ;;
    *)
      echo "Unknown TMUX_MENU_MODE=$mode"
      sleep 1
      ;;
  esac
}

