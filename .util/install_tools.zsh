install_tools() {
  tools=(
    bat
    btop
    ctop
    eza
    fzf
    gng
    hurl
    k9s
    nushell
    thefuck
    zoxide
  )

  if ! brew tap-info gdubw/gng &> /dev/null; then
    brew tap gdubw/gng
  fi

  missing_tools=()
  for tool in "${tools[@]}"; do
    if ! brew list --formula | grep -q "^${tool}\$"; then
      missing_tools+=($tool)
    fi
  done

  # Install missing tools in parallel
  if [ ${#missing_tools[@]} -gt 0 ]; then
    echo "${missing_tools[@]}" | xargs -n 1 -P 4 brew install
  fi
}

install_tools
