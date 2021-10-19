***Settings***
Resource            base.robot

Test Setup          New Session
Test Teardown       End Session

***Test Cases***
Login com Sucesso
    Go to                       ${url}/login
    Input text                  css:input[name=username]            stark
    Input text                  css:input[name=password]            jarvis!
    Click Element               class:btn-login
    Page Should Contain         Olá, Tony Stark. Você acessou a área logada!

Senha Inválida
    [tags]                      password_error
    Go to                       ${url}/login
    Input text                  css:input[name=username]            stark
    Input text                  css:input[name=password]            0123
    Click Element               class:btn-login

    ${message}                  Get WebElement                     id:flash
    Should Contain              ${message.text}                    Senha é invalida!

Usuário Não existe
    [tags]                      user_error
    Go to                       ${url}/login
    Input text                  css:input[name=username]            theo
    Input text                  css:input[name=password]            jarvis!
    Click Element               class:btn-login

    ${message}                  Get WebElement                     id:flash
    Should Contain              ${message.text}                    O usuário informado não está cadastrado!

#   cmd to run the whole tests:  robot -d ./log test/login_forms.robot
#   CMD to run just test with TAGS:  robot -d ./log -i login_error tests