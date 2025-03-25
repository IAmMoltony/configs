@echo off

setlocal enabledelayedexpansion

rem I am dead fucking serious

rem ~=~= main code =~=~

rem In this part we make the random numbers
set /a "number_a=%random% %% 10"
set /a "number_b=%random% %% 10"

rem Here we choose operator
set /a "opindex=%random% %% 2"
if %opindex%==0 (
    set "operator=+"
    set /a "realanswerwhichisdefinitelycorrect=number_a + number_b"
) else (
    set "operator=-"
    set /a "realanswerwhichisdefinitelycorrect=number_a - number_b"
)

rem the rest of this script

set "losercounter=0"
set "wrongcounter=0"

:question_loop
echo|set /p="%number_a% %operator% %number_b% = "
set /p "usersanswerwhichisprobablyincorrect="

rem Check if it's a number
for /f "delims=0123456789-" %%A in ("%usersanswerwhichisprobablyincorrect%") do (
    echo Wtf?
    set /a "losercounter+=1"
    if %losercounter% GEQ 5 (
        call :mathtestfailure
        exit /b
    )
    goto question_loop
)

rem Check if it's correct
if not "%usersanswerwhichisprobablyincorrect%"=="%realanswerwhichisdefinitelycorrect%" (
    set /a "losercounter+=1"
    if %losercounter% GEQ 5 (
        call :mathtestfailure
        exit /b
    )

    set /a "wrongcounter+=1"
    setlocal disabledelayedexpansion
    echo|set /p="That ain't correct mate! Try again you "
    setlocal enabledelayedexpansion
    call :random_insult
    setlocal disabledelayedexpansion
    echo !
    setlocal enabledelayedexpansion
    goto question_loop
)

rem 5% chance to slip its mind
set /a "randomchance=%random% %% 100"
if %randomchance% LSS 5 (
    echo That totally slipped my mind. Try again.
    goto question_loop
)

setlocal disabledelayedexpansion
echo Correct! Continue with whatever the hell you were doing.

exit

rem ~=~= FUNCTIONS =~=~

rem = = = = = = = FUNCTION RANDOM INSULT = = = = = = =

:random_insult
set insults[0]=big doofus
set insults[1]=disappointment
set insults[2]=failure
set insults[3]=garbage truck
set insults[4]=stupid
set insults[5]=cabbagehead
set insults[6]=silly goose
set insults[7]=clown
set insults[8]=potato brain
set insults[9]=cirno
set insults[10]=fricking lunatic
set insults[11]=drongo

set /a "rand=%random% %% 12"
echo|set /p="!insults[%rand%]!"

exit /b

rem = = = = = = = FUNCTION MATH TEST FAILURE = = = = = = =

:mathtestfailure
echo You just failed the math test. You should be ashamed.
exit /b

rem = = = = = = = FUNCTION NUMBER BUT VERY INSULTINGLY = = = = = = =
:number_but_very_insultingly

set "number=%~1"
set "result="

rem I love faking arrays
set digit_0=ZERO
set digit_1=ONE
set digit_2=TWO
set digit_3=THREE
set digit_4=FOUR
set digit_5=FIVE
set digit_6=SIX
set digit_7=SEVEN
set digit_8=EIGHT
set digit_9=NINE

:loop
if "%number%"=="" goto done
set "num=%number:~0,1%"
set "number=%number:~1%"
if defined num set "result=!result!!digit_%num%! "
goto loop

:done
echo %result%
exit /b
