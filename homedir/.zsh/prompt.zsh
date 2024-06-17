function nord_get_pwd() {
    echo -n "🚀 %F{cyan}$USER%f in %F{cyan}${PWD/$HOME/~}"
}

function nord_get_branch() {
    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ "$branch" != "" ]; then
        echo -n " %fon %F{red} ${branch}"
    fi
}

function nord_get_git_status() {
    local staged=$(git status --porcelain 2>/dev/null | grep -e "^[MADRCU]")
    local unstaged=$(git status --porcelain 2>/dev/null | grep -e "^[MADRCU? ][MADRCU?]")

    local string_builder="["
    if [[ -n ${unstaged} ]]; then
        string_builder+="?"
    fi
    if [[ -n ${staged} ]]; then
        string_builder+="!"
    fi
    string_builder+="]"

    if [ "$string_builder" != "[]" ]; then
        echo -n " ${string_builder}"
    fi
}

function nord_get_time() {
    DATE=$( date +"%H:%M:%S" )
    echo -n "%F{cyan}${DATE}"
}

function nord_get_indicator() {
    echo -n "%F{cyan}❯"
}


function precmd {
    RPROMPT="$(nord_get_time)"
    PROMPT="$(nord_get_pwd)$(nord_get_branch)$(nord_get_git_status)
$(nord_get_indicator) %f"
}