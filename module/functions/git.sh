# Git commit -am then push
gcampsh() {
    git commit -am "$1"
    git push
}

# Git commit -m then push
gcmpsh() {
    git commit -m "$1"
    git push
}

# Git add git commit -m the push
gagcmpsh() {
    git add .
    git commit -m "$1"
    git push
}

# Same as the 3 above but for the custom push aliases
# (i use them for projects i keep both on local hosting and gh)

###########################################################
# github master
gcampghms() {
    git commit -am "$1"
    git push github master
}

gcampghmspaipai() {
    git commit -am "$1"
    git push github master
    exit
}

gcmpghms() {
    git commit -m "$1"
    git push github master
}

gcmpghmspaipai() {
    git commit -m "$1"
    git push github master
    exit
}

gagcmpghms() {
    git add .
    git commit -m "$1"
    git push github master
}

gagcmpghmspaipai() {
    git add .
    git commit -m "$1"
    git push github master
    exit
}

###########################################################
# github main

gcampghmn() {
    git commit -am "$1"
    git push github main
}

gcampghmnpaipai() {
    git commit -am "$1"
    git push github main
    exit
}

gcmpghmn() {
    git commit -m "$1"
    git push github main
}

gcmpghmnpaipai() {
    git commit -m "$1"
    git push github main
    exit
}

gagcmpghmn() {
    git add .
    git commit -m "$1"
    git push github main
}

gagcmpghmnpaipai() {
    git add .
    git commit -m "$1"
    git push github main
    exit
}

###########################################################
# origin master

gcampogms() {
    git commit -am "$1"
    git push origin master
}

gcampogmspaipai() {
    git commit -am "$1"
    git push origin master
    exit
}

gcmpogms() {
    git commit -m "$1"
    git push origin master
}

gcmpogmspaipai() {
    git commit -m "$1"
    git push origin master
    exit
}

gagcmpogms() {
    git add .
    git commit -m "$1"
    git push origin master
}

gagcmpogmspaipai() {
    git add .
    git commit -m "$1"
    git push origin master
    exit
}

###########################################################
# origin main

gcampogmn() {
    git commit -am "$1"
    git push origin main
}

gcampogmnpaipai() {
    git commit -am "$1"
    git push origin main
    exit
}

gcmpogmn() {
    git commit -m "$1"
    git push origin main
}

gcmpogmnpaipai() {
    git commit -m "$1"
    git push origin main
    exit
}

gagcmpogmn() {
    git add .
    git commit -m "$1"
    git push origin main
}

gagcmpogmnpaipai() {
    git add .
    git commit -m "$1"
    git push origin main
    exit
}

# Generic dir git log
glgdir() {
    local oldpwd="$(pwd)"
    builtin cd "$1" || return
    git log
    builtin cd "$oldpwd" || return
}

# Generic dir git log reverse
glgrdir() {
    local oldpwd="$(pwd)"
    builtin cd "$1" || return
    git log --reverse
    builtin cd "$oldpwd" || return
}

# Generic dir git show head
gshhdir() {
    local oldpwd="$(pwd)"
    builtin cd "$1" || return
    git show HEAD
    builtin cd "$oldpwd" || return
}

# Git log in configs
glgcfgs() {
    glgdir ~/configs
}

# Git log reverse in configs
glgrcfgs() {
    glgrdir ~/configs
}

# Git show HEAD in configs
gshhcfgs() {
    gshhdir ~/configs
}
