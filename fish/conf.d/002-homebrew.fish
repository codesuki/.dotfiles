if type -q brew
    eval "$(/opt/homebrew/bin/brew shellenv)"
    fish_add_path (brew --prefix rustup)/bin
end
