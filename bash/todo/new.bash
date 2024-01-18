new() {
  local v="$1"
  if [ -z "$v" ]; then
    echo "mod_new: missing args <subcommand>" 
  else
    new_$v "${@:2}"
  fi
}

new_mod() {
  local v="$1"
  local mod=$chk_bash_mods_path/$v.mod
  if [ -z "$v" ]; then
    echo "mod_new: missing args <bash_mod_name>"
  else
    vi $mod
  fi
}

new_window() {
  local v="$1"
  if [ -z "$v" ]; then
    echo "mod_new: missing args <window_name>"
  else
    tmux new-window -n $v
  fi
}

new_react() {
  local name="$1"
  if [ -z "$name" ]; then
    echo "new_react: must provide a app name"
    return
  fi
  echo "=> Cloning React template"
  if [ -d "$name" ]; then
    echo "Error: dir $name already exists"
    return
  fi
  npx degit --mode=git NexFactory/react-storybook -- $name
  echo "=> Done"
  echo ""
}

new_react2() {
  _new_vite "$1" react
}

new_vue() {
  _new_vite "$1" vue
}

new_mux() {
  mux new
}

new_jekyll() {
  local dir="$1"
  if [ -z "$dir" ]; then
    echo "new_jekyll: must provide a site name"
    return
  fi
  cp -r ~/new/tpl-jk-tailwind-blank $dir
  cd $dir
  git status
}

# private
_new_vite() {
  local name="$1"
  local tpl="$2"
  if [ -z "$name" ]; then
    echo "new_vite: must provide a app name"
    return
  elif [ -z "$tpl" ]; then
    echo "new_vite: must provide a template name"
    return
  else
    echo "=> Creating a Vite project"
    echo "Using template: $tpl"
    echo ""
    npx yarn create vite $name --template $tpl
  fi
}

