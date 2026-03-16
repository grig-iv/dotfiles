function note
    set file $argv[1]
    set tmp (mktemp /tmp/note.XXXXXX)

    if not set -q _note_pass
        read -s -P "Passphrase: " _note_pass
        set -g _note_pass $_note_pass
    end

    if test -f $file
        openssl enc -d -aes-256-cbc -pbkdf2 -pass pass:$_note_pass -in $file -out $tmp 2>/dev/null
        if test $status -ne 0
            set -e _note_pass
            rm -f $tmp
            echo "Decryption failed"
            return 1
        end
    end

    nvim $tmp

    openssl enc -aes-256-cbc -pbkdf2 -pass pass:$_note_pass -in $tmp -out $file 2>/dev/null
    rm -f $tmp
end
