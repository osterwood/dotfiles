function ls --description 'List contents of directory'
    set -l param --color=auto
    command gls $param $argv
end

function ll
    set -l param --color=auto
    command ls -lh $param $argv
end