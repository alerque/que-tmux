jpane () {
  local panes target target_window target_pane
  panes=$(tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}' | grep -v "^$(tmux display-message  -p '#I'):")
  target=$(echo "$panes" | fzf) || return
  target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
  target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)
  tmux join-pane -s :${target_window}.${target_pane}
}
