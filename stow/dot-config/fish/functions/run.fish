function run
    if test -e "./main.go"
        commandline -r "go run ."
        commandline -f execute
    else if  test -e "./bun.lock"
        commandline -r "bun run dev"
        commandline -f execute
    end
end
