function push
    if test -z "$argv[1]"
        echo "Usage: push <commit_message>"
        return
    end
    git add .
    git commit -m "$argv"
    git push
end
