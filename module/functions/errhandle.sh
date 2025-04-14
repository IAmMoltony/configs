bferrorhdlr() {
    echo " ! Functions Init error on line $1"
    ((BashFunctionsNumErrors++))
}

trap 'bferrorhdlr $LINENO' ERR
