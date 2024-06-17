enc() {
    if (( $# == 0 )) ; then
        openssl enc -aes-256-cbc -salt < /dev/stdin
    else
        openssl enc -aes-256-cbc -salt <<< "$1"
    fi
}
dec() {
    if (( $# == 0 )) ; then
        openssl enc -d -aes-256-cbc < /dev/stdin
    else
        openssl enc -d -aes-256-cbc <<< "$1"
    fi
}